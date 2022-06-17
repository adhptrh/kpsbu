<div class="container-login100">     
    <div class="wrap-login100">
        <div class="login100-form-title" style="background-image: url(images/bg-01.jpg);">
            <span class="login100-form-title-1">
                Presensi Kehadiran
            </span>
        </div>

        <form class="login100-form validate-form" style="padding: 50px !important;" action="" id="form-absen">
            <div class="btnLogin" style="margin-bottom: 40px;">
                <a href="<?= base_url('c_login/home')?>" class="btn btn-light">
                    Halaman Login
                </a>
            </div>
            <hr>
            <div class="col-lg-12" id="notif-row">
                <?php $this->form_validation->set_error_delimiters('<div class="alert alert-danger">','</div>')?>
                <?php echo validation_errors();?>
                <?php echo $this->session->flashdata('notif'); ?>
            </div>

            <div class="wrap-input100 validate-input m-b-26">
                <input class="input100" type="text" id="rfid" name="username" placeholder="Enter RFID Number" autofocus>
            </div>
            
        </form>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $("#form-absen").submit(function(e){
            e.preventDefault();
            var rfid = $("#rfid").val();
            // console.log(rfid)
            $.ajax({
                url:"<?= base_url('Absensi/save/')?>"+rfid,
                success:function(response){
                    data = JSON.parse(response);
                    console.log(custom_notification('success','Berhasil Absen'));
                    // console.log(data)
                    if(data.status){
                        custom_notification('success',data.info);
                        $("#rfid").val('');
                        $("#rfid").focus();
                    }else{
                        custom_notification('danger',data.info);
                        $("#rfid").val('');
                        $("#rfid").focus();
                    }
                }
            });
        });
    })
</script>