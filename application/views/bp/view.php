<html>
	<!-- <head><center><h3><b>Master Data Bahan Penolong</b></h3></center></head>
	<hr> -->
	<body>
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Daftar Bahan Penolong</b></h3>
  </div>
  	 <div class="x_content">
  	 		<a href = "<?php echo site_url()."/c_masterdata/form_bp"?>" class="btn btn-info" role="button"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>
  	 	 <table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
		 	<thead>
			<tr class="headings">
				<th style="width: 2px;">No</th>
				<th>ID Bahan Penolong</th>
				<th>Nama Bahan Penolong</th>
				<!-- <th>Harga</th> -->
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
							<td>".$data['no_bp']."</td>
							<td>".$data['nama_bp']."</td>
							<td>".$data['satuan']."</td>" ?>
							<td>
							<a href="isi_edit_bp/<?php echo $data['no_bp']; ?>">
								
							<span class="fa-stack">
							  <i class="fa fa-square fa-stack-2x" style="color:#2A3F54;"></i>
							 <span class="glyphicon glyphicon-pencil fa-stack-1x" aria-hidden="true" style="color:white"></span>
							</span></a>
							</td>
							<!--<td align="center">
							<a class="btn btn-warning" href="isi_edit_bp/<?php echo $data['no_bp']; ?>" onclick="return confirm('Yakin mau dihapus?')" class="btn btn-daner">Hapus</a>
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