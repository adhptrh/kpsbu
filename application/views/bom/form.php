<html>
	<head>
		<title>Master Data Konsumen IPS</title>
	</head>
	<!-- <center><h3><b>Master Data Konsumen IPS</h3></b></center>
	<hr> -->
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Form Konsumen IPS</b></h3>
  </div>
  	 <div class="x_content">
  	 	
	<body>
		<form method = "POST" action = "<?php echo site_url('c_masterdata/tambah_ips');?>">
			<div class="form-group">
			  <label>ID Konsumen IPS</label>
			  <input type = "text" name = "no_ips" class = "form-control" value="<?php echo $id?>" readonly>
			
			</div>
			<div class="form-group">
			  <label>Nama Konsumen IPS</label>
			  <input type = "text" name = "nama_ips" class = "form-control">
			  
			  <?php echo form_error('nama_ips'); ?>
			
			</div>
			
			  <hr>
			<button type="submit" class="btn btn-default btn-primary">Simpan</button>
			<a href = "<?php echo site_url()."/c_masterdata/lihat_ips"?>" type="button" class="btn btn-default">Kembali</a>
		</form>
	</body>
</html>