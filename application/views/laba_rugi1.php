<html>
	<body style="width: 2200px">
	<!-- 	
	<center><h3><b>Jurnal</b></h3></center>
	<hr> -->
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

	 foreach ($tokobeban as $data) {
	 	# code...
	 	if($data['no_coa'] == 5221){

	 	$tbbn5221 = $data['subtotal'];
	 	}
	 	if($data['no_coa'] == 5222){

	 	$tbbn5222 = $data['subtotal'];
	 	}
	 	if($data['no_coa'] == 5223){

	 	$tbbn5224 = $data['subtotal'];
	 	}
	 	
	 }
	 	foreach ($tokobebanv as $data ) {
	 		# code...
	 	if($data['no_coa'] == 5211){

	 	$tbbn5211 = $data['subtotal'];
	 	}
	 	if($data['no_coa'] == 5212){

	 	$tbbn5212 = $data['subtotal'];
	 	}
	 }
	 $tbbntotalfix = $tbbn5221 + $tbbn5222  + $tbbn5224;
	 $tbbntotalvar = $tbbn5211 + $tbbn5212;
	 $tbbntotalakhir = $tbbntotalfix + $tbbntotalvar;
	 $laba_bersih_toko =  $laba_kotor_toko - $tbbntotalakhir; 
    ?>

    <!-- buat ips ini bawah -->
    <?php 
     foreach ($ipsbeban as $data) {
	 	# code...
	 	if($data['no_coa'] == 5221){

	 	$ibbn5221 = $data['subtotal'];
	 	}
	 	if($data['no_coa'] == 5222){

	 	$ibbn5222 = $data['subtotal'];
	 	}
	 	if($data['no_coa'] == 5223){

	 	$ibbn5224 = $data['subtotal'];
	 	}
	 	
	 }
	 foreach ($ipsbebanv as $data) {
	 	# code...
	 	if($data['no_coa'] == 5213){

	 	$ibbn5213 = $data['subtotal'];
	 	}
	 }
	 $ibbntotalfix = $ibbn5221 + $ibbn5222  + $ibbn5224;
	 $ibbntotalvar = $ibbn5213;
	 $ibbntotalakhir = $ibbntotalfix + $ibbntotalvar;
	 $laba_bersih_ips =  $laba_kotor_ips - $ibbntotalakhir; 
    ?>

    <!-- BUAT TOTAL LABA RUGI DI KANAN LASTTTT-->
    <?php 
    $penj = $penj_toko + $penjs;
    $hpp = $hppips + $hpp_toko;
    $laba_kotor = $penj - $hpp;
    $beban5221 = $tbbn5221 + $ibbn5221;
    $beban5222 = $tbbn5222 + $ibbn5222;
    
    $beban5224 = $tbbn5224 + $ibbn5224;
    $beban5211 = $tbbn5211;
    $beban5212 = $tbbn5212;
   
    $total_beban_tetap = $beban5221 + $beban5222  + $beban5224 ;
    $total_beban_var = $beban5211 + $beban5212 +  $ibbntotalvar ;
    $total_beban = $total_beban_tetap + $total_beban_var;
    $laba_bersih = $laba_kotor - $total_beban;


    ?>
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Daftar Laba Rugi</b></h3>
  </div>
  	 <div class="x_content">
		<form class = 'form-inline' method = "POST" class = "form-inline" action = "<?php echo site_url().'/c_keuangan/lr1';?>">
		
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
  	 Laba Rugi
  	
	</div>
  	 
  	
  	 
  	 	<center>
  	 	<div style="font-size: 20px">
  	 		<?php echo $namabulan[$bulan]?> <?php echo $tahun ; ?>

  	 </div>
  	</center>
</b>


  	 </center>
