<html>
	<head>
		<title>Master Data Bahan Penolong</title>
	</head>
	<!-- <center><h3><b>Master Data Bahan Penolong</h3></b></center>
	<hr> -->
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Form Bahan Penolong</b></h3>
  </div>
  	 <div class="x_content">
  	 	
	<body>
		<form method = "POST" action = "<?php echo site_url('c_masterdata/tambah_bp');?>">
			<div class="form-group">
			  <label>ID Bahan Penolong</label>
			  <input type = "text" name = "no_bp" class = "form-control" value="<?php echo $id?>" readonly>
			
			</div>
			<div class="form-group">
			  <label>Nama Bahan Penolong</label>
			  <input type = "text" name = "nama_bp" class = "form-control">
			  
			  <?php echo form_error('nama_bp'); ?>
			
			</div>
			<!-- <div class="form-group">
			  <label>Harga</label>
			  <input type = "number" name = "harga" class = "form-control">
			  
			  <?php echo form_error('harga'); ?>
			
			</div> -->
			
			<div class="form-group">
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
			
			  <?php echo form_error('satuan'); ?>
			  <hr>
			<button type="submit" class="btn btn-default btn-primary">Simpan</button>
			<a href = "<?php echo site_url()."/c_masterdata/lihat_bp"?>" type="button" class="btn btn-default">Kembali</a>
		</form>
	</body>
</html>