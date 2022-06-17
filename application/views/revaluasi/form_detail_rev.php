<div class="x_panel">
	<div class="x_title">
		<h3 class="panel-title"><b>Revaluasi Aset</b></h3>
	</div>
	
	<div class="x_content">
	
		<body>
			<form method = "POST" action = "<?php echo site_url('c_transaksi/tambah_rev');?>">

				<?php $tgl_input = date("Y-m-d"); ?>
				<input type="hidden" name="tgl_input" value="<?= $tgl_input?>" >

				<input type="hidden" name="id" value="<?= $detail_peny->id_detail_aset ?>">
				<input type="hidden" name="id_penyusutan" value="<?= $id_pny ?>">
				
				<div class="form-group row">
					<label class="col-sm-1">ID Revaluasi</label>	
					<div class="col-sm-3">
						<input type="text" class="form-control" name="id_revaluasi" value="<?= $id_revaluasi?>" readonly>
					</div>

					<label class="col-sm-1">Bulan penyusutan</label>	
					<div class="col-sm-3">
						<input type="text" class="form-control" name="bln_peny" value="<?= $month_now ?>" readonly>
					</div>
				</div>

				<hr>

				<div class="form-group row">
					<label class="col-sm-1">ID Detail Aset</label>	
					<div class="col-sm-2">
						<input type="text" class="form-control" name="aset" id="id_detail" value="<?= $detail_peny->id_detail_aset?>" readonly>
						<input type="text" id="kd_akun" name="kd_akun">
						<input type="text" id="kd_peny_d" name="kd_peny_d">
						<input type="text" id="kd_peny_k" name="kd_peny_k">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-1">Nama Aset</label>	
					<div class="col-sm-2">
						<input type="text" class="form-control" name="aset" value="<?= $detail_peny->aset?>" readonly>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-1">Umur Ekonomis</label>	
					<div class="col-sm-1">
						<input type="text" class="form-control" name="aset" value="<?= $detail_peny->sisa_umur_aset?>" readonly>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-1">Sisa UE</label>	
					
					<div class="col-sm-1">
						<input type="text" class="form-control" name="aset" value="<?= $detail_peny->sisa_umur?>" readonly>
					</div>
				</div>

				<hr>

				<div class="form-group row">
					<label class="col-sm-1">Tanggal Perolehan</label>	
					<div class="col-sm-3">
						<input type="text" class="form-control" name="aset" value="<?= date('d F Y', strtotime($detail_peny->tgl_input)) ?>" readonly>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-1">Harga perolehan</label>	
					<div class="col-sm-3">

						<?php if (empty($log_penyusutan_kosong)) { ?>
						<input type="text" class="form-control" name="harga_perolehan" value="<?= format_rp($detail_peny->subtotal) ?> " readonly>
						<?php } else { ?>
						<input type="text" class="form-control" name="harga_perolehan" value="<?= format_rp($log_penyusutan_kosong->nilai_akhir)?>" readonly>
						<?php } ?>

					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-1">Nilai sisa</label>	
					<div class="col-sm-3">
						<input type="text" class="form-control" name="nilai_sisa" value="<?= format_rp($detail_peny->nilai_sisa)?>" readonly>
					</div>
				</div>

				<hr>

				<div class="form-group row">
					<label class="col-sm-1">Nilai penyusutan</label>	
					<div class="col-sm-3">
						<?php if (empty($log_penyusutan_kosong)) { ?>
							<input type="text" class="form-control" name="nilai_penyusutan" value="<?= penyusutan($nilai_penyusutan)?>" readonly>
						<?php } else { ?>
							<input type="text" class="form-control" name="nilai_penyusutan" value="<?= penyusutan($nilai_penyusutan_fix)?>" readonly>
						<?php } ?>
					</div>

					<!-- <div> -->
					<!-- nilai bukunya disini -->
					<label class="col-sm-1">Akumulasi Penyusutan</label>
					<div class="col-sm-3">
						<?php
						if (empty($log_penyusutan_kosong)) { ?>
							<input type="text" name="akumulasi_peny" class="form-control" value="<?= penyusutan($nilai_penyusutan)?>" readonly>
						<?php } else { ?>
							<input type="text" name="akumulasi_peny" class="form-control" value="<?= penyusutan($akumulasi_fix)?>" readonly>
						<?php } ?>
					</div>

					<label class="col-sm-1">Nilai Buku</label>
					<div class="col-sm-2">
						<?php
						if (empty($log_penyusutan_kosong)) { ?>
							<input type="text" name="nilai_akhir" class="form-control" value="<?= penyusutan($detail_peny->subtotal - $nilai_penyusutan)?>" readonly>
						<?php } else { ?>
							<input type="text" name="nilai_akhir" class="form-control" value="<?= penyusutan($log_penyusutan_kosong->nilai_akhir - $nilai_penyusutan)?>" readonly>
						<?php } ?>
					</div>
				</div>
				<hr>
				<div class="form-group row">
					<label class="col-sm-1">Tarif Peny. Revaluasi</label>	
					<div class="col-sm-3">
						<input type="text" name="tarif_rev" class="form-control" value="<?= penyusutan($nilai_rev)?>" readonly>
						<input type="hidden" value="<?= $nilai_perbaikan?>" name="nilai_perbaikannya">
					</div>

					<!-- <div> -->
					<!-- nilai bukunya disini -->
					<label class="col-sm-1">Nilai Buku Perbaikan</label>
					<div class="col-sm-3">
						<!-- <input type="text" name="nilai_buku_perbaikan" class="form-control" value="<?= penyusutan($nilai_buku_perbaikan) ?>" readonly> -->
						<?php if (empty($log_rev)) { ?>
							<input type="text" name="nilai_buku_perbaikan" class="form-control" value="<?= penyusutan($nilai_buku_perbaikan)?>" readonly>
						<?php } else { ?>
							<input type="text" name="nilai_buku_perbaikan" class="form-control" value="<?= penyusutan($log_rev->nilai_buku_perbaikan - $log_rev->tarif_revaluasi)?>" readonly>
						<?php } ?>
					</div>

					<label class="col-sm-1">Nilai Buku Baru</label>
					<div class="col-sm-2">
						<?php if (empty($log_rev)) { ?>
							<input type="text" name="nilai_buku_baru" class="form-control" value="<?= penyusutan(($log_penyusutan_kosong->nilai_akhir - $nilai_penyusutan) + $nilai_buku_perbaikan)?>" readonly>
						<?php } else { ?>
							<input type="text" name="nilai_buku_baru" class="form-control" value="<?= penyusutan( ($log_rev->nilai_buku_perbaikan - $log_rev->tarif_revaluasi) + ($log_penyusutan_kosong->nilai_akhir - $nilai_penyusutan))?>" readonly>
						<?php } ?>
						<!-- <input type="text" name="nilai_buku_baru" class="form-control" value="<?= penyusutan(($log_penyusutan_kosong->nilai_akhir - $nilai_penyusutan) + $nilai_buku_perbaikan)?>" readonly> -->
					</div>
				</div>
				<hr>
				<a href="<?= base_url('c_transaksi/form_revaluasi')?>" class="btn btn-default">Kembali</a>
				<input type="submit" name="submit" value="Simpan" class="btn btn-primary" >
			</form>
		</body>
	</div>
</div>
<script>
	$(document).ready(function() {
		var id_detail = $("#id_detail").val()
		$.ajax({
			url: "<?= base_url('c_transaksi/getKd')?>", 
			type: "post",
			data: {
				id_detail:id_detail
			}, 
			success:function(data) {
				var obj = JSON.parse(data)
				var kd_akun = obj.kel_akun
				var kd_peny_d = obj.kel_akun_peny_d
				var kd_peny_k = obj.kel_akun_peny_k
				$("#kd_akun").val(kd_akun)
				$("#kd_peny_d").val(kd_peny_d)
				$("#kd_peny_k").val(kd_peny_k)
				// console.log(kd_peny_d)
			}
		})
	})
</script>