<html>
	<body>
	<div class="x_panel">
		<div class="x_title">
			<h3 class="panel-title"><b>Daftar Pembelian Aset</b></h3>
		</div>
  	 	<div class="x_content">
  	 		<a href = "<?php echo site_url()."c_transaksi/form_pembelian_aset"?>" class="btn btn-info" role="button"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>

			<div class="table-responsive">
				<table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
					<thead>
						<tr class="headings">
							<th style="width: 2px;">No</th>
							<th class="text-center">ID Pembelian</th>
							<th class="text-center">No Nota</th>
							<th class="text-center">Tanggal Pembelian</th>
							<th class="text-center">Total</th>
							<th style="width: 10%;" class="text-center">Status</th>
							<th style="width: 10%;" class="text-center">Aksi</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						$no = 1;
						foreach ($detail as $data) { ?>
							<tr>
								<td><?= $no++ ?></td>
								<td><?= $data->id_pembelian ?></td>
								<td><?= $data->no_nota ?></td>
								<td><?= $data->tgl_input ?></td>
								<td class="text-right"><?= format_rp($data->total) ?></td>
								<td class="text-center"><?= $data->status == 'selesai' ? '<button class="btn btn-success btn-sm">Selesai</button>' : '<button class="btn btn-warning btn-sm">Pending</button>'?></td>
								<td class="text-center">
									<a href="<?= site_url("c_transaksi/perolehanDetail/".$data->id_pembelian)?>" class="btn btn-sm btn-info">Detail Pembelian</a>
								</td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</body>
</html>