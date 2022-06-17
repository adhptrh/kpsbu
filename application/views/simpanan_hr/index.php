<html>
	<body>
		<div class="x_panel">
 	<div class="x_title">
    	<h3 class="panel-title"><b>Daftar Simpanan Hari Raya</b></h3>
  	</div>
  	
  	<div class="x_content">
  	 	<a href = "<?php echo site_url()."c_transaksi/form_hr"?>" class="btn btn-info" role="button"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>

  	 	 <table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
		 	<thead>
				<tr class="headings">
					<th style="width: 2px;">No</th>
					<th>Kode Simpanan</th>
					<th>Nama Anggota</th>
					<th>Tanggal Simpanan</th>
					<th>Nominal</th>
				</tr>
			</thead>
			<?php 
			$no = 1; 
			foreach ($index as $data) { ?>
				<tr>
					<td><?= $no++ ?></td>
					<td><?= $data->kode_simpanan_hr ?></td>
					<td><?= $data->nama_peternak ?></td>
					<td><?= date("d F Y", strtotime($data->tgl_simpanan)) ?></td>
					<td class="text-right"><?= format_rp($data->nominal)?></td>
				</tr>
			<?php } ?>
			<tbody>
			</tbody>
		</table>
	</body>
</html>