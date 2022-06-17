<html>
<head></head>

<body>

		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><center><b>Edit Produk Dalam Proses</b></center></h3>
  </div>
  	 <div class="x_content">
<div>
<form method="POST" action="<?php echo site_url().'/c_masterdata/edit_bdp'; ?>">
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>ID Produk Dalam Proses</label>
				<input readonly type="text" class="form-control" name="no_bdp" value="<?php echo $data['no_bdp'] ; ?>"  >
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>Nama Produk Dalam Proses</label>
				<input type="text" class="form-control" name="nama_bdp" value="<?php echo $data['nama_bdp'] ; ?>" >
			</div>
		</div>
		<?php echo form_error('nama_bdp'); ?>
	</div>
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
				<option disabled selected>Pilih Satuan</option>
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

		<a href = "<?php echo site_url()."/c_masterdata/lihat_bdp"?>" class="btn btn-default" role="button">Kembali</a><!-- 
		<a href="lihat_bdp" class="btn btn-default">Back</a>
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