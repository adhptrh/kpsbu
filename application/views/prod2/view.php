<html>
	<!-- <head><center><h3><b>Master Data Produksi Olahan</b></h3></center></head>
	<hr> -->
	<body>
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Daftar Produksi Olahan</b></h3>
  </div>
  	 <div class="x_content">
  	 	<?php if (isset($error)){ echo "<div class='alert alert-danger'><li>".$error."</li></div>"; }?>
  	 	<?php if (isset($clear)){ echo "<div class='alert alert-success'><li>".$clear."</li></div>"; }?>
  	 		<?php if($cek1 == FALSE OR $cek2 == FALSE OR $cek3 == TRUE){?>
  	 			<a href = "#" class="btn btn-info" role="button" disabled="disabled"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>
  	 		<?php }else{ ?>
  	 		<a href = "<?php echo site_url()."/c_transaksi/form_produksi_ke2"?>" class="btn btn-info" role="button"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>
  	 	<?php } ?>
  	 	 <table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
		 	<thead>
			<tr class="headings">
				<th style="width: 2px;">No</th>
				<th>ID Transaksi</th>
				<th>Tanggal Transaksi</th>
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
							" ?>
							<td>
							<a href="isi_edit_produksi_ke21/<?php echo $data['no_trans']; ?>">
							
							<span class="fa-stack">
							  <i class="fa fa-square fa-stack-2x" style="color:#2A3F54;"></i>
							 <span class="glyphicon glyphicon-pencil fa-stack-1x" aria-hidden="true" style="color:white"></span>
							</span> </a>
							</td>

						</tr>
						
					<?php
					$no++;
				}
			?>
			</tbody>
		</table>

	
	
	</body>
</html>