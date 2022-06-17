<html>
	<head>
		<!-- <title>Master Data Pinjaman</title> -->
	</head>
	<div class="x_panel">
 		<div class="x_title">
    	<h3 class="panel-title"><b>Form Simpanan Hari Raya</b></h3>
  	</div>
  	 
  	<div class="x_content">
		<body>
			<form method = "POST" action = "<?php echo site_url('c_transaksi/simpan_hr');?>">

				<div class="form-group">
				  <label>Kode Pinjaman</label>
				  <input type = "text" name = "kode_simpanan" class = "form-control" value="<?php echo $kode_simpanan_hr?>" readonly>
				</div>

				<div class="form-group">
				  <label>Tanggal Simpanan</label>
				  <input type = "date" name = "tgl_simpanan_hr" class = "form-control">
				</div>

				<div class="form-group">
				  <label>Anggota</label>
				  <select name="peternak" class="form-control" id="anggota" required="">
				  	<option value="" >Pilih Anggota</option>
				  	<?php foreach ($anggota as $data) { ?>
				  		<option value="<?= $data->no_peternak?>"><?= $data->nama_peternak?></option>
				  	<?php }?>
				  </select>
				  <?php echo form_error('simpanan'); ?>
				</div>

				<div class="form-group">
				  <label>Nominal Simpanan</label>
				  <input type = "text" name ="biaya" class = "form-control" id="biaya" placeholder="Nominal Simpanan" required="">
				  <?php echo form_error('biaya'); ?>
				</div>
				
				<hr>
				<button type="submit" id="btn-simpan" class="btn btn-default btn-primary">Simpan</button>

				<a href = "<?php echo site_url()."/c_transaksi/simpanan_hr"?>" type="button" class="btn btn-default">Kembali</a>
			</form>
		</body>
	</div>
</html>
<?php $this->load->view("simpanan_hr/script") ?>