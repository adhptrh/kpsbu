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
			<form method="POST" action="<?php echo site_url('c_masterdata/isi_edit_COA'); ?>">
				<input type="hidden" value="<?= $coa->id ?>" name="id">
				<div class="form-group">
					<label>No COA</label>
					<input type="text" name="no_coa" class="form-control" length="11" value="<?= $coa->no_coa ?>" autocomplete="off" readonly>
					<?php echo form_error('no_coa'); ?>
				</div>

				<div class="form-group">
					<label>Nama COA</label>
					<input type="text" name="nama_coa" class="form-control" value="<?= $coa->nama_coa ?>" readonly>

					<?php echo form_error('nama_coa'); ?>

				</div>

				<div class="form-group">
					<label>Saldo Awal</label>
					<input type="text" name="saldo_awal" class="form-control" value="<?= $coa->saldo_awal ?>" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
					<?php echo form_error('saldo_awal'); ?>

				</div>
				<div class="form-group">
					<label>Posisi debit/kredit</label>
						<select name="posisi_dr_cr" id="posisi_dr_cr" class="form-control">
							<option value="d"<?= $coa->saldo_normal == 'd' ? 'selected' : '' ?>>Debit</option>
							<option value="k"<?= $coa->saldo_normal == 'k' ? 'selected' : '' ?>>Kredit</option>
						</select>
					<?php echo form_error('saldo_awal'); ?>
				</div>
				<hr>
				<a href="<?php echo site_url() . "/c_masterdata/lihat_coa" ?>" type="button" class="btn btn-default">Kembali</a>
				<button type="submit" class="btn btn-default btn-primary">Simpan</button>
			</form>


		</body>

		<script>
			var rupiah = document.getElementById("rupiah");
			rupiah.addEventListener("keyup", function(e) {
				rupiah.value = formatRupiah(this.value, "");
			});

			function formatRupiah(angka, prefix) {
				var number_string = angka.replace(/[^,\d]/g, "").toString(),
					split = number_string.split(","),
					sisa = split[0].length % 3,
					rupiah = split[0].substr(0, sisa),
					ribuan = split[0].substr(sisa).match(/\d{3}/gi);
				if (ribuan) {
					separator = sisa ? "." : "";
					rupiah += separator + ribuan.join(".");
				}

				rupiah = split[1] != undefined ? rupiah + "," + split[1] : rupiah;
				return prefix == undefined ? rupiah : rupiah ? "" + rupiah : "";
			}
		</script>

</html>