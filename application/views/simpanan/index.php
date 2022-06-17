<html>
	<!-- <head><center><h3><b>Master Data Bahan Baku</b></h3></center></head>
	<hr> -->
	<body>
		<div class="x_panel">
 	<div class="x_title">
    	<h3 class="panel-title"><b>Daftar Simpanan</b></h3>
  	</div>
  	
  	<div class="x_content">
  	 	<a href = "<?php echo site_url()."c_masterdata/form_simpanan"?>" class="btn btn-info" role="button"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>

  	 	 <table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
		 	<thead>
				<tr class="headings">
					<th style="width: 2px;">No</th>
					<th style="width: 20%">Kode Jenis Simpanan</th>
					<th>Simpanan</th>
					<th>Biaya</th>
					<th>Aksi</th>
				</tr>
			</thead>
			<?php $no = 1;?>
			<tbody>
				<?php foreach ($simpanan as $r) { ?>
					<tr>
						<td><?= $no++ ?></td>
						<td><?= $r->kode_simpanan?></td>
						<td><?= $r->simpanan?></td>
						<td style="text-align:right;"><?= format_rp($r->biaya)?></td>
						<td style="width: 10%">
							<a href="<?= site_url("c_masterdata/editSimpanan/".$r->kode_simpanan) ?>" class="btn btn-warning btn-sm">Edit</a>

							<a href="<?= site_url("c_masterdata/hapusSimpanan/". $r->kode_simpanan) ?>" class="btn btn-danger btn-sm">Delete</a>
						</td>
					</tr>
				<?php } ?>
			</tbody>
		</table>
	</body>
</html>