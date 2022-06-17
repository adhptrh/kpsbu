<html>
	<head>
	</head>
	<body>
		<!-- <center><h3>Pembelian</h3></center>
	 -->
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Daftar Kartu Persediaan</b></h3>
  </div>
  	 <div class="x_content">
  	 	<div class="row">
  	 		<!-- <div class="col-md-3">
  	 <a href = "<?php echo site_url()."/c_transaksi/form_pemb1"?>" class="btn btn-info" role="button"><span class="glyphicon glyphicon-plus"></span> Pembelian</a>&nbsp <a href = "<?php echo site_url()."/c_transaksi/form_pemakaian"?>" class="btn btn-info" role="button"><span class="glyphicon glyphicon-plus"></span> Pemakaian</a>
  	</div>   -->            
  	
  	 	<form  method="post" action="<?php echo site_url().'/c_keuangan/lap_ks_prod1' ?> " class="form-inline">
  	 		

			<div class="col-sm-8">
			
			  <label>Tanggal Awal :</label>
		<input type = "date" name="tgl_awal" class = "form-control" required="">
		<label>Tanggal Akhir :</label>
		<input type = "date" name="tgl_akhir" class = "form-control" required="">&nbsp&nbsp
	
		
	<input type="submit" value="Cari" class="btn btn-info">
</div>
	</form>
</div>
<!-- <div class="row" style="margin-top: 10px; margin-left: 180px">
	<div class="col-md-9">
	</div>
	<div class="col-md-3">
		<?php if(isset($awal, $akhir,$no)):?>
	<a href="<?php echo site_url()."/c_transaksi/view_pemb_pdf/$awal/$akhir/$no"?>"  target="_blank" rel="nofollow" class="btn btn-success" role="button">Print</a>
	<a href="<?php echo site_url()."/c_transaksi/view_pemb_excel/$awal/$akhir/$no"?>" target="_blank" rel="nofollow"  class="btn btn-success" role="button">Excel</a>
<?php endif ?>
	
	<?php if(isset($awal, $akhir,$no)):?>
	<a href="<?php echo site_url()."/c_transaksi/view_trans"?>" class="btn btn-dark" role="button">Kembali</a>
	<?php endif ?> 
	</div>
</div> -->
<hr>
<p>
  	<center><b>
  	 	<div style="font-size: 25px">
  	 	KPSBU Lembang</div>
  	 <div style="font-size: 20px">Kartu Persediaan <?php echo $produk1['nama_produk']?></div>
  
  	  <?php if(isset($awal, $akhir)){?>
  	 <div style="font-size: 15px">
  	 	<?php echo $awal?> s/d <?php echo $akhir; }?>
  	 </div>
</b>
</center>
</p>
<hr>

		
		 <table  class="table table-striped table-bordered table-hover jambo_table">
		 	<thead>
			<tr class="headings">
				<th rowspan="2"> <center>No</center></th>
				<th rowspan="2">Tanggal</th>
				<th colspan="3">Produksi</th>
				<th colspan="3">Penjualan</th>
				<th colspan="3">Saldo</th>
				
						</tr>
			
			<tr>
				<th>Unit</th>
				<th>Harga</th>
				<th>Jumlah</th>
				<th>Unit</th>
				<th>Harga</th>
				<th>Jumlah</th>
				<th>Unit</th>
				<th>Harga</th>
				<th>Jumlah</th>
			</tr>
		</thead>
		<tbody>
			<tr>

			<?php 
			$no = 0;
			
			foreach($result as $data){
				
				$no++;
				
				


				echo "
			<td>$no</td>
			<td>".$data['atgl_trans']."</td>
			<td align='right'>".number($data['unit1'])."</td>
			<td align='right'>".format_rp($data['harga1'])."</td>
			<td align='right'>".format_rp($data['total1'])."</td>	
			<td align='right'>".number($data['unit2'])."</td>
			<td align='right'>".format_rp($data['harga2'])."</td>
			<td align='right'>".format_rp($data['total2'])."</td>
			<td align='right'>".number($data['unit3'])."</td>
			<td align='right'>".format_rp($data['harga3'])."</td>
			<td align='right'>".format_rp($data['total3'])."</td>

			";

	echo "
	</tr>
		";	
		
		}
		?>
		<tr>
			<th colspan="2">Saldo Produksi</th>
			<td align='right'><b><?php echo number($unit1) ;?></b></td>
			<td align="right"></td>
			<td align="right"><b><?php echo format_rp($total1) ;?></b></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<th colspan="2">Saldo Penjualan</th>
			<td></td>
			<td></td>
			<td></td>
			<td align='right'><b><?php echo number($unit2) ;?></b></td>
			<td align="right"><b></b></td>
			<td align="right"><b><?php echo format_rp($total2) ;?></b></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<th colspan="2">Saldo Akhir</th>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td align='right'><b><?php echo number($unit3) ;?></b></td>
			<td align="right"><b></b></td>
			<td align="right"><b><?php echo format_rp($total3) ;?></b></td>
		</tr>	
		
		</tbody>
	</table>
		
		
	</div>
</div>

	</body>
</html>

