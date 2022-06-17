<?php 
class m_login extends ci_model{
	function cek($username, $password){
		$this->db->where('username', $username);
		$this->db->where('password', ($password));
		return $this->db->get('user');
	}
}

 ?>