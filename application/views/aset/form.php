<html>
	<head>
		<title>Master Data Aset</title>
	</head>
	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
	<div class="x_panel">
 		<div class="x_title">
    		<h3 class="panel-title"><b>Form Aset</b></h3>
  		</div>
  	 	
  	 	<div class="x_content">
  	 	
			<body>
				<form method = "POST" action = "<?php echo site_url('c_masterdata/simpan_aset');?>">
					
					<div class="form-group">
					  <label>ID Aset</label>
					  <input type = "text" name = "id_aset" class = "form-control" value="<?php echo $id?>" readonly>
					</div>

					<div class="form-group">
					  <label>Aset</label>
					  <input type = "text" name = "aset" class = "form-control" autocomplete="off" required>
					  <?php echo form_error('aset'); ?>
					</div>

					<div class="form-group">
					  <label>Umur Aset (*per Bulan)</label>
					  <input type = "number" name = "umur_aset" class = "form-control" min="0" required>
					  <?php echo form_error('umur_aset'); ?>
					</div>

					<div class="form-group">
					  <label>Supplier Aset</label>
					  <select name="supplier" class="form-control select2" id="supplier" required>
					  	<option value="">Pilih supplier</option>
					  	<?php foreach ($supplier as $d) { ?>
					  	<option value="<?= $d->id?>"><?= $d->nama_supplier?></option>
					  	<?php } ?>
					  </select>
					  <?php echo form_error('umur_aset'); ?>
					</div>	

					<div class="form-group">
					  <label for="kel_akun">Kelompok Akun</label>
					  <select name="kel_akun" class="form-control select2" id="kel_akun" required>
					  	<option value="">Kelompok Akun</option>
					  	<?php foreach ($coa as $d) { ?>
					  	<option value="<?= $d->no_coa?>"><?= $d->nama_coa?></option>
					  	<?php } ?>
					  </select>
					  <?php echo form_error('kel_akun'); ?>
					</div>

					<div class="form-group">
					  <label for="kel_akun">Penyusutan Debit</label>
					  <select name="kel_akun_d" class="form-control select2" required>
					  	<option value="">Kel.Akun Penyusutan Debit</option>
					  	<?php foreach ($coa as $d) { ?>
					  	<option value="<?= $d->no_coa?>"><?= $d->nama_coa?></option>
					  	<?php } ?>
					  </select>
					  <?php echo form_error('kel_akun_d'); ?>
					</div>

					<div class="form-group">
					  <label for="kel_akun">Penyusutan Kredit</label>
					  <select name="kel_akun_k" class="form-control select2" required>
					  	<option value="">Kel.Akun Penyusutan Kredit</option>
					  	<?php foreach ($coa as $d) { ?>
					  	<option value="<?= $d->no_coa?>"><?= $d->nama_coa?></option>
					  	<?php } ?>
					  </select>
					  <?php echo form_error('kel_akun_k'); ?>
					</div>				
					
					<hr>
					<input type="submit" class="btn btn-default btn-primary" value="Simpan">
					<a href = "<?php echo site_url()."/c_masterdata/aset"?>" type="button" class="btn btn-default">Kembali</a>
				</form>
			</body>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.select2').select2()
		})
	</script>
</html>