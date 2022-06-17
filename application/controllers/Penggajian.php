<?php 
class Penggajian extends CI_Controller
{
    public function index()
    {
        $pegawai = $this->Absensi_model->detailPegawai()->result();
        $data = [
            'pegawai' => $pegawai,
        ];
        $this->template->load('template', 'penggajian/index', $data);
    }

    public function slip_gaji($nip)
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
            $tbBonus = $this->db->query("select sum(nominal) as nominal, nip, periode 
            from pengajuan_bonus a
            JOIN tb_detail_pengajuan_bonus b ON a.id_pengajuan = b.id_pengajuan
            where periode = '$month' and nip ='$data->nip'")->row();
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
            JOIN tb_detail_penggajian b ON a.id_penggajian = b.id_penggajian
            where LEFT(tanggal, 7) = '$periode' order by tanggal asc")->result();
            $data = [
                'list' => $list,
            ];
            $this->template->load('template', 'penggajian/laporan_penggajian', $data);
        }
    }
}
?>