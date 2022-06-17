<html>
<head></head>

<body>


<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Detail Cek Kualitas</b></h3>
  </div>
  	 <div class="x_content">
<div>
	
		<div class="row">
	<div class="form-group">
			<div class="col-xs-3">
				<div class="form-group">
				<label>ID Pengecekan</label>
				<input readonly type="text" class="form-control"  value="<?php echo $no_trans ; ?>"  >
			</div>
		</div>
		
	
			<div class="col-xs-3">
				<div class="form-group">
				<label>Tanggal Pengecekan</label>
				<input type="text" class="form-control"  value="<?php echo $tgl ; ?>"readonly >
				</div>
			</div>
			

			<div class="col-xs-3">
				<div class="form-group">
				<label>Bahan Baku</label>
				<input readonly type="text" class="form-control"  value="Susu Sapi"  >
			</div>
		</div>

		<div class="col-xs-3">
				<div class="form-group">
				<label>Satuan</label>
				<input readonly type="text" class="form-control"  value="liter"  >
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
				<th>ID Pembelian Bahan Baku</th>
				<th>Lulus</th>
				<th>Gagal</th>
				<th>Total</th>
			<!-- 	<th>Supplier</th>
				<th>Aksi</th> -->
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
			$total = 0;
			$lulus = 0;
			$gagal =0;
			$total = 0;

				foreach($detail as $data){
					
					echo "
							<tr>
							<td>".$data['no_trans_pmb']."</td>
							<td align='right'>".number($data['lulus'])."</td>
							<td align='right'>".number($data['gagal'])."</td>
							<td align='right'>".number($data['total'])."</td>"; ?>
							

						</tr>
						
					<?php
					$lulus = $lulus + $data['lulus'];
					$gagal = $gagal + $data['gagal'];
					$total = $total + $data['total'];
					$no++;
				}
			?>
			<tr>
				<td align='center'>Total</td>
				<td align='right'><?php echo number($lulus) ?></td>
				<td align='right'><?php echo number($gagal) ?></td>
				<td align='right'><?php echo number($total) ?></td>
				
			</tr>
			</tbody>

		</table>
		
	</div>
	</div>
	<a href = "<?php echo site_url()."/c_transaksi/lihat_ck"?>" class="btn btn-default" role="button">Kembali</a>

	</div>
	</div>
</div>



</body>
</html>

</body>
</html>