<html>
<head></head>

<body>


<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b><?php if($cek != '0'){?>Detail <?php } ?>Transaksi Produksi IPS</b></h3>
  </div>
  	 <div class="x_content">
<div>
	
		<div class="row">
		<div class="form-group">
			<div class="col-xs-3">
				<div class="form-group">
				<label>ID Produksi Pertama</label>
				<input readonly type="text" class="form-control"  value="<?php echo $no_trans ; ?>"  >
			</div>
		</div>
		<div class="col-xs-3">
				<div class="form-group">
				<label>ID Cek Kualitas</label>
				<input readonly type="text" class="form-control"  value="<?php echo $no_ck ; ?>"  >
			</div>
		</div>

		
	
			<div class="col-xs-2">
				<div class="form-group">
				<label>Tanggal Transaksi</label>
				<input type="text" class="form-control"  value="<?php echo $tgl ; ?>"readonly >
				</div>
			</div>

			<div class="col-xs-2">
				<div class="form-group">
				<label>Produk</label>
				<input readonly type="text" class="form-control"  value="Susu Sapi"  >
			</div>
		</div>

			<div class="col-xs-2">
				<div class="form-group">
				<label>Jumlah Produksi</label>
				<input readonly type="text" class="form-control"  value="<?php echo number($jmlprod); ?> liter"  >
			</div>
		</div>
			
			</div>
	</div>
		

		<div class="row" >

	<div class="col-md-12" >
		<hr>
		<h5><b>Bill Of Material</b></h5	>
		<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>Bahan Baku</th>
				<th>Kebutuhan</th>
				<th>Jumlah</th>
				<th>Satuan</th>
				<th>Subtotal</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
			$total = 0;
				foreach($bom as $data){
					$subtotal = ($data['lulus'] / $data['total']) * $data['subtotal'];
					echo "
							<tr>
							<td>Susu Sapi</td>
							<td align='right'>1</td>
							<td align='right'>".number($data['lulus'])."</td>
							<td>liter</td>
							
							<td align='right'>".format_rp($subtotal)."</td>"; ?>
							

						</tr>
						
					<?php
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
	</div>

	<?php //end of tabel ?>
	<?php // tabel Harga Pokok Produksi atau harga pokok produksinya ?>
	<div class="row" >

	<div class="col-md-12" >
		<hr>
		<h5><b>Biaya Produksi IPS</b></h5	>
		<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>Keterangan</th>
				<th>Biaya</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th colspan="2">Biaya Bahan Baku</th>
			</tr>
			<?php
			$no=1;
			$harga = 0;
			$harga = $total / $jmlprod;
				foreach($bom as $data){
					
					echo "
							<tr>
							<td>Susu Sapi</td>
							<td align='right'>".format_rp($total)."</td>"; ?>
							

						</tr>
						
					<?php
				
					$no++;
				}
				$id = $no_trans;
				$jumlah = $jmlprod;
				$no_prod = 'PR_001';
			?>
			
			<tr>
				<th colspan="2">Biaya Tenaga Kerja</th>
			</tr>
			<tr>
				<td>Biaya Tenaga Kerja - @<?php echo format_rp($btk) ?></td>
				<td align='right'><?php echo format_rp(($btk) * $jmlprod)?> </td>
				<?php $bbtk = $btk * $jmlprod; ?>
			</tr>
			<tr>
				<th>Biaya Overhead Pabrik Variabel</th>
				<td align="right"></td>
			</tr>
			
					<?php
			$no=1;
			$bbop = 0;
				foreach($bopv as $data){

					echo "
					<tr>
							<td>".$data['nama_jbop']." - @".format_rp($data['harga'])."</td>
							

							<td align='right'>".format_rp(($data['harga']) * $jmlprod)."</td>
							<tr>"; 
							$bbop = ($bbop + ($data['harga'] * $jmlprod)); 
					?>
			</tr>
					<?php
					$no++;
				} 
				?>
			<?php 
			$biaya_produksi = ($bbtk + $total + $bbop);
			
			?>
			<tr>
				<th>Biaya Produksi</th>
				<td align='right'><b><?php echo format_rp($biaya_produksi) ?></b></td>
			</tr>
			<tr>
				<th>Biaya Produksi / Liter</th>
				<td align="right"><b><?php echo format_rp(round($biaya_produksi / $jmlprod)) ?></b> </td> 
			</tr>

			</tbody>

		</table>
		
	</div>
	</div>

	<div class="row">
		<div class="col-md-11">
	<a href = "<?php echo site_url()."/c_transaksi/lihat_produksi_ke1"?>" class="btn btn-default" role="button">Kembali</a>
</div>
<div class="col-md-1">
  	 	<div style="align-items: : : right;">
	<!-- <a href = "<?php echo site_url()."/c_transaksi/selesai_produksi_ke1/$id/$total/$jumlah/$no_prod"?>" class="btn btn-dark" role="button">Produksi</a> -->
		<a class="btn btn-dark" role="button" <?php if($cek == '0'){?> href = "<?php echo site_url()."/c_transaksi/selesai_produksi_ke1/$id/$total/$jmlprod/$no_prod/$bbtk/$bbop"?>" <?php }else{?> hidden <?php } ?>>Produksi</a>
</div>
</div>

	</div>
	</div>
</div>




</body>
</html>