<html>
<head></head>

<body>

		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><center><b>Edit BTKL IPS</b></center></h3>
  </div>
  	 <div class="x_content">
<div>
<form method="POST" action="<?php echo site_url().'/c_masterdata/edit_btk'; ?>">
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>ID BTKL IPS</label>
				<input readonly type="text" class="form-control" name="no_btk" value="<?php echo $data['no_btk'] ; ?>"  >
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>Tanggal</label>
				<input readonly type="text" class="form-control" name="tgl_btkl" value="<?php echo $data['tgl_btk'] ; ?>"  >
			</div>
		</div>
	</div>
	<!-- <div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>Bulan</label>
			 <input readonly type="text" class="form-control" name="bulan" value="<?php echo $data['bulan'] ; ?>"  >
			  
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>Tahun</label>
			<input readonly type="text" class="form-control" name="tahun" value="<?php echo $data['tahun'] ; ?>" >
			</div>
		</div>
	</div> -->
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				<label>Jumlah Tenaga Kerja</label>
				<input type = "text" name = "jumlah_pgw" class = "form-control" value="<?php echo $data['jumlah_pgw'] ; ?>" >
			</div>
		</div>
	<?php echo form_error('jumlah_pgw'); ?>
	</div>
	<div class="form-group">
		<div class="row">
			<div class="col-xs-4">
				 <label>Variabel Tarif Tenaga Kerja</label>
			<input  type="text" class="form-control" name="tarif" value="<?php echo $data['tarif'] ; ?>"  >
			</div>
		</div>
	<?php echo form_error('tarif'); ?>
	</div>
		<input type="submit" name="submit" class="btn btn-primary" value="Simpan">

		<a href = "<?php echo site_url()."/c_masterdata/lihat_btk"?>" class="btn btn-default" role="button">Kembali</a><!-- 
		<a href="lihat_BTKL" class="btn btn-default">Back</a>
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