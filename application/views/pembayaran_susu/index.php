<html>
	<body>
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Daftar Pembayaran Susu</b></h3>
  </div>
  	 <div class="x_content">
  	 	
  	 		<a href = "<?php echo site_url()."c_transaksi/form_pembayaran_susu"?>" class="btn btn-info" role="button"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>

  	 	 <table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
		 	<thead>
				<tr class="headings">
					<th style="width: 2px;">No</th>
					<th>Tanggal transaksi</th>
					<th>Anggota</th>
					<th>Total pembayaran</th>
					<th>Aksi</th>
				</tr>
			</thead>

			<tbody>
				<?php 
				$no = 1;
				foreach ($pembayaran_susu as $data) { ?>
					<tr>
						<td><?= $no++ ?></td>
						<td><?= date("d F Y", strtotime($data->tgl_transaksi)) ?></td>
						<td><?= $data->id_anggota ?> - <?= $data->nama_peternak ?></td>
						<td><?= format_rp($data->subtotal) ?></td>
						<td>
							
						</td>
					</tr>
				<?php } ?>
			</tbody>
		</table>

	
	
	</body>
</html>