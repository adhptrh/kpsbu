<html>
	<head>
		<title>Master Data Supplier</title>
	</head>
	<!-- <center><h3><b>Master Data Supplier</h3></b></center>
	<hr> -->
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Form Supplier</b></h3>
  </div>
  	 <div class="x_content">
  	 	
	<body>
		<form method = "POST" action = "<?php echo site_url('c_masterdata/tambah_supp_bp');?>">
			<div class="form-group">
			  <label>ID Supplier</label>
			  <input type = "text" name = "no_supp_bp" class = "form-control" value="<?php echo $id?>" readonly>
			
			</div>
			<div class="form-group">
			  <label>Nama Supplier</label>
			  <input type = "text" name = "nama_supp_bp" class = "form-control">
			  
			  <?php echo form_error('nama_supp_bp'); ?>
			</div>

			<div class="form-group">
			  <label>No. Telepon</label>
			  <input type = "text" name = "notel" class = "form-control">
			  
			  <?php echo form_error('notel'); ?>
			</div>

			<div class="form-group">
			  <label>Alamat</label>
			  <input type = "text" name = "alamat" class = "form-control">
			  
			  <?php echo form_error('alamat'); ?>
			</div>
			
			  <hr>
			<button type="submit" class="btn btn-default btn-primary">Simpan</button>
			<a href = "<?php echo site_url()."/c_masterdata/lihat_supp_bp"?>" type="button" class="btn btn-default">Kembali</a>
		</form>
	</body>
</html>