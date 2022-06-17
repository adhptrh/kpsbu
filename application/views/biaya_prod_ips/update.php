<html>
<head></head>

<body>


<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Laporan Biaya Produksi IPS</b></h3>
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
				<label>Tanggal Transaksi</label>
				<input type="text" class="form-control"  value="<?php echo $tgl ; ?>"readonly >
				</div>
			</div>

			<div class="col-xs-3">
				<div class="form-group">
				<label>Produk</label>
				<input readonly type="text" class="form-control"  value="Susu Sapi setelah diolah"  >
			</div>
		</div>

			<div class="col-xs-3">
				<div class="form-group">
				<label>Jumlah Produksi</label>
				<input readonly type="text" class="form-control"  value="<?php echo $jmlprod; ?> <?php echo $satuan?>"  >
			</div>
		</div>
			
			</div>
	</div>

	<?php //end of tabel ?>
	<?php // tabel biaya produksi atau harga pokok produksinya ?>
	<div class="row" >

	<div class="col-md-12" >
		<hr>
		<h5><b>Biaya Produksi</b></h5	>
		<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>Keterangan</th>
				<th>Biaya</th>
				<th>Per buah</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th colspan="3">Biaya Bahan Baku</th>
			</tr>
			<?php
			$no=1;
			$total = 0;
				foreach($bom as $data){
					
					echo "
							<tr>
							<td>".$data['nama_bb']."</td>
							<td>".format_rp(round(($data['jumlahbb']*$data['jumlah'])*$data['harga']))."</td>
							<td>".format_rp(round($data['harga']))."</td>"; ?>
							

						</tr>
						
					<?php
					$subtotal = $data['harga'] * $data['jumlah'];
					$total= round(($data['jumlahbb']*$data['jumlah'])*$data['harga']);
					$no++;
				}
				$id = $no_trans;
				$jumlah = $data['jumlah'];
			?>
			
			<tr>
				<th colspan="3">Biaya Tenaga Kerja</th>
			</tr>
			<tr>
				<td>Biaya Tenaga Kerja</td>
				<td><?php echo format_rp(round($btk))?> </td>
				<td><?php echo format_rp(round($btk / $jumlah))?></td>
				<?php $bbtk = round($btk); ?>
			</tr>
			<tr>
				<th>Biaya Overhead Pabrik</th>
				<td>0</td>
				<td>0</td>
			</tr>
			<!-- <tr>
				<td colspan="3">Biaya Operasional Pabrik></td>
			</tr> -->
			<!-- <tr> -->

					<?php

			// $no=1;
			// $bbop = 0;
			// 	foreach($bop as $data){

			// 		echo "
			// 		<tr>
			// 				<td>".$data['nama_jbop']."</td>
							

			// 				<td>".format_rp(ROUND($data['harga'] / $hari))."</td>
							
			// 				<td>".format_rp(ROUND(($data['harga']/ $hari)/$jumlah))."</td>
			// 				<tr>"; 
			// 				$bbop = round($bbop + ($data['harga'] / $hari)); 
							?>
					<?php
					// $no++;
				// }
			?>
			<!-- </tr> -->
			<?php 
			$biaya_produksi = round($bbtk + $total);
			?>
			<tr>
				<th>Biaya Produksi</th>
				<th><?php echo format_rp($biaya_produksi) ?></th>
				<th><?php echo format_rp(round($biaya_produksi / $jmlprod)) ?> </th> 
			</tr>

			</tbody>

		</table>
		
	</div>
	</div>

	<div class="row">
		<div class="col-md-11">
	<a href = "<?php echo site_url()."/c_keuangan/lap_bp_ips"?>" class="btn btn-default" role="button">Kembali</a>
</div>


	</div>
	</div>
</div>




</body>
</html>