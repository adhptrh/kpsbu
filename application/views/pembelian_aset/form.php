<!-- <html> -->
<head>
	<title>Master Data Aset</title>
</head>
<!-- <link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css"> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<div class="x_panel">
	<div class="x_title">
		<h3 class="panel-title"><b>Form Aset</b></h3>
	</div>
	
	<div class="x_content">
	
		<body>
			<form method = "POST" action = "<?php echo site_url('c_transaksi/tambahPembelianAset');?>">
				
				<div class="form-group row">
					<label class="col-sm-1">ID Pembelian</label>	
					<div class="col-sm-3">
						<input type = "text" name = "id" class = "form-control" value="<?= $id ?>" readonly>
					</div>

					<label class="col-sm-1">ID Detail Aset</label>	
					<div class="col-sm-3">
						<input type = "text" name = "id_detail_aset" id="id_detail_aset" class = "form-control" autocomplete="off" value="<?= $id_detail?>" readonly>
					</div>

					<label class="col-sm-1">No Nota</label>	
					<div class="col-sm-3">
						<input type = "text" name = "no_nota" id="no_nota" class = "form-control" autocomplete="off" value="<?= $no_nota?>" readonly>
					</div>
					
				</div>
				<hr>

				<div id="form-data">
					
					<div class="form-group row">
						<label class="col-sm-1">Tanggal Beli</label>	
						<div class="col-sm-2">
							<input type = "text" name = "tgl_pembelian" class = "form-control" id="tgl_pembelian" placeholder="Tanggal Pembelian" autocomplete="off">
						</div>
					</div>


					<div class="form-group row">
						<label class="col-sm-1">Supplier</label>	
						<div class="col-sm-11">
							<select name="id_supplier" id="supplier" class="form-control">
								<option value="">Pilih supplier</option>
								<?php foreach ($supplier as $data) { ?>
									<option value="<?= $data->id?>"><?= $data->nama_supplier?></option>
								<?php } ?> 
							</select>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-1">Aset</label>	
						<div class="col-sm-11">
							<select name="id_aset" class="form-control" id="aset">
								<option value="">Pilih aset</option>
							</select>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-1">Harga Aset</label>	
						<div class="col-sm-2">
							<input type = "text" name = "harga_aset" class = "form-control" id="harga_aset" autocomplete="off" placeholder="Harga aset">
						</div>

						<label class="col-sm-1">Jumlah</label>	
						<div class="col-sm-2">
							<input type = "number" name = "jumlah" class = "form-control" id="jumlah" autocomplete="off" placeholder="Jumlah aset" min="1">
						</div>

						<label class="col-sm-1">Nilai Residu</label>	
						<div class="col-sm-2">
							<input type = "text" name = "nilai_residu" class = "form-control" id="nilai_residu" autocomplete="off" placeholder="Nilai residu">
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-1">Biaya</label>	
						<div class="col-sm-9">
							<input type = "text" name = "biaya" class = "form-control" id="biaya" autocomplete="off" placeholder="Biaya">
						</div>
						<div class="col-sm-2">
							<input type = "submit" value="Tambah" class="btn btn-primary btn-tambah" id="btn-tambah" style="width: 100%">
						</div>
					</div>
				</div>
			</form>
			<hr>
				<h5>Detail Pembelian Aset</h5>
				
				<table class="table table-bordered">
					<thead>
						<tr>
							<th class="text-center">No</th>
							<th class="text-center">Supplier</th>
							<th class="text-center">ID Detail Aset</th>
							<th class="text-center">Aset</th>
							<!-- <th class="text-center" style="width: 5%">Jumlah</th> -->
							<th class="text-center">Harga Aset</th>
							<th class="text-center">Biaya</th>
							<th class="text-center">Nilai residu</th>
							<th class="text-center">Total perolehan aset</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						$no = 1;
						foreach ($detail as $r) { ?>
						<tr>
							<td><?= $no++ ?></td>
							<td><?= $r->nama_supplier?></td>
							<td><?= $r->id_detail_aset ?></td>
							<td><?= $r->id.' - '.$r->aset?></td>
							<td class="text-right"><?= format_rp($r->nominal)?></td>
							<td class="text-right"><?= format_rp($r->biaya)?></td>
							<td class="text-right"><?= format_rp($r->nilai_sisa)?></td>
							<td class="text-right"><?= format_rp($r->subtotal)?></td>
						</tr>
						<?php } ?>
					</tbody>
					<tfoot>
						<tr>
							<th colspan="7">Subtotal</th>
							<th colspan="1" class="text-right"><?= format_rp($total) ?></th>
						</tr>
					</tfoot>
					
				</table>
				<input readonly type = "hidden" class = "form-control" value = "<?php echo $total;?>">
				<!-- <input readonly type = "text" class = "form-control" value = "<?php echo $nilai_sisa;?>"> -->
				<?php $tgl_input = date('Y-m-d');?>
				<input type="hidden" name="tgl_input" value="<?= $tgl_input?>">
				
				<hr>
				<?php if ($cek == NULL) { ?>
				<a href = "#" class="btn btn-danger" role="button">Selesai</a>

				<a href = "<?php echo site_url()."/c_transaksi/pembelian_aset"?>" type="button" class="btn btn-default">Kembali</a>


				<?php } else { ?>
				
				<a href = "<?php echo site_url()."/c_transaksi/selesai/$id/$total"?>" class="btn btn-success" role="button">Selesai</a>

				<a href = "<?php echo site_url()."/c_transaksi/pembelian_aset"?>" type="button" class="btn btn-default">Kembali</a>
				<?php } ?>
		</body>
	</div>
</div>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(document).ready(function () {
		$("#tgl_pembelian").datepicker({
			dateFormat: 'dd/mm/yy', 
			minDate: 0
		});

		$("#supplier").change(function () {
			var id_supplier = $("#supplier").val();
			// console.log(id)
			if (id_supplier != '') {
				$.ajax({
				url:"<?php echo base_url("c_transaksi/aset")?>",
				method:"POST",
				data:{id_supplier:id_supplier},
				success:function(data)
					{
					// console.log(data)
					$("#aset").html(data);
					}
				});
			}
		});

		$("#supplier").prop("disabled", true);
		$("#aset").prop("disabled", true);
		$("#harga_aset").prop("readonly", true);
		$("#nilai_residu").prop("readonly", true);
		$("#biaya").prop("readonly", true);
		$("#jumlah").prop("readonly", true);
		$("#btn-tambah").prop("disabled", true);

		// $("#no_nota").on("click", function () {
			$("#tgl_pembelian").on("change" , function () {
				var value = this.value;
			// console.log(value)
				var valNota = $("#no_nota").val();
				var valTgl = $("#tgl_pembelian").val();

				console.log(valTgl)

				if (valTgl.length !== 0) {
					$("#supplier").prop("disabled", false);
					$("#aset").prop("disabled", false);
					$("#harga_aset").prop("readonly", false);
					$("#nilai_residu").prop("readonly", false);
					$("#biaya").prop("readonly", false);
					$("#jumlah").prop("readonly", false);
					$("#btn-tambah").prop("disabled", false);
				} else {
					$("#supplier").prop("disabled", true);
					$("#aset").prop("disabled", true);
					$("#harga_aset").prop("readonly", true);
					$("#nilai_residu").prop("readonly", true);
					$("#biaya").prop("readonly", true);
					$("#jumlah").prop("readonly", true);
					$("#btn-tambah").prop("disabled", true);
				}
			})
		// })
	});
</script>
<?php $this->load->view("pembelian_aset/script")?>