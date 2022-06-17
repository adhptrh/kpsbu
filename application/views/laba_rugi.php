<html>
	<body>
	<!-- 	
	<center><h3><b>Jurnal</b></h3></center>
	<hr> --><?php 

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
    );?>
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Daftar Laba Rugi</b></h3>
  </div>
  	 <div class="x_content">
  	 	<div class="row">
  	 		<div class="col-sm-8">
		<form class = 'form-inline' method = "POST" class = "form-inline" action = "<?php echo site_url().'/c_keuangan/lr';?>">
		 <label>Produk :</label>
			  <select name="no_produk" class="form-control">
			  	<option value="#" disabled selected>Pilih Produk</option>
			  	<option value="all">ALL</option>
			 	 <?php
				foreach($produk as $data){
				echo "<option value = ".$data['no_produk'].">".$data['nama_produk']."</option>";
					}
				?>
			  </select>
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
	</div>
		<!-- <div class="col-sm-4">
	<?php if(isset($bulan, $tahun, $no_akun)):?>
	<a href="<?php echo site_url()."/c_keuangan/bukubesar_pdf_filter/$no_akun/$bulan/$tahun"?>"  target="_blank" rel="nofollow" class="btn btn-success" role="button">Print</a>
	<a href="<?php echo site_url()."/c_keuangan/bukubesar_excel_filter/$no_akun/$bulan/$tahun"?>" target="_blank" rel="nofollow"  class="btn btn-success" role="button">Excel</a>
<?php endif ?> -->
	<!-- <a href="<?php echo site_url()."/c_keuangan/bukubesar_pdf_all"?>"  target="_blank" rel="nofollow" class="btn btn-success" role="button">Print ALL</a>
	<a href="<?php echo site_url()."/c_keuangan/bukubesar_excel_all"?>" target="_blank" rel="nofollow"  class="btn btn-success" role="button">Excel ALL</a> -->
<!-- <?php if(isset($bulan, $tahun, $no_akun)):?>
	<a href="<?php echo site_url()."/c_keuangan/view_bukubesar"?>" class="btn btn-dark" role="button">Kembali</a>
	<?php endif ?>

</div> -->
</div>

