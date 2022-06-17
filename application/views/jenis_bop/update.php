<html>
<head></head>

<body>

		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><center><b>Edit Jenis BOP</b></center></h3>
  </div>
  	 <div class="x_content">
<div>
<form method="POST" action="<?php echo site_url().'/c_masterdata/edit_bb'; ?>">
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>ID Jenis BOP</label>
				<input readonly type="text" class="form-control" name="no_jbop" value="<?php echo $data['no_jbop'] ; ?>"  >
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>Nama Jenis BOP</label>
				<input type="text" class="form-control" name="nama_jbop" value="<?php echo $data['nama_jbop'] ; ?>" >
			</div>
		</div>
		<?php echo form_error('nama_jbop'); ?>
	</div>
	
		<input type="submit" name="submit" class="btn btn-primary" value="Simpan">

		<a href = "<?php echo site_url()."/c_masterdata/lihat_jbop"?>" class="btn btn-default" role="button">Kembali</a><!-- 
		<a href="lihat_bb" class="btn btn-default">Back</a>
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