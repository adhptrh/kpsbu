<html>
	<head>
		<title>Master Data Bank</title>
	</head>
	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
	<div class="x_panel">
 		<div class="x_title">
    		<h3 class="panel-title"><b>Form Bank</b></h3>
  		</div>
  	 	
  	 	<div class="x_content">
  	 	
			<body>
				<form method = "POST" action = "<?php echo site_url('c_masterdata/simpan_bank');?>">
					
					<div class="form-group">
					  <label>ID Bank</label>
					  <input type = "text" name = "id_bank" class = "form-control" value="<?php echo $id?>" readonly>
					</div>

					<div class="form-group">
					  <label>Nama Bank</label>
					  <input type = "text" name = "nama_bank" class = "form-control" autocomplete="off" required>
					  <?php echo form_error('bank'); ?>
					</div>
					<hr>
					<input type="submit" class="btn btn-default btn-primary" value="Simpan">
					<a href = "<?php echo site_url()."/c_masterdata/bank"?>" type="button" class="btn btn-default">Kembali</a>
				</form>
			</body>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.select2').select2()
		})
	</script>
</html>