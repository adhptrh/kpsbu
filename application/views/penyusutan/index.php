<html>
	<body>
		<div class="x_panel">
			<div class="x_title">
				<h3 class="panel-title"><b>Daftar Peyusutan Aset</b></h3>
			</div>
			<div class="x_content">
				<div class="" role="tabpanel" data-example-id="togglable-tabs">
					<a href = "<?php echo site_url()."c_transaksi/form_penyusutan"?>" class="btn btn-info btn-sm" role="button"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>

					<table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
						<thead>
							<tr class="headings">
								<th style="width: 5%;">No</th>
								<th>ID Penyusutan</th>
								<th>Bulan Penyusutan</th>
								<th>Nama Aset</th>
								<th>Nilai Penyusutan</th>
								<th style="width: 17%;" class="text-center"></th>
							</tr>
						</thead>
						<tbody>
							<?php 
							$no = 1;
							foreach ($penyusutan as $key => $value) { ?>
							<tr>
								<td><?= $no++ ?></td>
								<td><?= $value->id_penyusutan ?></td>
								<td><?= $value->bulan_penyusutan ?></td>
								<td><?= $value->aset ?> - <b><?= $value->id_detail_aset ?></b></td>
								<td class="text-right"><?= penyusutan($value->total_penyusutan) ?></td>
								<td class="text-center">
									<!-- <a href="#" class="btn btn-primary" data-target="#detail_modal_<?= $value->id_penyusutan ?>" data-toggle="modal">Detail</a> -->
									<a href="<?= base_url('c_transaksi/detail/'.$value->id_penyusutan)?>" class="btn btn-primary btn-sm">Detail Penyusutan</a>
								</td>
							</tr>
							<?php } ?>
						</tbody> 
					</table>
				</div>
			</div>
		</div>
		<?php $this->load->view('penyusutan/detail_modal');?>
	</body>
</html>