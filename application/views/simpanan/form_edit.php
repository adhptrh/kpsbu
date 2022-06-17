<html>
	<head>
		<title>Master Data Simpanan</title>
	</head>
	<!-- <center><h3><b>Master Data Produk</h3></b></center>
	<hr> -->
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Form Simpanan</b></h3>
  </div>
  	 <div class="x_content">
  	 	
	<body>
		<form method = "POST" action = "<?php echo site_url('c_masterdata/updateSimpanan');?>">

			<div class="form-group">
			  <label>Kode Simpanan</label>
			  <input type = "text" name = "kode_simpanan" class = "form-control" value="<?php echo $data->kode_simpanan?>" readonly>
			</div>

			<div class="form-group">
			  <label>Simpanan</label>
			  <input type = "text" name = "simpanan" class = "form-control" value="<?= $data->simpanan?>">
			  <?php echo form_error('simpanan'); ?>
			</div>

			<div class="form-group">
			  <label>Biaya</label>
			  <input type = "text" name = "biaya" class = "form-control" value="<?= $data->biaya?>">
			  <?php echo form_error('biaya'); ?>
			</div>
			
			<hr>
			<button type="submit" class="btn btn-default btn-success">Update</button>
			<a href = "<?php echo site_url()."/c_masterdata/simpanan"?>" type="button" class="btn btn-default">Kembali</a>
		</form>
	</body>
</html>