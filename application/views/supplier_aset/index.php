<html>
	<!-- <head><center><h3><b>Master Data Bahan Baku</b></h3></center></head>
	<hr> -->
	<body>
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Daftar Supplier Aset</b></h3>
  </div>
  	 <div class="x_content">
  	 	
  	 		<a href = "<?php echo site_url()."/c_masterdata/form_supplier_aset"?>" class="btn btn-info" role="button"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>

  	 	 <table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
		 	<thead>
				<tr class="headings">
					<th style="width: 2px;">No</th>
					<th>Nama Supplier</th>
					<th>Alamat</th>
					<th>No Telepon</th>
					<th class="text-center">Aksi</th>
				</tr>
			</thead>
			<?php $no = 1;?>
			<tbody>
				<?php foreach ($supplier_aset as $r) { ?> 
					<tr>
						<td><?= $no++ ?></td>
						<td><?= $r->nama_supplier?></td>
						<td><?= $r->alamat?></td>
						<td style="text-align:right;"><?= $r->no_telepon?></td>
						<td class="text-center">
							<a href="<?= site_url("c_masterdata/edit_supplier/". $r->id) ?>">
								<span class="fa-stack">
								  	<i class="fa fa-square fa-stack-2x" style="color:#2A3F54;"></i>
								 	<span class="glyphicon glyphicon-pencil fa-stack-1x" aria-hidden="true" style="color:white"></span>
								</span>
							</a>

							<!-- <a href="<?= site_url("c_masterdata/hapusSupplier/". $r->id) ?>">
								<span class="fa-stack">
								  	<i class="fa fa-square fa-stack-2x" style="color:#2A3F54;"></i>
								 	<span class="glyphicon glyphicon-trash fa-stack-1x" aria-hidden="true" style="color:white"></span>
								</span>
							</a> -->
						</td>
					</tr>
				<?php } ?>
			</tbody>
		</table>

	
	
	</body>
</html>