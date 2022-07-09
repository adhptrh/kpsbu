<html>
<head></head>

<body>


<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Detail Produksi Olahan</b></h3>
  </div>
  	 <div class="x_content">
<div>
	

		<div class="row">
		<div class="form-group">
			<div class="col-xs-3">
				<div class="form-group">
				<label>ID Produksi Olahan</label>
				<input readonly type="text" class="form-control"  value="<?php echo $no_trans ; ?>"  >
			</div>
		</div>

			<div class="col-xs-3">
				<div class="form-group">
				<label>ID Target Produksi</label>
				<input readonly type="text" class="form-control"  value="<?php echo $no_tp ; ?>"  >
			</div>
		</div>
		
	
			<div class="col-xs-3">
				<div class="form-group">
				<label>Tanggal Transaksi</label>
				<input type="text" class="form-control"  value="<?php echo $tgl ; ?>"readonly >
				</div>
			</div>

			<div class="col-xs-3">
				<div class="form-group">
				<label>Jumlah Produk</label>
				<input readonly type="text" class="form-control"  value="<?php echo number($jml_produk)?>"  >
			</div>
		</div>
			
			</div>
	</div>

<hr>
		<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>No</th>
				<th>Produk</th>
				<th>Jumlah Produksi</th>
				<th>Aksi</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
			$total = 0;
				foreach($detail as $data){
					
					echo "
							<tr>
							<td>".$no."</td>
							<td>".$data['nama_produk']."</td>
							<td align='right'>".number($data['jumlah'])."</td>"; ?>

							<td>
							<a href = "<?php echo site_url()."/c_transaksi/isi_edit_produksi_ke2/".$data['no_trans']."/".$data['no_tp']."/".$data['no_produk'] ;?>" >
							
							
							<span class="fa-stack">
							  <i class="fa fa-square fa-stack-2x" style="color:#2A3F54;"></i>
							 <span class="glyphicon glyphicon-pencil fa-stack-1x" aria-hidden="true" style="color:white"></span>
							</span> </a>
							
							<span class="fa-stack">
							  <i class="fa fa-square fa-stack-2x" <?php if($data['status'] == '1'){?>style="color:#28a745;" <?php }else{ ?> style="color:#dc3545" <?php }?>></i>
							 <span class="glyphicon glyphicon-ok fa-stack-1x" aria-hidden="true" style="color:white"></span>
							</span>
							</td>

						</tr>
						
					<?php
			
					$no++;
				}
			?>
		
			</tbody>

		</table>

	<a href = "<?php echo site_url()."/c_transaksi/lihat_produksi_ke2"?>" class="btn btn-default" role="button">Kembali</a>


		
	</div>
</div>
</div>




</body>
</html>