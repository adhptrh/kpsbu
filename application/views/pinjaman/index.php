<html>
	<!-- <head><center><h3><b>Master Data Bahan Baku</b></h3></center></head>
	<hr> -->
	<body>
		<div class="x_panel">
 	<div class="x_title">
    	<h3 class="panel-title"><b>Daftar Pinjaman</b></h3>
  	</div>
  	
  	<div class="x_content">
  	 	<a href = "<?php echo site_url()."c_transaksi/form_pinjaman"?>" class="btn btn-info" role="button"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>

  	 	 <table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
		 	<thead>
				<tr class="headings">
					<th style="width: 2px;">No</th>
					<th>Kode Pinjaman</th>
					<th>Nama Anggota</th>
					<th>Tanggal Pinjaman</th>
					<th>Nominal</th>
					<th class="text-center">Status</th>
				</tr>
			</thead>
			<?php
			$no = 1;
			$status = "";
			foreach ($index as $data) { ?>
				<tr>
					<td><?= $no++ ?></td>
					<td><?= $data->kode_pinjaman ?></td>
					<td><?= $data->nama_peternak ?></td>
					<td><?= date('d F Y', strtotime($data->tanggal_pinjaman)) ?></td>
					<td class="text-right"><?= format_rp($data->nominal) ?></td>
					<td class="text-center" style="width: 13%;">
						<?php if ($data->status == 1) { 
							echo "<button class='btn btn-warning btn-sm'>Belum lunas</button>"; 
						} else {
							echo "<button class='btn btn-success btn-sm'>Sudah lunas</button>";
						} ?>
					</td>
				</tr>
			<?php } ?>
			<tbody>
			</tbody>
		</table>
	</body>
</html>