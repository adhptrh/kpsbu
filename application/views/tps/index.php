<html>
	<body>
		<div class="x_panel">
			<div class="x_title">
				<h3 class="panel-title"><b>Daftar TPS</b></h3>
			</div>
	  	 		
	 		<div class="x_content">
	  	 		<a href = "<?php echo site_url()."c_masterdata/tambah_tps"?>" class="btn btn-info" role="button">
	  	 			<span class="glyphicon glyphicon-plus"></span> Tambah Data
	  	 		</a>

		 		<div class="table-responsive">
					<table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
						<thead>
							<tr class="headings">
								<th style="width: 2px;">No</th>
								<th>ID Tps</th>
								<th>Alamat Tps</th>
								<th>Kordinator Wilayah</th>
								<th style="width: 15%;" class="text-center">Aksi</th>
							</tr>
						</thead>
						<tbody>
						<?php 
						$no = 1;
						foreach ($tps as $d) { ?>
							<tr>
								<td><?= $no++ ?></td>
								<td><?= $d->kode_tps?></td>
								<td><?= $d->alamat?></td>
								<td><?= $d->kordinator?></td>
								<td></td>
							</tr>
						<?php } ?>
						</tbody>
					</table>
				</div>
	 		</div>
	 	</div>
	</body>
</html>