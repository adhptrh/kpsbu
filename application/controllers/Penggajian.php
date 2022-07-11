<?php 
class Penggajian extends CI_Controller
{
    public function index()
    {
        $bulantahun = $this->input->get("bulantahun") ?? date("Y-m");
        $pegawai = $this->db->query("SELECT a.*, b.tanggal as tgl_gaji FROM pegawai a LEFT JOIN tb_penggajian b ON b.nm_pegawai = a.nama AND tanggal LIKE '$bulantahun%' GROUP BY a.nama")->result();
        $pegawais = [];
        foreach ($pegawai as $pgw) {
            $pegawais[$pgw->nip] = $this->slip_gaji($pgw->nip,$bulantahun);
        }
        $data = [
            'pegawai' => $pegawai,
            'pegawaidetail' => $pegawais,
            "bulantahun" => $bulantahun,
        ];
        $this->template->load('template', 'penggajian/index', $data);
    }

    /* public function slip_gaji()
    {
        $nips = $this->input->post("nip");
        foreach ($nips as $value) {
            $this->slip_gaji_go($value);
        }
    } */

    public function slip_gaji($nip, $periode) {

        $pegawai = $this->db->query("SELECT * FROM pegawai WHERE nip = '$nip'")->result()[0];
        $ketptkp = $pegawai->id_jenis_pegawai == "Kontrak" ? "Tidak Kena Pajak" : "Kena Pejak";
        $tunjanganjabatan = $this->db->query("SELECT * FROM tb_jabatan WHERE `desc` LIKE '".$pegawai->id_jabatan."'")->result()[0];
        $pegawai = $this->db->query("SELECT a.id_jenis_pegawai, a.pendidikan, c.tunjangan_jabatan, c.tunjangan_kesehatan, b.gaji_pokok FROM pegawai a JOIN tb_jenis_pegawai b ON a.id_jenis_pegawai = b.desc JOIN tb_jabatan c ON a.id_jabatan = c.desc WHERE a.nip = '$nip' ")->result()[0];
        $nominal_ptkp = $this->db->query("SELECT * FROM tb_ptkp a JOIN pegawai b ON b.id_ptkp = a.desc WHERE b.nip = '$nip' ")->result()[0]->nominal ?? 0;
        $tunjanganhariraya = $this->db->query("SELECT * FROM tunjangan_hari_raya WHERE tanggal LIKE '".$periode."%' AND nip = '$nip'")->result()[0]->nominal ?? 0;
        $bonus = $this->db->query("SELECT a.nominal FROM tb_detail_pengajuan_bonus a JOIN pengajuan_bonus b ON a.id_pengajuan = b.id_pengajuan WHERE a.nip = '$nip' AND b.periode LIKE '".$periode."%'")->result()[0]->nominal ?? 0;
        $gajipokok = $this->db->query("SELECT * FROM tb_jenis_pegawai a WHERE a.desc LIKE '".$pegawai->id_jenis_pegawai."' AND a.pendidikan LIKE '".$pegawai->pendidikan."'")->result();
        if (count($gajipokok) > 0) {
            $gajipokok = $gajipokok[0]->gaji_pokok;
        } else {
            $gajipokok = 0;
        }
        $ketptkp = $pegawai->id_jenis_pegawai == "Kontrak" ? "Tidak Kena Pajak" : "Kena Pejak";
        $tunjanganjabatan = $pegawai->tunjangan_jabatan;
        $tunjangankesehatan = $pegawai->tunjangan_kesehatan;
        $totalbruto = $gajipokok+$tunjangankesehatan+$tunjanganjabatan+$bonus;
        //$totalnettosetahun = ($totalnetto*12)+$tunjanganhariraya;
        $totalbrutosetahun = ($totalbruto*12)+$tunjanganhariraya;
        $biayajabatan = $totalbrutosetahun*0.05;
        if ($biayajabatan > 6000000) $biayajabatan = 6000000;
        $totalnetto = $totalbrutosetahun-$biayajabatan;
        $ptkp = $nominal_ptkp;
        //$pkp = $totalnettosetahun-$ptkp;
        //$pkp = $totalnettosetahun-$ptkp;
        $pkp = $totalnetto-$ptkp;
        $pph21 = 0;
        if ($pkp < 50000000) {
            $pph21 = $pkp*0.05;
        } elseif ($pkp >= 50000000 && $pkp < 250000000) {
            $pph21 = 2500000+(($pkp-50000000)*0.15);
        }  elseif ($pkp >= 250000000 && $pkp < 500000000) {
            $pph21 = 32500000+(($pkp-250000000)*0.25);
        }  elseif ($pkp >= 500000000) {
            $pph21 = 95000000+(($pkp-500000000)*0.35);
        }
        $pph21 = $pph21/12;
        $pph21 = $pegawai->id_jenis_pegawai == "Kontrak" ? 0:$pph21;
        if ($totalnetto < $ptkp) {
            $pph21 = 0;
        }

        $gaji = $totalbruto;
        $gajibersih = $gaji+$tunjanganhariraya-$pph21;

        $data = [
            "gajipokok" => $gajipokok,
            "tunjangankesehatan" => $tunjangankesehatan,
            "tunjanganjabatan" => $tunjanganjabatan,
            "tunjanganhariraya" => $tunjanganhariraya,
            "totalbruto" => $totalbruto,
            "biayajabatan" => $biayajabatan,
            "totalnetto" => $totalnetto,
            "ptkp" => $nominal_ptkp,
            "penghasiltidakkenapajak" => $pkp,
            "pph21" => $pph21,
            "gajibersih"=>$gajibersih,
            "bonus"=>$bonus,
            "nip"=>$nip,
        ];
        return $data;
        
    }

