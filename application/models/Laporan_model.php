<?php 
class Laporan_model extends CI_Model
{
    public function getUtang()
    {
        $q = $this->db->query("SELECT 
        SUM(nominal) AS debit, 
        (
            SELECT sum(nominal) 
            FROM jurnal 
            WHERE no_coa = '2111'
            and left(tgl_jurnal, 7) = '2022-06'
            and posisi_dr_cr = 'k' 
        ) AS kredit
        FROM jurnal
        WHERE no_coa = '2111'
        and left(tgl_jurnal, 7) = '2022-06'
        AND posisi_dr_cr = 'd'");
        return $q;
    }
    
    public function neracaSaldo($periode)
    {
        $q = $this->db->query("SELECT 
        a.no_coa, 
        a.nama_coa, 
        a.header, 
        a.saldo_normal,
        j.debit, 
        k.kredit
        FROM coa a
        LEFT JOIN (
           SELECT
            SUM(nominal) AS debit,
            no_coa
            FROM jurnal
            WHERE left(tgl_jurnal, 7) = '$periode'
            AND posisi_dr_cr = 'd'
            GROUP BY no_coa
        ) AS j ON j.no_coa = a.no_coa
        LEFT JOIN (
           SELECT
            SUM(nominal) AS kredit,
            no_coa
            FROM jurnal
            WHERE left(tgl_jurnal, 7) = '$periode'
            AND posisi_dr_cr = 'k'
            GROUP BY no_coa
        ) AS k ON k.no_coa = a.no_coa
        WHERE is_neraca = 1
        GROUP BY no_coa
        ORDER BY no_coa ASC
        ");
        return $q;
    }

    public function getLaporanNeracaYear($date1) {
        $saldo_awal = $this->db->query("SELECT * FROM coa WHERE no_coa = '1111'")->result()[0]->saldo_awal;
        $query = $this->db->query("SELECT 
        SUM(nominal) AS debit, 
        (
            SELECT sum(nominal) 
            FROM jurnal 
            WHERE no_coa = '1111'
            and tgl_jurnal LIKE '$date1-%'
            and posisi_dr_cr = 'k' 
        ) AS kredit
        FROM jurnal
        WHERE no_coa = '1111'
        AND tgl_jurnal LIKE '$date1-%'
        AND posisi_dr_cr = 'd'")->row();
        $total_kas = $query->debit - $query->kredit + $saldo_awal;

        $query = $this->db->query("SELECT 
        SUM(nominal) AS debit, 
        (
            SELECT sum(nominal) 
            FROM jurnal 
            WHERE no_coa = '1112'
            AND tgl_jurnal LIKE '$date1-%'
            and posisi_dr_cr = 'k' 
        ) AS kredit
        FROM jurnal
        WHERE no_coa = '1112'
        AND tgl_jurnal LIKE '$date1-%'
        AND posisi_dr_cr = 'd'")->row();
        $persediaanbahanbaku = $query->debit - $query->kredit + $saldo_awal;

        $query = $this->db->query("SELECT 
        SUM(nominal) AS debit, 
        (
            SELECT sum(nominal) 
            FROM jurnal 
            WHERE no_coa = '2111'
            AND tgl_jurnal LIKE '$date1-%'
            and posisi_dr_cr = 'k' 
        ) AS kredit
        FROM jurnal
        WHERE no_coa = '2111'
        AND tgl_jurnal LIKE '$date1-%'
        AND posisi_dr_cr = 'd'")->row();
        $utang = $query->debit - $query->kredit + $saldo_awal;

        $query = $this->db->query("SELECT 
        SUM(nominal) AS debit, 
        (
            SELECT sum(nominal) 
            FROM jurnal 
            WHERE no_coa = '1125'
            AND tgl_jurnal LIKE '$date1-%'
            and posisi_dr_cr = 'k' 
        ) AS kredit
        FROM jurnal
        WHERE no_coa = '1125'
        AND tgl_jurnal LIKE '$date1-%'
        AND posisi_dr_cr = 'd'")->row();
        $akumulasipenyusutankendaraan = $query->kredit + $saldo_awal;

        $query = $this->db->query("SELECT 
        SUM(nominal) AS debit, 
        (
            SELECT sum(nominal) 
            FROM jurnal 
            WHERE no_coa = '3111'
            AND tgl_jurnal LIKE '$date1-%'
            and posisi_dr_cr = 'k' 
        ) AS kredit
        FROM jurnal
        WHERE no_coa = '3111'
        AND tgl_jurnal LIKE '$date1-%'
        AND posisi_dr_cr = 'd'")->row();
        $simpananpokok = $query->kredit + $saldo_awal;

        $query = $this->db->query("SELECT 
        SUM(nominal) AS debit, 
        (
            SELECT sum(nominal) 
            FROM jurnal 
            WHERE no_coa = '3112'
            AND tgl_jurnal LIKE '$date1-%'
            and posisi_dr_cr = 'k' 
        ) AS kredit
        FROM jurnal
        WHERE no_coa = '3112'
        AND tgl_jurnal LIKE '$date1-%'
        AND posisi_dr_cr = 'd'")->row();
        $simpananwajib = $query->kredit + $saldo_awal;

        $query = $this->db->query("SELECT 
        SUM(nominal) AS debit, 
        (
            SELECT sum(nominal) 
            FROM jurnal 
            WHERE no_coa = '3113'
            AND tgl_jurnal LIKE '$date1-%'
            and posisi_dr_cr = 'k' 
        ) AS kredit
        FROM jurnal
        WHERE no_coa = '3112'
        AND tgl_jurnal LIKE '$date1-%'
        AND posisi_dr_cr = 'd'")->row();
        $simpananmasuka = $query->kredit + $saldo_awal;

        $query = $this->db->query("SELECT 
        SUM(nominal) AS debit, 
        (
            SELECT sum(nominal) 
            FROM jurnal 
            WHERE no_coa = '3200'
            AND tgl_jurnal LIKE '$date1-%'
            and posisi_dr_cr = 'k' 
        ) AS kredit
        FROM jurnal
        WHERE no_coa = '3200'
        AND tgl_jurnal LIKE '$date1-%'
        AND posisi_dr_cr = 'd'")->row();
        $shuditahan = $query->debit - $query->kredit + $saldo_awal;
        
        $total_aktifa = $total_kas + $persediaanbahanbaku + $akumulasipenyusutankendaraan;
        $modal = $total_aktifa - ($utang+$simpananpokok+$simpananwajib+$simpananmasuka);
        $total_pasiva = $modal+$utang+$simpananpokok+$simpananwajib+$simpananmasuka;

        $data = [
            'kas' => $total_kas,
            'persediaanbahanbaku' => $persediaanbahanbaku,
            'utang' => $utang,
            "akumulasipenyusutankendaraan"=>$akumulasipenyusutankendaraan,
            "simpananpokok"=>$simpananpokok,
            "simpananwajib"=>$simpananwajib,
            "simpananmasuka"=>$simpananmasuka,
            "shuditahan"=>$shuditahan,
            "total_aktifa"=>$total_aktifa,
            "total_pasiva"=>$total_pasiva,
            "modal"=>$modal,
        ];

        return $data;
    }

    public function getLaporanNeraca() {
        $saldo_awal = $this->db->query("SELECT * FROM coa WHERE no_coa = '1111'")->result()[0]->saldo_awal;
        $query = $this->db->query("SELECT 
        SUM(nominal) AS debit, 
        (
            SELECT sum(nominal) 
            FROM jurnal 
            WHERE no_coa = '1111'
            and left(tgl_jurnal, 7) = '".date("Y-m")."'
            and posisi_dr_cr = 'k' 
        ) AS kredit
        FROM jurnal
        WHERE no_coa = '1111'
        and left(tgl_jurnal, 7) = '".date("Y-m")."'
        AND posisi_dr_cr = 'd'")->row();
        $total_kas = $query->debit - $query->kredit + $saldo_awal;

        $query = $this->db->query("SELECT 
        SUM(nominal) AS debit, 
        (
            SELECT sum(nominal) 
            FROM jurnal 
            WHERE no_coa = '1112'
            and left(tgl_jurnal, 7) = '".date("Y-m")."'
            and posisi_dr_cr = 'k' 
        ) AS kredit
        FROM jurnal
        WHERE no_coa = '1112'
        and left(tgl_jurnal, 7) = '".date("Y-m")."'
        AND posisi_dr_cr = 'd'")->row();
        $persediaanbahanbaku = $query->debit - $query->kredit + $saldo_awal;

        $query = $this->db->query("SELECT 
        SUM(nominal) AS debit, 
        (
            SELECT sum(nominal) 
            FROM jurnal 
            WHERE no_coa = '2111'
            and left(tgl_jurnal, 7) = '".date("Y-m")."'
            and posisi_dr_cr = 'k' 
        ) AS kredit
        FROM jurnal
        WHERE no_coa = '2111'
        and left(tgl_jurnal, 7) = '".date("Y-m")."'
        AND posisi_dr_cr = 'd'")->row();
        $utang = $query->debit - $query->kredit + $saldo_awal;

        $query = $this->db->query("SELECT 
        SUM(nominal) AS debit, 
        (
            SELECT sum(nominal) 
            FROM jurnal 
            WHERE no_coa = '1125'
            and left(tgl_jurnal, 7) = '".date("Y-m")."'
            and posisi_dr_cr = 'k' 
        ) AS kredit
        FROM jurnal
        WHERE no_coa = '1125'
        and left(tgl_jurnal, 7) = '".date("Y-m")."'
        AND posisi_dr_cr = 'd'")->row();
        $akumulasipenyusutankendaraan = $query->kredit + $saldo_awal;

        $query = $this->db->query("SELECT 
        SUM(nominal) AS debit, 
        (
            SELECT sum(nominal) 
            FROM jurnal 
            WHERE no_coa = '3111'
            and left(tgl_jurnal, 7) = '".date("Y-m")."'
            and posisi_dr_cr = 'k' 
        ) AS kredit
        FROM jurnal
        WHERE no_coa = '3111'
        and left(tgl_jurnal, 7) = '".date("Y-m")."'
        AND posisi_dr_cr = 'd'")->row();
        $simpananpokok = $query->kredit + $saldo_awal;

        $query = $this->db->query("SELECT 
        SUM(nominal) AS debit, 
        (
            SELECT sum(nominal) 
            FROM jurnal 
            WHERE no_coa = '3112'
            and left(tgl_jurnal, 7) = '".date("Y-m")."'
            and posisi_dr_cr = 'k' 
        ) AS kredit
        FROM jurnal
        WHERE no_coa = '3112'
        and left(tgl_jurnal, 7) = '".date("Y-m")."'
        AND posisi_dr_cr = 'd'")->row();
        $simpananwajib = $query->kredit + $saldo_awal;

        $query = $this->db->query("SELECT 
        SUM(nominal) AS debit, 
        (
            SELECT sum(nominal) 
            FROM jurnal 
            WHERE no_coa = '3113'
            and left(tgl_jurnal, 7) = '".date("Y-m")."'
            and posisi_dr_cr = 'k' 
        ) AS kredit
        FROM jurnal
        WHERE no_coa = '3112'
        and left(tgl_jurnal, 7) = '".date("Y-m")."'
        AND posisi_dr_cr = 'd'")->row();
        $simpananmasuka = $query->kredit + $saldo_awal;

        $query = $this->db->query("SELECT 
        SUM(nominal) AS debit, 
        (
            SELECT sum(nominal) 
            FROM jurnal 
            WHERE no_coa = '3200'
            and left(tgl_jurnal, 7) = '".date("Y-m")."'
            and posisi_dr_cr = 'k' 
        ) AS kredit
        FROM jurnal
        WHERE no_coa = '3200'
        and left(tgl_jurnal, 7) = '".date("Y-m")."'
        AND posisi_dr_cr = 'd'")->row();
        $shuditahan = $query->debit - $query->kredit + $saldo_awal;
        
        $total_aktifa = $total_kas + $persediaanbahanbaku + $akumulasipenyusutankendaraan;
        $modal = $total_aktifa - ($utang+$simpananpokok+$simpananwajib+$simpananmasuka);
        $total_pasiva = $modal+$utang+$simpananpokok+$simpananwajib+$simpananmasuka;

        $data = [
            'kas' => $total_kas,
            'persediaanbahanbaku' => $persediaanbahanbaku,
            'utang' => $utang,
            "akumulasipenyusutankendaraan"=>$akumulasipenyusutankendaraan,
            "simpananpokok"=>$simpananpokok,
            "simpananwajib"=>$simpananwajib,
            "simpananmasuka"=>$simpananmasuka,
            "shuditahan"=>$shuditahan,
            "total_aktifa"=>$total_aktifa,
            "total_pasiva"=>$total_pasiva,
            "modal"=>$modal,
        ];

        return $data;
    }
}
