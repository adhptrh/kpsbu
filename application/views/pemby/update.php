<html>
<head></head>

<body>

<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Detail Pembayaran Beban Tetap</b></h3>
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

	<div class="col-md-6" >
		<label>Beban Penjualan IPS</label>
		<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>Nama Beban</th>
				<th>Subtotal</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
			$total = 0;
				foreach($detailips as $data){
					
					echo "
							<tr>
							<td>".$data['nama_coa']."</td>
							<td align='right'>".format_rp($data['subtotal'])."</td>"; ?>
							

						</tr>
						
					<?php
					$total=$total+$data['subtotal'];
					$no++;
				}
			?>
			<tr>
				<td align="center">Total</td>
				<td align="right"><?php echo format_rp($total) ?></td>
			</tr>
			</tbody>

		</table>
		
	</div>
	<div class="col-md-6" >
		<label>Beban Penjualan Toko</label>
		<table  class="table table-striped table-bordered table-hover jambo_table" width="15000px">
		 	<thead>
			<tr class="headings">
				<th>Nama Bahan</th>
				<th>Subtotal</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
			$total1 = 0;
				foreach($detailtoko as $data){
					
					echo "
							<tr>
							<td>".$data['nama_coa']."</td>
							<td align='right'>".format_rp($data['subtotal'])."</td>"; ?>
							

						</tr>
						
					<?php
					$total1=$total1+$data['subtotal'];
					$no++;
				}
			?>
			<tr>
				<td align="center">Total</td>
				<td align="right"><?php echo format_rp($total1) ?></td>
			</tr>
			</tbody>

		</table>
		
	</div>
	</div>

	<!-- 
		<a href="lihat_BOM" class="btn btn-default">Back</a>
		<input type="button" class="btn btn-default" value="Back" onClick=history.go(-1);> -->
	</div>
	<a href = "<?php echo site_url()."/c_transaksi/lihat_pemby"?>" class="btn btn-default" role="button">Kembali</a>

	</div>
	</div>
</div>




</body>
</html>