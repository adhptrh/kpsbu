<html>
	<!-- <head><center><h3><b>Master Data Bahan Baku</b></h3></center></head>
	<hr> -->
	<body>
		<?php 

	$spasi = '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp';
	 $namabulan = array(
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
      '12' => 'Desember',
      '1' => 'Januari',
      '2' => 'Februari',
      '3' => 'Maret',
      '4' => 'April',
      '5' => 'Mei',
      '6' => 'Juni',
      '7' => 'Juli',
      '8' => 'Agustus',
      '9' => 'September',
    );
    ?>
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Daftar Harga Pokok Penjualan IPS</b></h3>
  </div>
  	 <div class="x_content">
  	 		<form class = 'form-inline' method = "POST" class = "form-inline" action = "<?php echo site_url().'/c_keuangan/hpp_ips';?>">
		
				<label>Pilih Bulan :</label> 
				<select name="bulan" class="form-control">
					<option value="*" disabled selected>Pilih Bulan</option>
					<option value="01">Januari</option>
					<option value="02">Februari</option>
					<option value="03">Maret</option>
					<option value="04">April</option>
					<option value="05">Mei</option>
					<option value="6">Juni</option>
					<option value="07">Juli</option>
					<option value="08" >Agustus</option>
					<option value="09" >September</option>
					<option value="10" >Oktober</option>
					<option value="11" >November</option>
					<option value="12" >Desember</option>

					</select>
		
		&nbsp&nbsp
			<label>Pilih Tahun :</label>
			<select name="tahun" class="form-control">
				<option value="#" disabled selected>Pilih Tahun</option>
				<?php
				$now =date('Y');
				for ($a=2015;$a<=$now;$a++)

					{

     echo "<option value='".$a."'>".$a."</option>";

					}
				?>
				</select>
			&nbsp&nbsp
		
		  <button class = "btn btn-info btn-md" type = "submit">filter</button>
		</form>


<p>
  	 <center><b>
  	 	<div style="font-size: 25px">
  	 	KPSBU Lembang
  	 </div>

  	 <div style="font-size: 20px">
  	 Harga Pokok Penjualan Susu Sapi
  	
	</div>
  	 
  	
  	 
  	 	<center>
  	 	<div style="font-size: 20px">
  	 		<?php echo $namabulan[$bulan]?> <?php echo $tahun ; ?>

  	 </div>
  	</center>
</b>


  	 </center>
</p>

  	 	 <table class="table table-striped table-bordered table-hover jambo_table">
		 	<thead>
			<tr class="headings">
				<th>Keterangan</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Harga Pokok Penjualan</td>
				<td align ='right'></td>
				<td align ='right'></td>
			</tr>

			<tr>
				<td>Persediaan Produk Jadi (Awal)</td>
				<td align ='right'><?php echo format_rp($awal_hpp)?></td>
				<td align ='right'></td>
			</tr>

			<tr>
				<td>Harga Pokok Produksi Produk Jadi</td>
				<td align ='right'><?php echo format_rp($produk_jadi)?></td>
				<td align ='right'></td>
			</tr>


			<tr>
				<td>Produk Siap Dijual</td>
				<td align ='right'><?php echo format_rp($produk_siap_dijual)?></td>
				<td align ='right'></td>
			</tr>


			<tr>
				<td>Persediaan Produk Jadi (Akhir)</td>
				<td align ='right'><?php echo format_rp($akhir_hpp)?></td>
				<td align ='right'></td>
			</tr>

			<tr>
				<td>Jumlah Harga Pokok Penjualan</td>
				<td align ='right'></td>
				<td align ='right'><?php echo format_rp($hppips)?></td>
			</tr>
			</tbody>
		</table>

	
	
	</body>
</html>