    public function slip_gaji2($nip)
    {
        $this->db->where('nip', $nip);
        $peg = $this->db->get('pegawai')->row();
        $detilPeg = $this->Absensi_model->getDetailPegawai($nip)->row();
        // print_r($peg);exit;
        $q = "SELECT a.*, gaji_pokok, tunjangan_jabatan, tunjangan_kesehatan, b.desc, b.nominal
        FROM pegawai a
        LEFT JOIN tb_jenis_pegawai c ON c.desc = a.id_jenis_pegawai
        LEFT JOIN tb_jabatan d ON d.desc = a.id_jabatan
        LEFT JOIN tb_ptkp b ON a.id_ptkp = b.desc
        WHERE nip = '$nip'
        ORDER BY a.id ASC
        ";
        $result = $this->db->query($q)->result();
        foreach ($result as $data) {
            $month = date('Y-m');
            // $tbBonus = $this->db->query("select sum(nominal) as nominal, nip, periode from pengajuan_bonus where periode = '$month' and nip ='$data->nip'")->row();
            $tbBonus = $this->db->query("select sum(a.nominal) as nominal, a.nip, a.periode 
            from pengajuan_bonus a
            JOIN tb_detail_pengajuan_bonus b ON a.id_pengajuan = b.id_pengajuan
            where periode = '$month' and a.nip ='$data->nip'")->row();
            if (is_null($tbBonus->nominal)) {
                $bonus = 0;
            } else {
                $bonus = $tbBonus->nominal;
            }
            $lembur = 0;
            // $tbLembur = $this->db->query("select sum(total_nominal_lembur) as total from tb_lembur where left(tgl_pengajuan, 7) = '2022-05' and id_pegawai = '111'")->row();
            // if (is_null($tbLembur->total)) {
            //     $lembur = 0;
            // } else {
            //     $lembur = $tbLembur->total;
            // }
            $ptkp1 = $data->nominal;
            $tambah = $data->gaji_pokok + $data->tunjangan_jabatan + $data->tunjangan_kesehatan;
            $pengurang = (5/100 * $tambah);
            $penghasilan_perbulan = ($tambah - $pengurang);

            $atuatu = 50000000/12;
            $duadua = 250000000/12;
            $tigatiga = 500000000/12;

            if($penghasilan_perbulan > $ptkp1){
                $hasilptkp = $penghasilan_perbulan - $ptkp1;
                if($hasilptkp < $atuatu){
                    $satu = $hasilptkp * 5/100;
                    $akhir = round($satu);
                }
                elseif($hasilptkp > $atuatu AND $hasilptkp < $duadua){
                    $satu = $atuatu *5/100;
                    $dua = ($hasilptkp - $atuatu) * 15/100;
                    $akhir = round($satu + $dua);
                }
                elseif($hasilptkp > $duadua AND $hasilptkp < $tigatiga){
                    $satu = $atuatu *5/100;
                    $dua = $duadua * 15/100;
                    $tiga = ($hasilptkp - $atuatu - $duadua) * 25/100;
                    $akhir = round($satu + $dua + $tiga);
                }
                else{
                    $satu = $atuatu *5/100;
                    $dua = $duadua * 15/100;
                    $tiga = $tigatiga * 25/100;
                    $empat = ($hasilptkp - $satu - $dua - $tiga) * 30/100;
                    $akhir = round($satu + $dua + $tiga + $empat);
                }
            }else{
                $akhir = 0;
            }

            if (!empty($data->id_ptkp)) {
                # code...
                $hasil_ptkp = $akhir;
            } else {
                # code...
                $hasil_ptkp = 0;
            }
            
            
            $bonus = $bonus;
            $lemburfix = $lembur;
            $total = ($tambah + $bonus + $lembur) - ($hasil_ptkp);
            $data = [
                'peg' => $peg,
                'detil' => $detilPeg,
                'ptkp' => $hasil_ptkp,
                'detail2' => $result,
                'total' => $total,
                'bonus' => $bonus, 
                'lembur' => $lemburfix
            ];
            $this->template->load('template', 'penggajian/sip_gaji', $data);
        }
    }
    public function slip_gaji_go($nip)
    {
        $this->db->where('nip', $nip);
        $peg = $this->db->get('pegawai')->row();
        $detilPeg = $this->Absensi_model->getDetailPegawai($nip)->row();
        // print_r($peg);exit;
        $q = "SELECT a.*, gaji_pokok, tunjangan_jabatan, tunjangan_kesehatan, b.desc, b.nominal
        FROM pegawai a
        LEFT JOIN tb_jenis_pegawai c ON c.desc = a.id_jenis_pegawai
        LEFT JOIN tb_jabatan d ON d.desc = a.id_jabatan
        LEFT JOIN tb_ptkp b ON a.id_ptkp = b.desc
        WHERE nip = '$nip'
        ORDER BY a.id ASC
        ";
        $result = $this->db->query($q)->result();
        foreach ($result as $data) {
            $month = date('Y-m');
            // $tbBonus = $this->db->query("select sum(nominal) as nominal, nip, periode from pengajuan_bonus where periode = '$month' and nip ='$data->nip'")->row();
            $tbBonus = $this->db->query("select sum(a.nominal) as nominal, a.nip, a.periode 
            from pengajuan_bonus a
            JOIN tb_detail_pengajuan_bonus b ON a.id_pengajuan = b.id_pengajuan
            where periode = '$month' and a.nip ='$data->nip'")->row();
            if (is_null($tbBonus->nominal)) {
                $bonus = 0;
            } else {
                $bonus = $tbBonus->nominal;
            }
            $lembur = 0;
            // $tbLembur = $this->db->query("select sum(total_nominal_lembur) as total from tb_lembur where left(tgl_pengajuan, 7) = '2022-05' and id_pegawai = '111'")->row();
            // if (is_null($tbLembur->total)) {
            //     $lembur = 0;
            // } else {
            //     $lembur = $tbLembur->total;
            // }
            $ptkp1 = $data->nominal;
            $tambah = $data->gaji_pokok + $data->tunjangan_jabatan + $data->tunjangan_kesehatan;
            $pengurang = (5/100 * $tambah);
            $penghasilan_perbulan = ($tambah - $pengurang);

            $atuatu = 50000000/12;
            $duadua = 250000000/12;
            $tigatiga = 500000000/12;

            if($penghasilan_perbulan > $ptkp1){
                $hasilptkp = $penghasilan_perbulan - $ptkp1;
                if($hasilptkp < $atuatu){
                    $satu = $hasilptkp * 5/100;
                    $akhir = round($satu);
                }
                elseif($hasilptkp > $atuatu AND $hasilptkp < $duadua){
                    $satu = $atuatu *5/100;
                    $dua = ($hasilptkp - $atuatu) * 15/100;
                    $akhir = round($satu + $dua);
                }
                elseif($hasilptkp > $duadua AND $hasilptkp < $tigatiga){
                    $satu = $atuatu *5/100;
                    $dua = $duadua * 15/100;
                    $tiga = ($hasilptkp - $atuatu - $duadua) * 25/100;
                    $akhir = round($satu + $dua + $tiga);
                }
                else{
                    $satu = $atuatu *5/100;
                    $dua = $duadua * 15/100;
                    $tiga = $tigatiga * 25/100;
                    $empat = ($hasilptkp - $satu - $dua - $tiga) * 30/100;
                    $akhir = round($satu + $dua + $tiga + $empat);
                }
            }else{
                $akhir = 0;
            }

            if (!empty($data->id_ptkp)) {
                # code...
                $hasil_ptkp = $akhir;
            } else {
                # code...
                $hasil_ptkp = 0;
            }
            
            
            $bonus = $bonus;
            $lemburfix = $lembur;
            $total = ($tambah + $bonus + $lembur) - ($hasil_ptkp);
            $data = [
                'peg' => $peg,
                'detil' => $detilPeg,
                'ptkp' => $hasil_ptkp,
                'detail2' => $result,
                'total' => $total,
                'bonus' => $bonus, 
                'lembur' => $lemburfix
            ];
            return $data;
        }
    }

    public function bayar_semua_gaji() {
        $nips = $this->input->post("nip");
        $bulantahun = $this->input->post("bulantahun");
        $id_gaji = $this->Absensi_model->id_gaji();
        $total = 0;
        foreach ($nips as $nip) {
            $data = $this->slip_gaji($nip,date("Y-m"));
            $total += $data["gajibersih"];
            $this->bayar_gaji2($data,$id_gaji);
            echo $data["nip"];
            echo "<br>";
        }
        $tanggal = date('Y-m-d');
        $pengajuan = [
            'kode' => $id_gaji,
            'tanggal' => $tanggal,
            'nominal' => $total,
            'jenis' => 'penggajian',
        ];
        $this->db->insert("pengajuan_jurnal", $pengajuan);
        redirect('Penggajian');
    }

    public function bayar_gaji2($data, $id_gaji)
    {

        $nip = $data["nip"];
        $gaji_pokok = $data["gajipokok"];
        $tunjangan_jabatan = $data["tunjanganjabatan"];
        $tunjangan_kesehatan = $data["tunjangankesehatan"];
        $bonus_kerja = $data["bonus"];
        $ptkp = $data["ptkp"];
        $tot_penghasilan = $data["totalbruto"];
        $tot_pengurang = $data["ptkp"];
        $total = $data["gajibersih"];
        $pph21 = $data["pph21"];
        $tunjangan_hari_raya = $data["tunjanganhariraya"];
        $tanggal = date('Y-m-d');

        /* $id_gaji = $this->Absensi_model->id_gaji(); */
        $this->db->where('nip', $nip);
        $pegawai = $this->db->get('pegawai')->row();

        $unik = md5(random_int(0, PHP_INT_MAX));
        
        $tb_penggajian = [
            'id_penggajian' => $id_gaji,
            'tanggal' => date('Y-m-d'),
            'nm_pegawai' => $pegawai->nama,
            'nominal' => $total,
            'unik' => $unik,
        ];
        $this->db->insert('tb_penggajian', $tb_penggajian);

        $tb_detail_penggajian = [
            "id_penggajian" => $id_gaji,
            "gaji_pokok" => $gaji_pokok,
            "tunjangan_jabatan" => $tunjangan_jabatan,
            "tunjangan_kesehatan" => $tunjangan_kesehatan,
            "bonus_kerja" => $bonus_kerja,
            "ptkp" => $ptkp,
            "tot_penghasilan" => $tot_penghasilan,
            "tot_pengurang" => $tot_pengurang,
            "total" => $total,
            "pph21" => $pph21,
            "tunjangan_hari_raya" => $tunjangan_hari_raya,
            'unik' => $unik,
        ];
        $this->db->insert('tb_detail_penggajian', $tb_detail_penggajian);

        // kirim ke db pengajuan jurnal 
        /* $pengajuan = [
            'kode' => $id_gaji,
            'tanggal' => $tanggal,
            'nominal' => $total,
            'jenis' => 'penggajian',
        ];
        $this->db->insert("pengajuan_jurnal", $pengajuan); */

        // redirect('Penggajian');
        // $response = [
        //     'msg' => 'success', 
        //     'url' => redirect('Penggajian')
        // ];
        // echo json_encode('Sukses');
    }

    public function bayar_gaji()
    {
        $nip = $this->input->post('nip');
        $gaji_pokok = $this->input->post('gaji_pokok');
        $tunjangan_jabatan = $this->input->post('tunjangan_jabatan');
        $tunjangan_kesehatan = $this->input->post('tunjangan_kesehatan');
        $bonus_kerja = $this->input->post('bonus_kerja');
        $ptkp = $this->input->post('ptkp');
        $tot_penghasilan = $this->input->post('tot_penghasilan');
        $tot_pengurang = $this->input->post('tot_pengurang');
        $total = $this->input->post('total');
        $tanggal = date('Y-m-d');

        $id_gaji = $this->Absensi_model->id_gaji();
        $this->db->where('nip', $nip);
        $pegawai = $this->db->get('pegawai')->row();
        
        $tb_penggajian = [
            'id_penggajian' => $id_gaji,
            'tanggal' => date('Y-m-d'),
            'nm_pegawai' => $pegawai->nama,
            'nominal' => $total,
        ];
        $this->db->insert('tb_penggajian', $tb_penggajian);

        $tb_detail_penggajian = [
            "id_penggajian" => $id_gaji,
            "gaji_pokok" => $gaji_pokok,
            "tunjangan_jabatan" => $tunjangan_jabatan,
            "tunjangan_kesehatan" => $tunjangan_kesehatan,
            "bonus_kerja" => $bonus_kerja,
            "ptkp" => $ptkp,
            "tot_penghasilan" => $tot_penghasilan,
            "tot_pengurang" => $tot_pengurang,
            "total" => $total,
        ];
        $this->db->insert('tb_detail_penggajian', $tb_detail_penggajian);

        // kirim ke db pengajuan jurnal 
        $pengajuan = [
            'kode' => $id_gaji,
            'tanggal' => $tanggal,
            'nominal' => $total,
            'jenis' => 'penggajian',
        ];
        $this->db->insert("pengajuan_jurnal", $pengajuan);

        // redirect('Penggajian');
        // $response = [
        //     'msg' => 'success', 
        //     'url' => redirect('Penggajian')
        // ];
        // echo json_encode('Sukses');
        redirect('Penggajian');
    }

    public function laporan_penggajian()
    {
        $bulan = $this->input->post('bulan');
        $tahun = $this->input->post('tahun');
        $periode = $tahun.'-'.$bulan;
        if (isset($periode)) {
            $list = $this->db->query("SELECT b.*, a.tanggal, a.nm_pegawai
            from tb_penggajian a
            JOIN tb_detail_penggajian b ON a.unik = b.unik
            where tanggal LIKE '$periode%'  order by tanggal asc ")->result();
            $data = [
                'list' => $list,
            ];
            $this->template->load('template', 'penggajian/laporan_penggajian', $data);
        }
    }

    public function tunjanganhariraya() {
        $date = date("Y")."-".$this->input->get("bulan") ?? date('Y-m');
        $pegawai = $this->db->query("SELECT a.nama,a.nip,b.nominal,b.tanggal FROM pegawai a LEFT JOIN tunjangan_hari_raya b ON a.nip = b.nip WHERE b.tanggal IS NULL OR b.tanggal NOT LIKE '$date%'")->result();
        $pegawais = [];
        $thr = [];
        $dateApplied = $this->db->query("SELECT * FROM tunjangan_hari_raya WHERE tanggal LIKE '".date("Y")."%'")->result()[0] ?? false;
        foreach ($pegawai as $pgw) {
            $slipgaji = $this->slip_gaji($pgw->nip,$date);
            $thr[$pgw->nip] = $slipgaji["gajipokok"]+$slipgaji["tunjanganjabatan"]+$slipgaji["tunjangankesehatan"];
            $pegawais[$pgw->nip] = $this->slip_gaji($pgw->nip,$date);
        }
        $namabulan = [
            "01"=>"Januari",
            "02"=>"Februari",
            "03"=>"Maret",
            "04"=>"April",
            "05"=>"Mei",
            "06"=>"Juni",
            "07"=>"Juli",
            "08"=>"Agustus",
            "09"=>"September",
            "10"=>"Oktober",
            "11"=>"November",
            "12"=>"Desember"
        ];
        $data = [
            "pegawai"=>$pegawai,
            "pegawaidetail"=>$pegawais,
            "date"=>date("m"),
            "dateApplied"=>$dateApplied,
            "namabulan"=>$namabulan,
            "thr"=>$thr,
        ];
        $this->template->load("template","penggajian/tunjanganhariraya",$data);
    }

    public function simpan_tunjangan_hari_raya()
    {
        $dateApplied = $this->db->query("SELECT * FROM tunjangan_hari_raya WHERE tanggal LIKE '".date("Y")."%'")->result()[0] ?? false;
        $pegawai = $this->Absensi_model->detailPegawai()->result();
        foreach ($pegawai as $pgw) {
            if ($this->input->post($pgw->nip)) {
                $data = [
                    "nip" => $pgw->nip,
                    "tanggal" => $dateApplied->tanggal ?? date("Y")."-".$this->input->post("bulan")."-1",
                    "nominal" => $this->input->post($pgw->nip),
                    "nama" => $pgw->nama,
                ];
                $this->db->insert("tunjangan_hari_raya", $data);
            }
        }
        redirect("Penggajian/tunjanganhariraya");

    }
    
    public function liat_tunjangan_hari_raya()
    {
        $yes = $this->db->query("SELECT a.nama,a.nip,b.nominal FROM pegawai a JOIN tunjangan_hari_raya b ON b.nip = a.nip")->result();
        var_dump($yes);

    }
}
?>