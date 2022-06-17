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
		
	
			<div class="col-xs-2">
				<div class="form-group">
				<label>Tanggal Transaksi</label>
				<input type="text" class="form-control"  value="<?php echo $tgl ; ?>"readonly >
				</div>
			</div>

			<div class="col-xs-2">
				<div class="form-group">
				<label>Produk</label>
				<input readonly type="text" class="form-control"  value="<?php echo $nama_produk; ?>"  >
			</div>
		</div>

			<div class="col-xs-2">
				<div class="form-group">
				<label>Jumlah Produksi</label>
				<input readonly type="text" class="form-control"  value="<?php echo $jumlah; ?>"  >
			</div>
		</div>
			
			</div>
	</div>
		<hr>

<?php 
				$pbdp = 0;
				$pbdp = round($bombbb['nominal'] * $presentase); 
				?>

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
			<tr>
				<td><?php echo $bombbb['nama_coa']?></td>
				<td><?php echo format_rp($pbdp) ?></td>
				<td><?php echo format_rp($pbdp/$jumlah) ?></td>
				<?php $bbbb = round($pbdp) ?>
			</tr>
			<!-- ///////////////////////////////////////////////////////////////////////////////-->
			<tr>
				<th colspan="3">Biaya Tenaga Kerja</th>
			</tr>
			<tr>
				<td>Biaya Tenaga Kerja</td>
				<td><?php echo format_rp(round($btk))?> </td>
				<td><?php echo format_rp(round($btk / $jumlah))?></td>
				<?php $bbtk = round($btk); ?>
			</tr>
			<!-- ///////////////////////////////////////////////////////////////////////////////-->
			<tr>
				<th colspan="3">Biaya Operasional Pabrik</th>
			</tr>
			<tr>
				<td colspan="3">Biaya Operasional Pabrik></td>
			</tr>
			<tr>

					<?php

			$no=1;
			$bbop = 0;
				foreach($bop as $data){

					echo "
					<tr>
							<td>".$data['nama_jbop']."</td>
							

							<td>".format_rp(ROUND(($data['harga'] / $hari)*$presentase))."</td>
							
							<td>".format_rp(ROUND((($data['harga']/ $hari)*$presentase)/$jumlah))."</td>
							<tr>"; 
							$bbop = round($bbop + (($data['harga'] / $hari)*$presentase)); ?>
					<?php
					$no++;
				}
			?>
			</tr>
			<!-- ////////////////////////////////////////////////////////////////////////////////////////  -->
			<tr>
				<td colspan="3">Biaya Bahan Penolong</td>
			</tr>
			
					<?php
			$no=1;
			$bbp = 0;
				foreach($bp as $data){
					
					
					echo "
					<tr>
							<td>".$data['nama_bp']."</td>
							

							<td>".format_rp($data['biaya'])."</td>
							
							<td>".format_rp($data['biaya'] / $jumlah)."</td>
							<tr>"; 
							$bbp = round($bbp + $data['biaya']) ?>
					<?php
					$no++;
				}
			?>
			<!-- ///////////////////////////////////////////////////////////////////////////////-->
			<?php 
			//total biaya produksi
			$biaya_produksi = round(($bbop) + ($bbtk) + ($bbp) + ($bbbb));
			$biaya_produksi_satuan = round($biaya_produksi / $jumlah); ?>
			<tr>
				<th>Biaya Produksi</th>
				<th><?php echo format_rp(round($biaya_produksi))?> </th>
				<th><?php echo format_rp(round($biaya_produksi_satuan)) ?> </th>

			</tr>

			</tbody>

		</table>
		
	</div>
	</div>


<div class="row">
		<div class="col-md-11">
	<a href = "<?php echo site_url()."/c_transaksi/isi_edit_produksi_ke21/$no_trans"?>" class="btn btn-default" role="button">Kembali</a>
</div>
<div class="col-md-1">
  	 	<div style="align-items: : : right;">
	<!-- <a href = "<?php echo site_url()."/c_transaksi/selesai_produksi_ke2/$id/$total/$jumlah/$no_prod"?>" class="btn btn-dark" role="button">Produksi</a> -->
		<a class="btn btn-dark" role="button" <?php if($cek == '0'){?> href = "<?php echo site_url()."/c_transaksi/selesai_produksi_ke2/$bbbb/$bbtk/$bbop/$bbp/$no_trans/$no_tp/$no_prod/$jumlah "?>" <?php }else{?> hidden <?php } ?>>Produksi</a>
</div>
</div>

	</div>


</div>
</div>
</div>




</body>
</html>