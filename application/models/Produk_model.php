<?php class Produk_model extends CI_Model
{

    public function getProdukWaserda()
    {
        $q = "SELECT * FROM waserda_produk";
        return $this->db->query($q);
    }

    public function getKartuStok()
    {
        $q = "SELECT * FROM waserda_kartu_stok";
        return $this->db->query($q);
    }

    public function get_produk()
    {
        $sql = "SELECT a.*, deskripsi, c.nama AS supplier 
        FROM waserda_produk a
        JOIN waserda_kategori b ON b.kode = a.id_kategori
        JOIN waserda_supplier c ON c.kode = a.id_supplier_produk
        ORDER BY id desc
        ";
        return $this->db->query($sql);
    }

    public function get_item($post)
    {
        $response = array();
        if ($post['search']) {
            # code...
            $this->db->select('*');
            $this->db->where('nama_produk like "%'.$post['search'].'%"');
            $this->db->where('jml !=', 0);
            $this->db->where('status =', 1);
            $record = $this->db->get('waserda_produk')->result();

            foreach ($record as $key => $value) {
                # code...
                $response[] = array(
                    "value" => $value->kode,
                    "label" => $value->nama_produk
                );
            }
        }
        return $response;
    }

    public function detail_pos($inv)
    {
        $q = "SELECT a.id, b.kode, b.barcode_id, b.nama_produk, a.invoice, sum(a.jml) AS jml, a.harga, a.status
        FROM pos_detail_penjualan a 
        JOIN waserda_produk b ON a.id_produk = b.kode
        WHERE invoice = '$inv' AND a.status = 'dalam proses' 
        GROUP BY kode
        -- ORDER BY a.id desc
        ";
        return $this->db->query($q);
    }

    public function get_total_detail($inv)
    {
        $sql = "SELECT SUM(a.jml * harga) AS total
        FROM pos_detail_penjualan a 
        JOIN waserda_produk b ON a.id_produk = b.kode
        WHERE invoice = '$inv' AND a.status = 'dalam proses' 
        -- GROUP BY kode
        -- ORDER BY a.id desc
        ";
        return $this->db->query($sql);
    }

    public function total_pembelian($inv)
    {
        $sql = "SELECT SUM(a.jml * harga_satuan) AS total
        FROM pos_detail_pembelian a
        WHERE invoice = '$inv' AND a.status = 'dalam proses' 
        -- GROUP BY kode
        -- ORDER BY a.id desc
        ";
        return $this->db->query($sql);
    }

    public function get_produk_by_supplier($id_supplier)
    {
        $this->db->where('id_supplier_produk', $id_supplier);
		$this->db->order_by('nama_produk', 'ASC');

		$query = $this->db->get("waserda_produk");
		// print_r($query);exit;
		$output = '<option value="">-</option>';
		foreach ($query->result() as $row) {
			$output .= '<option value="' . $row->kode . '">' . $row->nama_produk . '</option>';
		}
		return $output;
    }

    public function detail_pembelian($kode)
    {
        $q = "SELECT a.*, b.nama_produk, c.nama
        FROM pos_detail_pembelian a
        JOIN waserda_produk b ON  a.id_produk = b.kode
        JOIN waserda_supplier c ON a.id_supplier = c.kode
        WHERE invoice = '$kode'
        GROUP BY b.kode
        ";
        return $this->db->query($q);
    }

    public function list()
    {
        $q = " SELECT * FROM pos_pembelian";
        return $this->db->query($q);
    }

    public function jenis_anggota($tipe='')
    {
        if ($tipe != '') {
            if ($tipe == 'peternak') {
                # code...
                $this->db->where('is_deactive', 0);
                $this->db->where('status_kredit', 0);
                $data = $this->db->get($tipe)->result();

                $output = '';
                foreach ($data as $row) {
                    $output .= '<option value="'.$row->nama_peternak.'">'.$row->nama_peternak.'</option>';
                }
            } else {
                # code...
                $this->db->where('status_kredit', 0);
                $data = $this->db->get($tipe)->result();
                $output = '';
                foreach ($data as $row) {
                    $output .= '<option value="'.$row->nama.'">'.$row->nama.'</option>';
                }
            }
            // $data = $this->db->get($tipe)->result();
        }
        return $output;
    }

    public function kd_pembayaran_kredit()
    {
        $query1   = "SELECT MAX(RIGHT(id_pembayaran,3)) as kode FROM waserda_pembayaran_kredit";
        $abc      = $this->db->query($query1);
        $kode = "";
        if ($abc->num_rows() > 0) {
            foreach ($abc->result() as $k) {
                $tmp = ((int) $k->kode) + 1;
                $kd  = sprintf("%03s", $tmp);
            }
        } else {
            $kd = "001";
        }
        $kode   = "PMB-KR-".date('Ymd').$kd;
        return $kode;
    }
}
?>