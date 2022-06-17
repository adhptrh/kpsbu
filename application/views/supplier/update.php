<html>
<head></head>

<body>

		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><center><b>Edit Supplier</b></center></h3>
  </div>
  	 <div class="x_content">
<div>
<form method="POST" action="<?php echo site_url().'/c_masterdata/edit_supp_bp'; ?>">
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>ID Supplier</label>
				<input readonly type="text" class="form-control" name="no_supp_bp" value="<?php echo $data['no_supp_bp'] ; ?>"  >
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>Nama Supplier</label>
				<input type="text" class="form-control" name="nama_supp_bp" value="<?php echo $data['nama_supp_bp'] ; ?>" >
			</div>
		</div>
		<?php echo form_error('nama_supp_bp'); ?>
	</div>

		<div class="form-group">
			  <label>No. Telepon</label>
			  <input type = "text" name = "notel" class = "form-control" value ="<?php echo $data['notel'] ; ?>">
			  
			  <?php echo form_error('notel'); ?>
			</div>

			<div class="form-group">
			  <label>Alamat</label>
			  <input type = "text" name = "alamat" class = "form-control" vallue ="<?php echo $data['alamat']?>">
			  
			  <?php echo form_error('alamat'); ?>
			</div>

		<input type="submit" name="submit" class="btn btn-primary" value="Simpan">

		<a href = "<?php echo site_url()."/c_masterdata/lihat_supp_bp"?>" class="btn btn-default" role="button">Kembali</a><!-- 
		<a href="lihat_supp_bp" class="btn btn-default">Back</a>
		<input type="button" class="btn btn-default" value="Back" onClick=history.go(-1);> -->
	</div>
	</div>
	</div>
</form>
</div>
</div>
</div>
</body>
</html>