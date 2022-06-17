<html>
<head></head>

<body>

		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><center><b>Edit Konsumen IPS</b></center></h3>
  </div>
  	 <div class="x_content">
<div>
<form method="POST" action="<?php echo site_url().'/c_masterdata/edit_ips'; ?>">
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>ID Konsumen IPS</label>
				<input readonly type="text" class="form-control" name="no_ips" value="<?php echo $data['no_ips'] ; ?>"  >
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>Nama Konsumen IPS</label>
				<input type="text" class="form-control" name="nama_ips" value="<?php echo $data['nama_ips'] ; ?>" >
			</div>
		</div>
		<?php echo form_error('nama_ips'); ?>
	</div>

	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>No. Telepon</label>
				<input type="text" class="form-control" name="notel" value="<?php echo $data['notel'] ; ?>" >
			</div>
		</div>
		<?php echo form_error('notel'); ?>
	</div>

	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>Alamat</label>
				<input type="text" class="form-control" name="alamat" value="<?php echo $data['alamat'] ; ?>" >
			</div>
		</div>
		<?php echo form_error('alamat'); ?>
	</div>
	
		<input type="submit" name="submit" class="btn btn-primary" value="Simpan">

		<a href = "<?php echo site_url()."/c_masterdata/lihat_ips"?>" class="btn btn-default" role="button">Kembali</a><!-- 
		<a href="lihat_ips" class="btn btn-default">Back</a>
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