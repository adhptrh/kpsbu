<html>
<head></head>

<body>


<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Detail Pembelian Bahan Baku</b></h3>
  </div>
  	 <div class="x_content">
<div>
	
		<div class="row">
	<div class="form-group">
			<div class="col-xs-6">
				<div class="form-group">
				<label>ID Transaksi</label>
				<input readonly type="text" class="form-control"  value="<?php echo $no_trans ; ?>"  >
			</div>
			
		</div>
		
	
			<div class="col-xs-6">
				<div class="form-group">
				<label>Tanggal Transaksi</label>
				<input type="text" class="form-control"  value="<?php echo $tgl ; ?>"readonly >
				</div>
			</div>
			
			</div>
	</div>
		
		<hr>
<br>
		<div class="row" >

	<div class="col-md-12" >
		<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>Nama Bahan</th>
				<th>ID - Nama Peternak</th>
				<th>Jumlah</th>
				<th>Harga</th>
				<th>Subtotal</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
			$total = 0;
				foreach($detail as $data){
					
					echo "
							<tr>
							<td>".$data['nama_bb']."</td>
							<td>".$data['no_peternak']." - ".$data['nama_peternak']."</td>
							<td align='right'>".number($data['jumlah'])." ".$data['satuan']."</td>
							<td align='right'>".format_rp($data['harga'])."</td>
						
							
							<td align='right'>".format_rp($data['harga']*$data['jumlah'])."</td>"; ?>
							

						</tr>
						
					<?php
					$subtotal = $data['harga'] * $data['jumlah'];
					$total=$total+$subtotal;
					$no++;
				}
			?>
			<tr>
				<td colspan="4" align="center">Total</td>
				<td align="right"><?php echo format_rp($total) ?></td>
			</tr>
			</tbody>

		</table>
		
	</div>

	<!-- 
		<a href="lihat_BOM" class="btn btn-default">Back</a>
		<input type="button" class="btn btn-default" value="Back" onClick=history.go(-1);> -->
	</div>
	<a href = "<?php echo site_url()."/c_transaksi/lihat_pemb"?>" class="btn btn-default" role="button">Kembali</a>

	</div>
	</div>
</div>




</body>
</html>