</p>
	 <table  class="table table-striped table-bordered table-hover jambo_table">
		 	<thead>
			<tr class="headings">
			<th>Keterangan</th>
			<th >Susu Sapi ke IPS</th>
			<?php 
			foreach($list_produk as $data){
				echo "<th>".$data['nama_produk']."</th>";
			}
			?>
			<th>Total Toko</th>
			<th>Total Laba Rugi</th>
		</tr>
	</thead>
	<tbody>

	
		<tr>
			<th>Penjualan</th>
			<td align='right'><?php echo format_rp($penjs)?></td>
			<?php 
			foreach($penjt as $data){

				echo "<td align='right'>".format_rp($data['nominal'])."</td>";
			}
			?>
			<td align='right'><?php echo format_rp($penj_toko)?></td>
			<td align='right'><?php echo format_rp($penj)?></td>
		</tr>
	
					
		<tr>
			<th>Harga Pokok Penjualan</th>
			<td align='right'><?php echo format_rp($hppips)?></td>
			<?php 
			foreach($hpplisttoko as $data){

				echo "<td align='right'>".format_rp($data['hpp'])."</td>";
			}
			?>
			<td align='right'><?php echo format_rp($hpp_toko)?></td>
			<td align='right'><?php echo format_rp($hpp)?></td>
		</tr>
		
		
		
		
		<tr>
			<td><b>Laba Kotor</b></td>
			<td align='right'><?php echo format_rp($laba_kotor_ips) ?></td>
			<?php 
			foreach($penjt as $data){

				echo "<td align='right'>".format_rp($data['laba_kotor'])."</td>";
			}
			?>
			<td align='right'><?php echo format_rp($laba_kotor_toko)?></td>
			<td align='right'><?php echo format_rp($laba_kotor)?></td>
		</tr>

		<tr>
			<th>Kontribusi</th>
			<td align='right'>100%</td>
			<?php 
			foreach($penjt as $data){
				if($data['laba_kotor'] == TRUE){

				$hasil_kontribusi = ($data['laba_kotor'] / $laba_kotor_toko) * 100;
				$kontribusi = number_format($hasil_kontribusi,2);
				}else{
				$kontribusi = 0;
				}
				echo "<td align='right'>".$kontribusi."%</td>";
			}
			?>
			<td align='right'>100%</td>
			<td align='right'>100%</td>
		</tr>
		<tr>
			<th>Beban Operasional</th>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
		</tr>
		
		<tr>
			<th>Beban Tetap</th>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
		</tr>

		<tr>
			<td>Beban Listrik, Air dan Telepon</td>
			<td align='right'><?php echo format_rp($ibbn5221)?></td>
			<?php 
			foreach($penjt as $data){
				if($data['laba_kotor'] == TRUE){
				$hasil_kontribusi = ($data['laba_kotor'] / $laba_kotor_toko) * 100;
				$kontribusi = number_format($hasil_kontribusi,2);
				$hasil = ($kontribusi * $tbbn5221) / 100;
			}else{
				$hasil = 0;
			}
				echo "<td align='right'>".format_rp($hasil)."</td>";
			
			}
			?>
			<td align='right'><?php echo format_rp($tbbn5221)?></td>
			<td align='right'><?php echo format_rp($beban5221)?></td>
		</tr>

		<!-- <tr>
			<td>Beban Gaji Karyawan</td>
			<td align='right'><?php echo format_rp($ibbn5223)?></td>
			<?php 
			foreach($penjt as $data){
					if($data['laba_kotor'] == TRUE){
				$hasil_kontribusi = ($data['laba_kotor'] / $laba_kotor_toko) * 100;
				$kontribusi = number_format($hasil_kontribusi,2);
				$hasil = ($kontribusi * $tbbn5223) / 100;
			}else{
				$hasil = 0;
			}
				echo "<td align='right'>".format_rp($hasil)."</td>";
			
			}
			?>
			<td align='right'><?php echo format_rp($tbbn5223)?></td>
			<td align='right'><?php echo format_rp($beban5223)?></td>
		</tr> -->

		<tr>
			<td>Beban Administrasi dan Umum Tetap</td>
			<td align='right'><?php echo format_rp($ibbn5222)?></td>
			<?php 
			foreach($penjt as $data){
					if($data['laba_kotor'] == TRUE){
				$hasil_kontribusi = ($data['laba_kotor'] / $laba_kotor_toko) * 100;
				$kontribusi = number_format($hasil_kontribusi,2);
				$hasil = ($kontribusi * $tbbn5222) / 100;
			}else{
				$hasil = 0;
			}

				echo "<td align='right'>".format_rp($hasil)."</td>";
			}
			?>
			<td align='right'><?php echo format_rp($tbbn5222)?></td>
			<td align='right'><?php echo format_rp($beban5222)?></td>
		</tr>

		<tr>
			<td>Beban Pemasaran Tetap</td>
			<td align='right'><?php echo format_rp($ibbn5224)?></td>
			<?php 
			foreach($penjt as $data){
					if($data['laba_kotor'] == TRUE){
				$hasil_kontribusi = ($data['laba_kotor'] / $laba_kotor_toko) * 100;
				$kontribusi = number_format($hasil_kontribusi,2);
				$hasil = ($kontribusi * $tbbn5224) / 100;
			}else{
				$hasil = 0;
			}

				echo "<td align='right'>".format_rp($hasil)."</td>";
			}
			?>
			<td align='right'><?php echo format_rp($tbbn5224)?></td>
			<td align='right'><?php echo format_rp($beban5224)?></td>
		</tr>

		<tr>
			<td>Total Beban Tetap</td>
			<td align='right'><?php echo format_rp($ibbntotalfix)?></td>
			<?php 
			foreach($penjt as $data){
					if($data['laba_kotor'] == TRUE){
				$hasil_kontribusi = ($data['laba_kotor'] / $laba_kotor_toko) * 100;
				$kontribusi = number_format($hasil_kontribusi,2);
				$hasil = ($kontribusi * $tbbntotalfix) / 100;
			}else{
				$hasil = 0;
			}

				echo "<td align='right'>".format_rp($hasil)."</td>";
			}
			?>
			<td align='right'><?php echo format_rp($tbbntotalfix)?></td>
			<td align='right'><?php echo format_rp($total_beban_tetap)?></td>
		</tr>

		<tr>
			<th>Beban Variabel</th>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
		</tr>
		
		<tr>
			<td>Beban Pemasaran Variabel</td>
			<td align='right'></td>
			<?php 
			foreach($penjt as $data){
					if($data['laba_kotor'] == TRUE){
				$hasil_kontribusi = ($data['laba_kotor'] / $laba_kotor_toko) * 100;
				$kontribusi = number_format($hasil_kontribusi,2);
				$hasil = ($kontribusi * $tbbn5212) / 100;
			}else{
				$hasil = 0;
			}

				echo "<td align='right'>".format_rp($hasil)."</td>";
			}
			?>
			<td align='right'><?php echo format_rp($tbbn5212)?></td>
			<td align='right'><?php echo format_rp($beban5212)?></td>
		</tr>
		
		<tr>
			<td>Beban Administrasi dan Umum Variabel</td>
			<td align='right'></td>
			<?php 
			foreach($penjt as $data){
					if($data['laba_kotor'] == TRUE){
				$hasil_kontribusi = ($data['laba_kotor'] / $laba_kotor_toko) * 100;
				$kontribusi = number_format($hasil_kontribusi,2);
				$hasil = ($kontribusi * $tbbn5211) / 100;
			}else{
				$hasil = 0;
			}

				echo "<td align='right'>".format_rp($hasil)."</td>";
			}
			?>
			<td align='right'><?php echo format_rp($tbbn5211)?></td>
			<td align='right'><?php echo format_rp($beban5211)?></td>
		</tr>
		
		<tr>
			<td>Beban Angkut Penjualan</td>
			<td align='right'><?php echo format_rp($ibbntotalvar)?></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'></td>
			<td align='right'><?php echo format_rp($ibbntotalvar)?></td>
		</tr>
		
		<tr>
			<td>Total Beban Variabel</td>
			<td align='right'><?php echo format_rp($ibbntotalvar)?></td>
			<?php 
			foreach($penjt as $data){
					if($data['laba_kotor'] == TRUE){
				$hasil_kontribusi = ($data['laba_kotor'] / $laba_kotor_toko) * 100;
				$kontribusi = number_format($hasil_kontribusi,2);
				$hasil = ($kontribusi * $tbbntotalvar) / 100;
			}else{
				$hasil = 0;
			}

				echo "<td align='right'>".format_rp($hasil)."</td>";
			}
			?>
			<td align='right'><?php echo format_rp($tbbntotalvar)?></td>
			<td align='right'><?php echo format_rp($total_beban_var)?></td>
		</tr>
		
		<tr>
			<td><b>Total Beban-Beban</b></td>
			<td align='right'><?php echo format_rp($ibbntotalakhir)?></td>
			<?php 
			foreach($penjt as $data){
					if($data['laba_kotor'] == TRUE){
				$hasil_kontribusi = ($data['laba_kotor'] / $laba_kotor_toko) * 100;
				$kontribusi = number_format($hasil_kontribusi,2);
				$hasil = ($kontribusi * $tbbntotalakhir) / 100;
			}else{
				$hasil = 0;
			}
				
				echo "<td align='right'>".format_rp($hasil)."</td>";
			}
			?>
			<td align='right'><?php echo format_rp($tbbntotalakhir)?></td>
			<td align='right'><?php echo format_rp($total_beban)?></td>
		</tr>

		<tr>
			<th>Laba Bersih</th>
			<td align='right'><?php echo format_rp($laba_bersih_ips)?></td>
			<?php 
			foreach($penjt as $data){
					if($data['laba_kotor'] == TRUE){
				$hasil_kontribusi = ($data['laba_kotor'] / $laba_kotor_toko) * 100;
				$kontribusi = number_format($hasil_kontribusi,2);
				$hasil = ($kontribusi * $laba_bersih_toko) / 100;
			}else{
				$hasil = 0;
			}

				echo "<td align='right'>".format_rp($hasil)."</td>";
			}
			?>
			<td align='right'><?php echo format_rp($laba_bersih_toko)?></td>
			<td align='right'><?php echo format_rp($laba_bersih)?></td>
		</tr>
		
		</tbody>
	



	
	
	</table>

</div>
</div>
</div>
</div>
</div>
</div>
</div>

</body>

	
	</body>
	</html>