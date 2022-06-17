<div class="x_panel">
	<div class="x_title">
		<h3 class="panel-title"><b>Penyusutan Aset</b></h3>
	</div>
	
	<div class="x_content">
	
		<body>
			<form method = "POST" action = "<?php echo site_url('c_transaksi/tambah_peny');?>">

				<?php $tgl_input = date("Y-m-d"); ?>
				<input type="hidden" name="tgl_input" value="<?= $tgl_input?>" >

				<input type="hidden" name="id" value="<?= $detail_peny->id_detail_aset ?>">
				
				<div class="form-group row">
					<label class="col-sm-1">ID Penyusutan</label>	
					<div class="col-sm-3">
						<input type="text" class="form-control" name="id_penyusutan" value="<?= $id_penyusutan?>" readonly>
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
						<input type="hidden" id="kd_peny_d" name="kd_peny_d">
						<input type="hidden" id="kd_peny_k" name="kd_peny_k">
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
						<!-- <?php $rumus = $detail_peny->subtotal/$detail_peny->jumlah ?> -->
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
					<label class="col-sm-1">Akumulasi</label>
					<div class="col-sm-3">
						<?php
						if (empty($log_penyusutan_kosong)) { ?>
							<input type="text" name="akumulasi_peny" class="form-control" value="<?= penyusutan($nilai_penyusutan)?>" readonly>
						<?php } else { ?>
							<input type="text" name="akumulasi_peny" class="form-control" value="<?= penyusutan($akumulasi_fix)?>" readonly>
						<?php } ?>
					</div>

					<label class="col-sm-1">Nilai buku</label>
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
				<a href="<?= base_url('c_transaksi/form_penyusutan')?>" class="btn btn-default">Kembali</a>
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
				var kd_peny_d = obj.kel_akun_peny_d
				var kd_peny_k = obj.kel_akun_peny_k
				$("#kd_peny_d").val(kd_peny_d)
				$("#kd_peny_k").val(kd_peny_k)
				// console.log(kd_peny_d)
			}
		})
	})
</script>