<html>
	<head>
		<title>Master Data Jenis BOP</title>
	</head>
	<!-- <center><h3><b>Master Data Jenis BOP</h3></b></center>
	<hr> -->
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Form Jenis BOP</b></h3>
  </div>
  	 <div class="x_content">
  	 	
	<body>
		<form method = "POST" action = "<?php echo site_url('c_masterdata/tambah_jbop');?>">
			<div class="form-group">
			  <label>ID Jenis BOP</label>
			  <input type = "text" name = "no_jbop" class = "form-control" value="<?php echo $id?>" readonly>
			
			</div>
			<div class="form-group">
			  <label>Nama Jenis BOP</label>
			  <input type = "text" name = "nama_jbop" class = "form-control">
			  
			  <?php echo form_error('nama_jbop'); ?>
			
			</div>
			
			<button type="submit" class="btn btn-default btn-primary">Simpan</button>
			<a href = "<?php echo site_url()."/c_masterdata/lihat_jbop"?>" type="button" class="btn btn-default">Kembali</a>
		</form>
	</body>
</html>