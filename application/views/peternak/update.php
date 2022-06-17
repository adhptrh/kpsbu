<html>
<head></head>

<body>

		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><center><b>Edit Peternak</b></center></h3>
  </div>
  	 <div class="x_content">
<div>
<form method="POST" action="<?php echo site_url().'/c_masterdata/edit_peternak'; ?>">
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>ID Peternak</label>
				<input readonly type="text" class="form-control" name="no_peternak" value="<?php echo $data['no_peternak'] ; ?>"  >
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>TPS</label>
				<select name="tps" id="" class="form-control" required>
					<option value="">Pilih TPS</option>
					<?php foreach ($tps as $key => $value) { ?>
					<option value="<?= $value->kode_tps ?>"<?= $value->kode_tps == $data['kd_tps'] ? 'selected' : '';?>><?= $value->alamat?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<?php echo form_error('tps'); ?>
	</div>

	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>Nama Peternak</label>
				<input type="text" class="form-control" name="nama_peternak" value="<?php echo $data['nama_peternak'] ; ?>" >
			</div>
		</div>
		<?php echo form_error('nama_peternak'); ?>
	</div>

	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>Nama Peternakan</label>
				<input type="text" class="form-control" name="nm_peternakan" value="<?php echo $data['nm_peternakan'] ; ?>" >
			</div>
		</div>
		<?php echo form_error('nama_peternak'); ?>
	</div>

	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>No. Telepon</label>
				<input type="text" class="form-control" name="notel" value="<?php echo $data['notel'] ; ?>" >
			</div>
		</div>
		<?php echo form_error('notel'); ?>
	</div>

	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>Alamat</label>
				<input type="text" class="form-control" name="alamat" value="<?php echo $data['alamat'] ; ?>" >
			</div>
		</div>
		<?php echo form_error('alamat'); ?>
	</div>


	
		<input type="submit" name="submit" class="btn btn-primary" value="Simpan">

		<a href = "<?php echo site_url()."/c_masterdata/lihat_peternak"?>" class="btn btn-default" role="button">Kembali</a><!-- 
		<a href="lihat_peternak" class="btn btn-default">Back</a>
		<input type="button" class="btn btn-default" value="Back" onClick=history.go(-1);> -->
	</div>
	</div>
	</div>
</form>
</div>
</div>
</div>
</body>
</html>