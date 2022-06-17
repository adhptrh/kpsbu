<html>
	<!-- <head>
		<title>Master Data Bahan Baku</title>
	</head> -->
	
	<div class="x_panel">
 		<div class="x_title">
    		<h3 class="panel-title"><b>Edit Aset</b></h3>
  		</div>
  	 	
  	 	<div class="x_content">
  	 	
			<body>
				<form method = "POST" action = "<?php echo site_url('c_masterdata/edit_aset');?>">
					
					<div class="form-group">
					  <label>ID Aset</label>
					  <input type = "text" name = "id_aset" class = "form-control" value="<?php echo $data['id']?>" readonly>
					</div>

					<div class="form-group">
					  <label>Aset</label>
					  <input type = "text" name = "aset" class = "form-control" value="<?= $data['aset'] ?>">
					  <?php echo form_error('aset'); ?>
					</div>

					<div class="form-group">
					  <label>Umur Aset</label>
					  <input type = "number" name = "umur_aset" class = "form-control" min="0" value="<?= $data['umur_aset'] ?>">
					  <?php echo form_error('umur_aset'); ?>
					</div>

					<div class="form-group">
					  <label>Supplier Aset</label>
					  <select name="supplier" class="form-control" id="supplier">
					  	<option value="">Pilih supplier</option>
					  	<?php foreach ($supplier as $d) { ?>
					  	<option value="<?= $d->id?>" <?php if ($d->id == $data['id_supplier']) : ?>selected="selected"<?php endif ?>><?= $d->nama_supplier?></option>
					  	<?php } ?>
					  </select>
					  <?php echo form_error('supplier'); ?>
					</div>	
					
					
					<hr>
					<input type="submit" class="btn btn-default btn-primary" value="Simpan">
					<a href = "<?php echo site_url()."/c_masterdata/aset"?>" type="button" class="btn btn-default">Kembali</a>
				</form>
			</body>
		</div>
	</div>
</html>