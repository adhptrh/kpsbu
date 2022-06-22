<html>
	<!-- <head>
		<title>Master Data Bahan Baku</title>
	</head> -->
	
	<div class="x_panel">
 		<div class="x_title">
    		<h3 class="panel-title"><b>Edit Bank</b></h3>
  		</div>
  	 	
  	 	<div class="x_content">
  	 	
			<body>
				<form method = "POST" action = "<?php echo site_url('c_masterdata/edit_bank');?>">
					
					<div class="form-group">
					  <label>ID Bank</label>
					  <input type = "text" name = "id_bank" class = "form-control" value="<?php echo $bank->id_bank?>" readonly>
					</div>

					<div class="form-group">
					  <label>Nama Bank</label>
					  <input type = "text" name = "nama_bank" class = "form-control" value="<?= $bank->nama_bank ?>">
					  <?php echo form_error('bank'); ?>
					</div>
					<hr>
					<input type="submit" class="btn btn-default btn-primary" value="Simpan">
					<a href = "<?php echo site_url()."/c_masterdata/bank"?>" type="button" class="btn btn-default">Kembali</a>
				</form>
			</body>
		</div>
	</div>
</html>