<p>
  	 <center><b>
  	 	<div style="font-size: 25px">
  	 	KPSBU Lembang
  	 </div>

  	 <div style="font-size: 20px">
  	 Laba Rugi
  	 <?php 
	if(isset($namaprod)){
	?>- <?php echo $namaprod; }?>
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
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody>

	<?php
		$penj = 0;
		$hp = 0;
		$bbn = 0;
		$labakotor = 0;
		$lababersih = 0;
		$bvar = 0;
		$bttp = 0;
		$bu =0;
		$totalbeban = 0;
		$kont = 0;
		
	$fpenj = 0;
	$fakhir = 0;
	$fjadi = 0;
	$fawald = 0;
	$fawalk = 0;
	$fawal = 0;
	$kontribusi = 0;
	

	if(isset($namaprod)){

		foreach ($penjualan as $a) {
		# code...
		$fpenj = $fpenj + $a['nominal'];
	}
	foreach ($akhir as $a) {
		# code...
		$fakhir = $fakhir + $a['nominal'];
	}
	foreach ($jadi as $a) {
		# code...
		$fjadi = $fjadi + $a['nominal'];
	}
	foreach ($cekawald as $a) {
		# code...
		$fawald = $fawald + $a['nominal'];
	}
	foreach ($cekawalk as $a) {
		# code...
		$fawalk = $fawalk + $a['nominal'];
	}
	$fawal = $fawald - $fawalk;
	$siapjual = $fjadi + $fawal;
	$hpp = $siapjual - $fakhir;
	$labakotor = $fpenj - $fakhir;

	if($fpenj == 0){
		$kontribusi = 0;
	}else{
		$kontribusi = ($labakotor / $labakotor1) * 100;
	}
	?>
		<tr>
			<th>Penjualan</th>
			<td align='right'></td>
			<td align='right'><?php echo format_rp($fpenj) ;?></td>
		</tr>
	
					
		<tr>
			<th>Harga Pokok Penjualan</th>
			<td align='right'></td>
			<td align='right'></td>
		</tr>
		<tr>
			<td><?php echo $spasi ;?>Persediaan Produk Jadi (Awal)</td>
			<td align='right'><?php echo format_rp($fawal); ?></td>
			<td align='right'></td>
		</tr>
		<tr>
			<td><?php echo $spasi ;?>Harga Pokok Produksi Produk Jadi</td>
			<td align='right'><?php echo format_rp($fjadi) ?></td>
			<td align='right'></td>
		</tr>
		<tr>
			<td><?php echo $spasi ;?>Barang Siap Dijual</td>
			<td align='right'><?php echo format_rp($siapjual); ?></td>
			<td align='right'></td>
		</tr>
		<tr>
			<td><?php echo $spasi ;?>Persediaan Produk Jadi (Akhir)</td>
			<td align='right'><?php echo format_rp($hpp) ?></td>
			<td align='right'></td>
		</tr>
		<tr>
			<td><b><?php echo $spasi ;?>Jumlah Harga Pokok Penjualan</b></td>
			<td align='right'></td>
			<td align='right'><b><?php echo format_rp($fakhir)?></b></td>
		</tr>
		
		
		<tr>
			<td><b>Laba Kotor</b></td>
			<td align='right'></td>
			<td align="right"><b><?php echo format_rp($labakotor)?></b></td>
		</tr>
		<tr>
			<th>Kontribusi</th>
			<td align='right'></td>
			<td align='right'><?php echo round($kontribusi) ?>%</td>
		</tr>
		<tr>
			<th>Beban Operasional</th>
			<td align='right'></td>
			<td align='right'></td>
		</tr>
		
		<tr>
			<th>Beban Usaha</th>
			<td align='right'></td>
			<td align='right'></td>
		</tr>
		 <?php 
		foreach ($beban as $data) {
			# code...
			echo "
					<tr>
					<td>".$spasi."".$data['nama_coa']."</td>
					<td align='right'>".format_rp($data['nominal'] * ($kontribusi / 100 ))."</td>
					<td></td>
					</tr>
					";
					$bu = $bu + ($data['nominal'] * ($kontribusi / 100));
		}

		?> 
		<tr>
			<td><b><?php echo $spasi ;?>Total Beban Usaha</b></td>
			<td align="right"><b><?php echo format_rp($bu); ?></b></td>
			<td align='right'></td>
		</tr>
		<tr>
			<th>Beban Overhead Pabrik Tetap</th>
			<td align='right'></td>
			<td align='right'></td>
		</tr>
		<?php 
		
		?>

		<!-- <tr>
			<td><?php echo $spasi ;?><?php echo $boptetap['nama_coa'];?></td>
			<td align='right'><?php echo format_rp($boptetap1)?></td>
			<td align='right'></td>
		</tr> -->
		<?php 
		foreach ($boptetap as $data) {
			# code...
			echo "
					<tr>
					<td>".$spasi."".$data['nama_coa']."</td>
					<td align='right'>".format_rp($data['nominal'] * ($kontribusi /100 ))."</td>
					<td></td>
					</tr>
					";
					$bttp = $bttp + ($data['nominal'] * ($kontribusi /100));
		}
		?>
		
		<tr>
			<th><?php echo $spasi ;?>Total Beban Overhead Pabrik Tetap</th>
			<td align='right'><b><?php echo format_rp($bttp) ?></b></td>
			<td align='right'></td>
		</tr>
		<tr>
			<th>Beban Overhead Pabrik Variabel</th>
			<td align='right'></td>
			<td align='right'></td>
		</tr>

		<?php 
		foreach ($bopvar as $data) {
			# code...
			echo "
					<tr>
					<td>".$spasi."".$data['nama_coa']."</td>
					<td align='right'>".format_rp($data['nominal'] * ($kontribusi /100 ))."</td>
					<td></td>
					</tr>
					";
					$bvar = $bvar + ($data['nominal'] * ($kontribusi /100));
		}
		?>
		<tr>
			<td><?php echo $spasi ;?><b>Total Beban Overhead Pabrik Variabel</b></td>
			<td align="right"><b><?php echo format_rp($bvar); ?></b></td>
			<td align='right'></td>
		</tr>

		<?php
		$totalbeban = $bvar + $bttp + $bu;
		$lababersih = $labakotor - $totalbeban;
		?>
		<tr>
			<td><b>Total Beban-beban</b></td>
			<td align='right'></td>
			<td align="right"><b><?php echo format_rp($totalbeban); ?></b></td>
		</tr>
		<tr>
			<td><b>Laba Bersih</b></td>
			<td align='right'></td>
			<td align="right"><b><?php echo format_rp($lababersih)?></b></td>
		</tr>

	<?php 
	}else{

	
	?>
	 

		<?php 
	
		$penj = $penjualan;
		$labakotor = $penj - $hpp;
		
		if($penjualan == 0){
			$kontribusi = 0;
		}else{
			$kontribusi = ($penjualan / $penjualan) *100;
		}
		?>
		<tr>
			<th>Penjualan</th>
			<td align='right'></td>
			<td align='right'><?php echo format_rp($penj)?></td>
		</tr>
	
					
		<tr>
			<th>Harga Pokok Penjualan</th>
			<td align='right'></td>
			<td align='right'></td>
		</tr>
		<tr>
			<td><?php echo $spasi ;?>Persediaan Produk Jadi (Awal)</td>
			<td align='right'><?php echo format_rp($awal)?></td>
			<td align='right'></td>
		</tr>
		<tr>
			<td><?php echo $spasi ;?>Harga Pokok Produksi Produk Jadi</td>
			<td align='right'><?php echo format_rp($jadi) ;?></td>
			<td align='right'></td>
		</tr>
		<tr>
			<td><?php echo $spasi ;?>Barang Siap Dijual</td>
			<td align='right'><?php echo format_rp($jumlahjual);?></td>
			<td align='right'></td>
		</tr>
		<tr>
			<td><?php echo $spasi ;?>Persediaan Produk Jadi (Akhir)</td>
			<td align='right'><?php echo format_rp($akhir)?></td>
			<td align='right'></td>
		</tr>
		<tr>
			<td><b><?php echo $spasi ;?>Jumlah Harga Pokok Penjualan</b></td>
			<td align='right'></td>
			<td align='right'><b><?php echo format_rp($hpp);?></b></td>
		</tr>
		
		
		<tr>
			<td><b>Laba Kotor</b></td>
			<td align='right'></td>
			<td align="right"><b><?php echo format_rp($labakotor);?></b></td>
		</tr>
		<tr>
			<th>Kontribusi</th>
			<td align='right'></td>
			<td align='right'><?php echo $kontribusi?>%</td>
		</tr>
		<tr>
			<th>Beban Operasional</th>
			<td align='right'></td>
			<td align='right'></td>
		</tr>
		
		<tr>
			<th>Beban Usaha</th>
			<td align='right'></td>
			<td align='right'></td>
		</tr>
		 <?php 
		foreach ($beban as $data) {
			# code...
			echo "
					<tr>
					<td>".$spasi."".$data['nama_coa']."</td>
					<td align='right'>".format_rp($data['nominal'])."</td>
					<td></td>
					</tr>
					";
					$bu = $bu + $data['nominal'];
		}
		?> 
		<tr>
			<td><b><?php echo $spasi ;?>Total Beban Usaha</b></td>
			<td align="right"><b><?php echo format_rp($bu); ?></b></td>
			<td align='right'></td>
		</tr>
		<tr>
			<th>Beban Overhead Pabrik Tetap</th>
			<td align='right'></td>
			<td align='right'></td>
		</tr>
		<!-- <tr>
			<td><?php echo $spasi ;?><?php echo $boptetap['nama_coa'];?></td>
			<td align='right'><?php echo format_rp($boptetap['nominal'])?></td>
			<td align='right'></td>
		</tr>
		<?php 
			$bttp = $boptetap['nominal'];
		?> -->
		<?php 
		foreach ($boptetap as $data) {
			# code...
			echo "
					<tr>
					<td>".$spasi."".$data['nama_coa']."</td>
					<td align='right'>".format_rp($data['nominal'] * ($kontribusi /100 ))."</td>
					<td></td>
					</tr>
					";
					$bttp = $bttp + ($data['nominal'] * ($kontribusi /100));
		}
		?>
		<tr>
			<th><?php echo $spasi ;?>Total Beban Overhead Pabrik Tetap</th>
			<td align='right'><b><?php echo format_rp($bttp) ?></b></td>
			<td align='right'></td>
		</tr>
		<tr>
			<th>Beban Overhead Pabrik Variabel</th>
			<td align='right'></td>
			<td align='right'></td>
		</tr>

		<?php 
		foreach ($bopvar as $data) {
			# code...
			echo "
					<tr>
					<td>".$spasi."".$data['nama_coa']."</td>
					<td align='right'>".format_rp($data['nominal'])."</td>
					<td></td>
					</tr>
					";
					$bvar = $bvar + $data['nominal'];
		}
		?>
		<tr>
			<td><?php echo $spasi ;?><b>Total Beban Overhead Pabrik Variabel</b></td>
			<td align="right"><b><?php echo format_rp($bvar); ?></b></td>
			<td align='right'></td>
		</tr>

		<?php
		$totalbeban = $bvar + $bttp + $bu;
		$lababersih = $labakotor - $totalbeban;
		?>
		<tr>
			<td><b>Total Beban-beban</b></td>
			<td align='right'></td>
			<td align="right"><b><?php echo format_rp($totalbeban); ?></b></td>
		</tr>
		<tr>
			<td><b>Laba Bersih</b></td>
			<td align='right'></td>
			<td align="right"><b><?php echo format_rp($lababersih)?></b></td>
		</tr>
		<?php
	}
	?>




		</tbody>
	
	</table>



	
	</body>
	</html>