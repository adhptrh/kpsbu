<html>
	<!-- <head><center><h3><b>Master Data BTKL</b></h3></center></head>
	<hr> -->
	<body>
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Daftar BTKL Olahan</b></h3>
  </div>
  	 <div class="x_content">
  	 	<?php if($cek == TRUE){?>
  	 		<a href = "#" class="btn btn-info" role="button" disabled="disabled"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>
  	 	<?php }else{ ?>
  	 		<a href = "<?php echo site_url()."/c_masterdata/form_btko"?>" class="btn btn-info" role="button"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>
  	 	<?php } ?>
  	 	 <table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
		 	<thead>
			<tr class="headings">
				<th style="width: 2px;">No</th>
				<th>ID BTKL Olahan</th>
				<th>Tanggal</th>
<!-- 				<th>Bulan</th>
				<th>Tahun</th>
 -->				<th>Jumlah Tenaga Kerja</th>
				<th>Variabel Tarif Tenaga Kerja (Perhari)</th>
				<th>Aksi</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
				foreach($result as $data){
					echo "

						<tr><td>$no</td>
							<td>".$data['no_btko']."</td>
							<td>".$data['tgl_btko']."</td>
							<td align='right'>".$data['jumlah_pgw']."</td>
							<td align='right'>".format_rp($data['tarif'])."</td>
							" ?>
							<td>
							<a href="isi_edit_btko/<?php echo $data['no_btko']; ?>">
								
							<span class="fa-stack">
							  <i class="fa fa-square fa-stack-2x" style="color:#2A3F54;"></i>
							 <span class="glyphicon glyphicon-pencil fa-stack-1x" aria-hidden="true" style="color:white"></span>
							</span></a>
							</td>
							<!--<td align="center">
							<a class="btn btn-warning" href="isi_edit_BTKL/<?php echo $data['no_BTKL']; ?>" onclick="return confirm('Yakin mau dihapus?')" class="btn btn-daner">Hapus</a>
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