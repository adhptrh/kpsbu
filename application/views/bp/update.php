<html>
<head></head>

<body>

		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><center><b>Edit Bahan Penolong</b></center></h3>
  </div>
  	 <div class="x_content">
<div>
<form method="POST" action="<?php echo site_url().'/c_masterdata/edit_bp'; ?>">
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>ID Bahan Penolong</label>
				<input readonly type="text" class="form-control" name="no_bp" value="<?php echo $data['no_bp'] ; ?>"  >
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>Nama Bahan Penolong</label>
				<input type="text" class="form-control" name="nama_bp" value="<?php echo $data['nama_bp'] ; ?>" >
			</div>
		</div>
		<?php echo form_error('nama_bp'); ?>
	</div>
<!-- 	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>Harga</label>
				<input type="text" class="form-control" name="harga" value="<?php echo $data['harga'] ; ?>">
			</div>
		</div>
	</div>
	<?php echo form_error('harga'); ?> -->
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>Stok</label>
				<input type="text" class="form-control" name="stok" value="<?php echo $data['stok'] ; ?>" readonly >
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				 <label>Satuan</label>
			  <select name="satuan" class="form-control">
			  	<option value="ton">ton</option>
			  	<option value="kg">kg</option>
			  	<option value="gram">gram</option>
			  	<option value="liter">liter</option>
			  	<option value="ml">ml</option>
			  	<option value="buah">buah</option>
			  </select>
			</div>
		</div>
	</div>
	<?php echo form_error('satuan'); ?>
		<input type="submit" name="submit" class="btn btn-primary" value="Simpan">

		<a href = "<?php echo site_url()."/c_masterdata/lihat_bp"?>" class="btn btn-default" role="button">Kembali</a><!-- 
		<a href="lihat_bp" class="btn btn-default">Back</a>
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