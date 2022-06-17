<html>
<head></head>

<body>

		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><center><b>Edit Produk</b></center></h3>
  </div>
  	 <div class="x_content">
<div>
<form method="POST" action="<?php echo site_url().'/c_masterdata/edit_produk'; ?>">
	<div class="form-group">
		
				<label>ID Produk</label>
				<input readonly type="text" class="form-control" name="no_produk" value="<?php echo $data['no_produk'] ; ?>"  >
			
	</div>
	<div class="form-group">
	
				<label>Nama Produk</label>
				<input type="text" class="form-control" name="nama_produk" value="<?php echo $data['nama_produk'] ; ?>"  >
		<?php echo form_error('nama_produk'); ?>
	</div>

	<div class="form-group">
	
				<label>Jumlah Liter</label>
				<input type="text" class="form-control" name="stok" value="<?php echo $data['stok'] ; ?>"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
		<?php echo form_error('stok'); ?>
	</div>

	<div class="form-group">
	
				<label>Harga Jual</label>
				<input readonly type="text" class="form-control" value="<?php echo format_rp($data['harga_jual']) ; ?>"  >
				<input readonly type="hidden" class="form-control" name="harga_jual" value="<?php echo ($data['harga_jual']) ; ?>"  >
	
	</div>

	<div class="form-group">
			  <label>Satuan</label>
			  <input type="text" class="form-control" name="satuan" value="<?php echo $data['satuan'] ; ?>" readonly >
			  <!-- <select name="satuan" class="form-control">
			  	<option disabled selected>Pilih Satuan</option>
			  	<option value="ton">ton</option>
			  	<option value="kg">kg</option>
			  	<option value="gram">gram</option>
			  	<option value="liter">liter</option>
			  	<option value="ml">ml</option>
			  	<option value="buah">buah</option>
			  	
			  </select> -->
			
			  <?php echo form_error('satuan'); ?>
			</div>
	<!-- <div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				 <label>Satuan</label>
			<input type="text" class="form-control" name="satuan" value="<?php echo $data['satuan'] ; ?>" >
			</div>
		</div>
	</div>
	<?php echo form_error('satuan'); ?> -->

		<input type="submit" name="submit" class="btn btn-primary" value="Simpan">

		<a href = "<?php echo site_url()."/c_masterdata/lihat_produk"?>" class="btn btn-default" role="button">Kembali</a><!-- 
		<a href="lihat_produk" class="btn btn-default">Back</a>
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