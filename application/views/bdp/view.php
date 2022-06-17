<html>
	<!-- <head><center><h3><b>Master Data Produk Dalam Proses</b></h3></center></head>
	<hr> -->
	<body>
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Daftar Produk Dalam Proses</b></h3>
  </div>
  	 <div class="x_content">
  	 		<a href = "<?php echo site_url()."/c_masterdata/form_bdp"?>" class="btn btn-info" role="button"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>
  	 	 <table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
		 	<thead>
			<tr class="headings">
				<th style="width: 2px;">No</th>
				<th>ID Produk Dalam Proses</th>
				<th>Nama Produk Dalam Proses</th>
				<th>Stok</th>
				<th>Satuan</th>
				<th>Aksi</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
				foreach($result as $data){
					echo "

						<tr><td>$no</td>
							<td>".$data['no_bdp']."</td>
							<td>".$data['nama_bdp']."</td>
							<td align='right'>".$data['stok']."</td>
							<td>".$data['satuan']."</td>" ?>
							<td>
							<a href="isi_edit_bdp/<?php echo $data['no_bdp']; ?>">
								
							<span class="fa-stack">
							  <i class="fa fa-square fa-stack-2x" style="color:#2A3F54;"></i>
							 <span class="glyphicon glyphicon-pencil fa-stack-1x" aria-hidden="true" style="color:white"></span>
							</span></a>
							</td>
							<!--<td align="center">
							<a class="btn btn-warning" href="isi_edit_bdp/<?php echo $data['no_bdp']; ?>" onclick="return confirm('Yakin mau dihapus?')" class="btn btn-daner">Hapus</a>
					</td>-->

						</tr>
						
					<?php
					$no++;
				}
			?>
			</tbody>
		</table>

	
	
	</body>
</html>