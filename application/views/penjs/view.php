<html>
	<!-- <head><center><h3><b>Master Data Penjualan IPS</b></h3></center></head>
	<hr> -->
	<body>
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Daftar Penjualan IPS</b></h3>
  </div>
  	 <div class="x_content">
  	 		<a href = "<?php echo site_url()."/c_transaksi/form_penjs"?>" class="btn btn-info" role="button"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>
  	 	 <table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
		 	<thead>
			<tr class="headings">
				<th style="width: 2px;">No</th>
				<th>ID Penjualan</th>
				<th>Tanggal Penjualan</th>
				<th>Jumlah</th>
				<th>Total</th>
				<th>Aksi</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
				foreach($result as $data){
					echo "

						<tr><td>$no</td>
							<td>".$data['no_trans']."</td>
							<td>".$data['tgl_trans']."</td>
							<td align='right'>".number($data['jumlah'])." liter</td>
							<td align='right'>".format_rp($data['total'])."</td>
							" ?>
							<td>
							<a href="isi_edit_penjs/<?php echo $data['no_trans'];?>/<?php echo $data['no_trans_pembg']?>" >
										
							<span class="fa-stack">
							  <i class="fa fa-square fa-stack-2x" style="color:#2A3F54;"></i>
							 <span class="glyphicon glyphicon-pencil fa-stack-1x" aria-hidden="true" style="color:white"></span>
							</span> </a>
							</td>
							<!--<td align="center">
							<a class="btn btn-warning" href="isi_edit_penjs/<?php echo $data['no_trans']; ?>" onclick="return confirm('Yakin mau dihapus?')" class="btn btn-daner">Hapus</a>
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