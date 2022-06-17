<html>

<head>
	<title>Form Input COA</title>
</head>
<!-- <center><h3><b>Master Data COA</b></h3></center>
	<hr> -->
<div class="x_panel">
	<div class="x_title">
		<h3 class="panel-title"><b>Form COA</b></h3>
	</div>
	<div class="x_content">

		<body>
			<form method="POST" action="<?php echo site_url('c_masterdata/tambah_coa'); ?>">

				<div class="form-group">
					<label>No COA</label>
					<input type="text" name="no_coa" class="form-control" length="11" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
					<?php echo form_error('no_coa'); ?>
				</div>
				<div class="form-group">
					<label>Nama COA</label>
					<input type="text" name="nama_coa" class="form-control">

					<?php echo form_error('nama_coa'); ?>

				</div>
				<div class="form-group">
					<label>Saldo Awal</label>
						<input type="text" name="saldo_awal" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
					<?php echo form_error('saldo_awal'); ?>
				</div>
				<div class="form-group">
					<label>Posisi debit/kredit</label>
						<select name="posisi_dr_cr" id="posisi_dr_cr" class="form-control">
							<option value="d">Debit</option>
							<option value="k">Kredit</option>
						</select>
					<?php echo form_error('saldo_awal'); ?>
				</div>
				<hr>
				<button type="submit" class="btn btn-default btn-primary">Simpan</button>
				<a href="<?php echo site_url() . "/c_masterdata/lihat_coa" ?>" type="button" class="btn btn-default">Kembali</a>
			</form>
		</body>

</html>