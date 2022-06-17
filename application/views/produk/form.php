<html>
	<head>
		<title>Master Data Produk</title>
	</head>
	<!-- <center><h3><b>Master Data Produk</h3></b></center>
	<hr> -->
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Form Produk</b></h3>
  </div>
  	 <div class="x_content">
  	 	
	<body>
		<form method = "POST" action = "<?php echo site_url('c_masterdata/tambah_produk');?>">
			<div class="form-group">
			  <label>ID Produk</label>
			  <input type = "text" name = "no_produk" class = "form-control" value="<?php echo $id?>" readonly>
			
			</div>

			<div class="form-group">
				<label for="jenis_penjualan">Jenis Produk</label>
				<select name="jenis_penjualan" id="jenis_penjualan" class="form-control" required>
					<option value="">-</option>
					<?php foreach ($jenis_penjualan as $key => $value) { ?>
					<option value="<?= $value->id?>"><?= $value->desc?></option>
					<?php } ?>
				</select>
			</div>

			<div class="form-group">
				<label>Nama Produk</label>
				<input type = "text" name = "nama_produk" class = "form-control">
				<?php echo form_error('nama_produk'); ?>
			</div>

			<div class="form-group">
				<label>Harga jual</label>
				<input type = "text" name = "harga_jual" class = "form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" required>
				<?php echo form_error('harga_jual'); ?>
			</div>

			<div class="form-group">
				<label>Jumlah Liter</label>
				<input type = "text" name = "stok" class = "form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" required>
				<?php echo form_error('stok'); ?>
			</div>

			
			<div class="form-group">
			  <label>Satuan</label>
			   	<!-- <input type = "text" name = "satuan" class = "form-control" value="liter" readonly=""> -->
				<select name="satuan" class="form-control" required>
					<option value="">Pilih Satuan</option>
					<option value="liter">Liter</option>
					<option value="pcs">Pcs</option>
					<option value="kilo">Kilo</option>
				</select>
			
			  <?php echo form_error('satuan'); ?>
			</div>
			
			  <hr>
			<button type="submit" class="btn btn-default btn-primary">Simpan</button>
			<a href = "<?php echo site_url()."/c_masterdata/lihat_produk"?>" type="button" class="btn btn-default">Kembali</a>
		</form>
	</body>
</html>