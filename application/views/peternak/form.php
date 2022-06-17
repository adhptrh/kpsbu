<html>
	<head>
		<title>Master Data Peternak</title>
	</head>
	<!-- <center><h3><b>Master Data Peternak</h3></b></center>
	<hr> -->
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Form Peternak</b></h3>
  </div>
  	 <div class="x_content">
  	 	
	<body>
		<form method = "POST" action = "<?php echo site_url('c_masterdata/tambah_peternak');?>">
			<div class="form-group">
			  <label>ID Peternak</label>
			  <input type = "text" name = "no_peternak" class = "form-control" value="<?php echo $id?>" readonly>
			
			</div>

			<div class="form-group">
				<label for="tps">TPS</label>
				<select name="tps" id="tps" class="form-control" required>
				<option value="">Pilih TPS</option>
				<?php foreach ($tps as $d) { ?>
				<option value="<?= $d->kode_tps?>"><?= $d->alamat?></option>
				<?php } ?>
				</select>
			</div>

			<div class="form-group">
			  <label>Nama Peternak</label>
			  <input type = "text" name = "nama_peternak" class = "form-control" placeholder="Nama Peternak" autocomplete="off">
			  
			  <?php echo form_error('nama_peternak'); ?>
			
			</div>
			
			<div class="form-group">
			  <label>Nama Peternakan</label>
			  <input type = "text" name = "nm_peternakan" class = "form-control" placeholder="Nama Peternakan" autocomplete="off">
			  <?php echo form_error('nm_peternakan'); ?>
			
			</div>

			<div class="form-group">
			  <label>No. Telepon</label>
			  <input type = "text" name = "notel" class = "form-control" placeholder="No. Telepon" autocomplete="off">
			  
			  <?php echo form_error('notel'); ?>
			
			</div>

			<div class="form-group">
			  <label>Alamat</label>
			  <input type = "text" name = "alamat" class = "form-control" placeholder="Alamat" autocomplete="off">
			  
			  <?php echo form_error('alamat'); ?>
			
			</div>

			<div class="form-group">
			  <label>Simpanan Pokok</label>
			  <input type = "text" name = "deposit" class = "form-control" value="<?= $simpanan?>" readonly>
			  <?php echo form_error('deposit'); ?>
			
			</div>
		
			
			  <hr>
			<button type="submit" class="btn btn-default btn-primary">Simpan</button>
			<a href = "<?php echo site_url()."/c_masterdata/lihat_peternak"?>" type="button" class="btn btn-default">Kembali</a>
		</form>
	</body>
</html>