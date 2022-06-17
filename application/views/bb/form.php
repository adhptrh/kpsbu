<html>
	<head>
		<title>Master Data Bahan Baku</title>
	</head>
	<!-- <center><h3><b>Master Data Bahan Baku</h3></b></center>
	<hr> -->
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Form Bahan Baku</b></h3>
  </div>
  	 <div class="x_content">
  	 	
	<body>
		<form method = "POST" action = "<?php echo site_url('c_masterdata/tambah_bb');?>">
			<div class="form-group">
			  <label>ID Bahan Baku</label>
			  <input type = "text" name = "no_bb" class = "form-control" value="<?php echo $id?>" readonly>
			
			</div>
			<div class="form-group">
			  <label>Nama Bahan Baku</label>
			  <input type = "text" name = "nama_bb" class = "form-control">
			  
			  <?php echo form_error('nama_bb'); ?>
			
			</div>
			
			
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
			<a href = "<?php echo site_url()."/c_masterdata/lihat_bb"?>" type="button" class="btn btn-default">Kembali</a>
		</form>
	</body>
</html>