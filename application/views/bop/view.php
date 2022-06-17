<html>
	<!-- <head><center><h3><b>Master Data BOP</b></h3></center></head>
	<hr> -->
	<body>
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Daftar BOP IPS</b></h3>
  </div>
  	 <div class="x_content">
  	 		<?php if($cek == TRUE){?>
  	 			<a href = "#" class="btn btn-info" role="button" disabled="disabled"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>
  	 		<?php }else{ ?>
  	 		<a href = "<?php echo site_url()."/c_masterdata/form_bop"?>" class="btn btn-info" role="button"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>
  	 	<?php } ?>
  	 	 <table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
		 	<thead>
			<tr class="headings">
				<th style="width: 2px;">No</th>
				<th>ID BOP IPS</th>
				<th>Tanggal</th>
				<th>Aksi</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
				foreach($result as $data){
					 $bulan = array(
      '0' => 'December',
      '01' => 'Januari',
      '02' => 'Februari',
      '03' => 'Maret',
      '04' => 'April',
      '05' => 'Mei',
      '06' => 'Juni',
      '07' => 'Juli',
      '08' => 'Agustus',
      '09' => 'September',
      '10' => 'Oktober',
      '11' => 'November',
      '12' => 'Desember'
    );
					echo "

						<tr><td>$no</td>
							<td>".$data['no_bop']."</td>
							<td>".$data['tgl_bop']."</td>
							" ?>
							<td>
							<a href="isi_edit_bop/<?php echo $data['no_bop']; ?>">
								
							<span class="fa-stack">
							  <i class="fa fa-square fa-stack-2x" style="color:#2A3F54;"></i>
							 <span class="glyphicon glyphicon-pencil fa-stack-1x" aria-hidden="true" style="color:white"></span>
							</span></a>
							
							</td>
							<!--<td align="center">
							<a class="btn btn-warning" href="isi_edit_bop/<?php echo $data['no_bop']; ?>" onclick="return confirm('Yakin mau dihapus?')" class="btn btn-daner">Hapus</a>
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