 <?php 
class C_login extends CI_Controller{
    
  function cek_login()
        {
            $query = $this->M_login->cek($_POST['username'],($_POST['password']));
            if($this->session->userdata('level') == TRUE){
                redirect('c_masterdata/beranda');
            }elseif($query->num_rows()<>0)
            {
                $data_session = array('status'=>"login");
                foreach($query->result_array() as $data)
                {
                    $pgw = $this->db->query("SELECT * FROM pegawai WHERE nip = '".$data['nip']."'")->result();
                    if (count($pgw) > 0) {
                        $sess_data["jenis_kelamin"] = $pgw[0]->jenis_kelamin;
                    }
                    $sess_data['id'] = $data['id'];
                    $sess_data['username'] = $data['username'];
                    $sess_data['password'] = $data['password'];
                    $sess_data['level']    = $data['level'];
                    $sess_data['nama_lengkap']    = $data['nama_lengkap'];
                    $sess_data['nip']    = $data['nip'];
                    $this->session->set_userdata($sess_data);
                }
                $this->session->set_userdata($data_session);
                $level = $this->session->userdata('level');
                if($level == "admin")
                {
                    redirect('c_masterdata/beranda');
                }elseif ($level == "produksi1"){
                    redirect('c_masterdata/beranda');
                }elseif($level == "produksi2"){
                    redirect('c_masterdata/beranda');
                }elseif($level == "pembelian1"){
                    redirect('c_masterdata/beranda');
                }elseif($level == "pembelian2"){
                    redirect('c_masterdata/beranda');
                }elseif($level == "penjualan"){
                    redirect('c_masterdata/beranda');
                }elseif($level == "keuangan1"){
                    redirect('c_masterdata/beranda');
                }elseif($level == "keuangan2"){
                    redirect('c_masterdata/beranda');
                }elseif($level == "keuangan3"){ 
                    redirect('c_masterdata/beranda');
                } elseif($level == 'arles') {
                    redirect('c_masterdata/beranda');
                }elseif($level == "pegawai"){
                    redirect('profile');
                }else{
                    redirect('c_masterdata/beranda');
                }
            
            }else{
                    $data['error'] = 'Username atau Password anda salah!';
                    $this->load->view('template1',$data);
                }
            }

        
    
    public function home(){
        if($this->session->userdata('level') == TRUE){
            redirect('c_masterdata/beranda');
        }else{
       $this->load->view('template1');
        }
    }
    
    public function logout(){
        $this->session->sess_destroy();
        redirect ('c_login/home');
    }
}
 ?>

