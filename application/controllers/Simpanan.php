<?php

/**
 * 
 */
class simpanan extends ci_controller
{

	function __construct()
	{
		# code...
		parent::__construct();
		$this->load->model(array(
			"simpanan_model" => "simpanan"
		));
		date_default_timezone_set('Asia/Jakarta');
		if (empty($this->session->userdata('level'))) {
			redirect('c_login/home');
		}
	}

	public function laporan_setoran_anggota()
	{
		$id_peternak = $this->input->post("id_peternak");
		if (isset($id_peternak)) {
			# code...
			$data = array(
				'id_peternak' => $id_peternak,
				'detail' => $this->simpanan->getDetails($id_peternak)->result(),
				'peternak' => $this->db->get("peternak")->result(),
				'anggota' => $this->simpanan->anggota($id_peternak)->row(),
			);
			// print_r($data['anggota']);exit;
			$this->template->load("template", "laporan_simpanan/kartu_simpanan_susu", $data);
		} else {
			$data = array(
				'id_peternak' => is_null($id_peternak),
				'detail' => $this->simpanan->getDetails($id_peternak)->result(),
				'peternak' => $this->db->get("peternak")->result(),
				'total' => 0,
			);
			$this->template->load("template", "laporan_simpanan/kartu_simpanan_susu", $data);
		}
	}

	public function kartu_simpanan_hr()
	{
		# code...
		$id_peternak = $this->input->post("id_peternak");
		if (isset($id_peternak)) {
			# code...
			$data = array(
				'id_peternak' => $id_peternak,
				'detail' => $this->simpanan->detailHr($id_peternak)->result(),
				'peternak' => $this->db->get("peternak")->result(),
				'anggota' => $this->simpanan->anggota($id_peternak)->row(),
				'total' => $this->simpanan->_total_simpanan_hr($id_peternak)->row()->total,
				$this->db->where('no_peternak =', $id_peternak),
				'header' => $this->db->get('peternak')->row()->nama_peternak
			);
			// print_r($data['total']);exit;
			$this->template->load("template", "laporan_simpanan/kartu_simpanan_hr", $data);
		} else {
			$data = array(
				'id_peternak' => is_null($id_peternak),
				'detail' => $this->simpanan->detailHr($id_peternak)->result(),
				'peternak' => $this->db->get("peternak")->result(),
				'total' => 0,
				'header' => ''
			);
			// print_r($data['detail']);exit;
			$this->template->load("template", "laporan_simpanan/kartu_simpanan_hr", $data);
		}
	}

	public function kartu_simpanan_wajib()
	{
		$id_peternak = $this->input->post("id_peternak");
		if (isset($id_peternak)) {
			// data udh di klik
			$data = array(
				'id_peternak' 	=> $id_peternak,
				'detail' 		=> $this->simpanan->_simpanan_wajib_list($id_peternak)->result(),
				'peternak' 		=> $this->db->get("peternak")->result(),
				'anggota' 		=> $this->simpanan->anggota($id_peternak)->row(),
				'total' 		=> $this->simpanan->sum_simpwajib($id_peternak)->row()->total_simpanan_wajib,
				$this->db->where('no_peternak =', $id_peternak),
				'header' => $this->db->get('peternak')->row()->nama_peternak
			);
			$this->template->load("template", "laporan_simpanan/kartu_simpanan_wajib", $data);
		} else {
			// data blm di klik
			$data = array(
				'id_peternak' => is_null($id_peternak),
				'detail' => $this->simpanan->_simpanan_wajib_list($id_peternak)->result(),
				'peternak' => $this->db->get("peternak")->result(),
				'total' => 0,
				'header' => ''
			);
			$this->template->load('template', 'laporan_simpanan/kartu_simpanan_wajib', $data);
		}
	}

	public function kartu_simpanan_masuka()
	{
		# code...
		$id_peternak = $this->input->post('id_peternak');
		if (isset($id_peternak)) {
			# code...
			$data = array(
				'id_peternak' => $id_peternak,
				'detail' => $this->simpanan->_masuka_list($id_peternak)->result(),
				'peternak' => $this->db->get("peternak")->result(),
				'total' => $this->simpanan->sum_masuka($id_peternak)->row()->total,
				$this->db->where('no_peternak =', $id_peternak),
				'header' => $this->db->get('peternak')->row()->nama_peternak
			);
			$this->template->load('template', 'laporan_simpanan/kartu_simpanan_masuka', $data);
		} else {
			$data = array(
				'id_peternak' => is_null($id_peternak),
				'detail' => $this->simpanan->_masuka_list($id_peternak)->result(),
				'peternak' => $this->db->get("peternak")->result(),
				'total' => 0,
				'header' => ''
			);
			$this->template->load('template', 'laporan_simpanan/kartu_simpanan_masuka', $data);
		}
	}

	public function laporan_kartu_simpanan()
	{
		$id_peternak = $this->input->post("id_peternak");
		if (isset($id_peternak)) {
			// data udh di klik
			$data = array(
				'id_peternak' 	=> $id_peternak,
				'detail' 		=> $this->simpanan->_laporan_kartu_simpanan($id_peternak)->result(),
				'peternak' 		=> $this->db->get("peternak")->result(),
				'anggota' 		=> $this->simpanan->anggota($id_peternak)->row(),
				'total_wajib' 	=> $this->simpanan->sum_simpwajib($id_peternak)->row()->total_simpanan_wajib,
				'total_masuka' 	=> $this->simpanan->sum_masuka($id_peternak)->row()->total,
				'total_hr' 		=> $this->simpanan->_total_simpanan_hr($id_peternak)->row()->total,
				$this->db->where('no_peternak =', $id_peternak),
				'header' => $this->db->get('peternak')->row()->nama_peternak
			);
			$this->template->load("template", "laporan_simpanan/laporan_kartu_simpanan", $data);
		} else {
			// data blm di klik
			$data = array(
				'id_peternak' => is_null($id_peternak),
				'detail' => $this->simpanan->_laporan_kartu_simpanan($id_peternak)->result(),
				'peternak' => $this->db->get("peternak")->result(),
				'total' => 0,
				'total_wajib' 	=> 0,
				'total_masuka' 	=> 0,
				'total_hr' 		=> 0,
				'header' => ''
			);
			$this->template->load('template', 'laporan_simpanan/laporan_kartu_simpanan', $data);
		}
	}
}
