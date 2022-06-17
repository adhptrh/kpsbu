<div class="x_panel">
    <div class="x_title">
        <div class="row">
            <div class="col-sm-10 col-12">
                <h3>Absensi</h3>
            </div>
        </div>
    </div>
    <div class="x_content">
        <div class="col-lg-12" id="notif-row">
               <?php $this->form_validation->set_error_delimiters('<div class="alert alert-danger">','</div>')?>
               <?php echo validation_errors();?>
               <?php echo $this->session->flashdata('notif'); ?>
        </div>
        <form action="" id="form-absen">
            <input type="text" class="form-control" id="rfid">
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