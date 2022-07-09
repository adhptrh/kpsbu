<?php 
class crud_model extends ci_model
{
    function tampil_data(){
		return $this->db->get('user');
	}
 
	function input_data($data,$table){
		$this->db->insert($table,$data);
	}
 
	// function update_data(){
	// 	return $this->db->get('user');
	// }

	function update($where, $data, $table){
		$this->db->where($where);
		$this->db->update($table, $data);
	} 
 
	function delete($where, $table){
		$this->db->where($where);
		$this->db->delete($table);
	}
}
?>