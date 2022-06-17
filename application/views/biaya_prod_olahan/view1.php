<html>
	<!-- <head><center><h3><b>Master Data Produksi Pertama</b></h3></center></head>
	<hr> -->
	<body>
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Laporan Harga Pokok Produksi Olahan</b></h3>
  </div>
  <?php  $namabulan = array(
      '0' => 'December',
      '1' => 'Januari',
      '2' => 'Februari',
      '3' => 'Maret',
      '4' => 'April',
      '5' => 'Mei',
      '6' => 'Juni',
      '7' => 'Juli',
      '8' => 'Agustus',
      '9' => 'September',
      '10' => 'Oktober',
      '11' => 'November',
      '12' => 'Desember',
       '01' => 'Januari',
      '02' => 'Februari',
      '03' => 'Maret',
      '04' => 'April',
      '05' => 'Mei',
      '06' => 'Juni',
      '07' => 'Juli',
      '08' => 'Agustus',
      '09' => 'September',
    );
  	$spasi = '&nbsp&nbsp&nbsp&nbsp';
    ?>
  	 <div class="x_content">
  	 		<div class="row">
  	 		<div class="col-sm-12">
		<form class = 'form-inline' method = "POST" class = "form-inline" action = "<?php echo site_url().'/c_keuangan/lap_bp_olahan';?>">
			<label>Produk</label>
						<select name = "produk" class = "form-control" required="">
							    <option value="#" disabled selected>Pilih Produk</option>
								<?php				
								foreach($list_produk as $data){				
								echo "<option value = ".$data['no_produk'].">".$data['no_produk']." - ".$data['nama_produk']."</option>";
															}
								?>
						</select>

				<label>Pilih Bulan :</label> 
				<select name="bulan" class="form-control" required="">
					<option value="*" disabled selected>Pilih Bulan</option>
					<option value="1">Januari</option>
					<option value="2">Februari</option>
					<option value="3">Maret</option>
					<option value="4">April</option>
					<option value="5">Mei</option>
					<option value="6">Juni</option>
					<option value="7">Juli</option>
					<option value="8" >Agustus</option>
					<option value="9" >September</option>
					<option value="10" >Oktober</option>
					<option value="11" >November</option>
					<option value="12" >Desember</option>

					</select>
		
		&nbsp&nbsp
			<label>Pilih Tahun :</label>
			<select name="tahun" class="form-control" required="">
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
	<!-- 	<div class="col-sm-6">
	<?php if(isset($bulan, $tahun)):?>
	<a href="<?php echo site_url()."/c_keuangan/lap_pdf_filter/$bulan/$tahun"?>"  target="_blank" rel="nofollow" class="btn btn-success" role="button">Print</a>
	<a href="<?php echo site_url()."/c_keuangan/lap_excel_filter/$bulan/$tahun"?>" target="_blank" rel="nofollow"  class="btn btn-success" role="button">Excel</a>
<?php endif ?>
	<a href="<?php echo site_url()."/c_keuangan/lap_pdf_all"?>"  target="_blank" rel="nofollow" class="btn btn-success" role="button">Print ALL</a>
	<a href="<?php echo site_url()."/c_keuangan/lap_excel_all"?>" target="_blank" rel="nofollow"  class="btn btn-success" role="button">Excel ALL</a>
<?php if(isset($bulan, $tahun)):?>
	<a href="<?php echo site_url()."/c_keuangan/lap_pemb"?>" class="btn btn-dark" role="button">Kembali</a>
	<?php endif ?>

</div> -->
</div>
		<p>
  	 <center><b>
  	 	<div style="font-size: 25px">
  	 	KPSBU
  	 </div>
  	 <div style="font-size: 20px">Laporan Harga Pokok Produksi Olahan <?php echo $nama_produk?></div>
  
  	<?php if(isset($bulan, $tahun)){ ?>
  	 <div style="font-size: 15px">
  	 	<?php echo $namabulan[$bulan] ?> <?php echo $tahun; ?>
  	 </div>
  	 <?php }?>
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
		
			<tr>
				<td>Pemakaian Produk Dalam Proses :</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><?php echo $spasi ?>Persediaan Produk Dalam Proses Awal</td>
				<td align='right'><?php echo format_rp('0')?></td>
				<td></td>
			</tr>
			<tr>
				<td><?php echo $spasi ?>Persediaan Produk Dalam Proses</td>
				<td align='right'><?php echo format_rp($bb)?></td>
				<td></td>
			</tr>
			<tr>
				<td><?php echo $spasi ?>Persediaan Produk Dalam Proses Siap Digunakan</td>
				<td align='right'><?php echo format_rp($bb)?></td>
				<td></td>
			</tr>
			<tr>
				<td><?php echo $spasi ?>Persediaan Produk Dalam Proses Akhir</td>
				<td align='right'><?php echo format_rp('0')?></td>
				<td></td>
			</tr>
			<tr>
				<th>Total Pemakaian Produk Dalam Proses</th>
				<td></td>
				<td align='right'><b><?php echo format_rp($bb)?></b></td>
			</tr>
			<tr>
				<th>Biaya Tenaga Kerja Langsung (BTKL)</th>
				<td></td>
				<td align='right'><b><?php echo format_rp($btk)?></b></td>
			</tr>
			<tr>
				<td>Biaya Overhead Pabril Variabel</td>
				<td align='right'></td>
				<td></td>
			</tr>
			<!-- 
					<?php
			$no=1;
			$bbop = 0;
				foreach($bop as $data){

					echo "
					<tr>
							<td>".$data['nama_jbop']."</td>
							

							<td align='right'>".format_rp(($data['harga'] * $jmlproduk))."</td>
							<td></td>
							<tr>"; 
							$bbop = ($bbop + ($data['harga'] * $jmlproduk)); 
					?>
			</tr>
					<?php
					$no++;
				} 
				?> -->

				<?php
			$no=1;
			$bbop = 0;
				foreach($jenis_bop as $data){
					$no_jbop = $data['no_jbop'];
			$totalbop1 = 0;
					$q100 = "SELECT no_jbop,jumlah, harga, no_produk, a.no_bopo, ifnull(((jumlah) * (harga)),0) as total
							FROM detail_bopo a 
							RIGHT JOIN bopo as b ON a.no_bopo = b.no_bopo
							LEFT JOIN detail_produksi_ke2 c ON b.tgl_bopo = c.tgl_trans
							WHERE MONTH(tgl_trans) = '$bulan' AND YEAR(tgl_trans) = '$tahun' AND no_produk = '$no_produk' AND no_jbop = '$no_jbop'";
					$row = $this->db->query($q100)->result_array();
					foreach ($row as $data1) {
							$totalbop1 = $totalbop1 + $data1['total'];
						}

					echo "
					<tr>
							<td>".$data['nama_jbop']."</td>
							

							<td align='right'>".format_rp($totalbop1)."</td>
							<td></td>
							</tr>"; 
					?>
		
					<?php
					$bbop = ($bbop + $totalbop1); 
					$no++;
				} 
				?>

			<tr>
				<td>Bahan Penolong</td>
				<td align='right'></td>
				<td></td>
			</tr>
			<?php
			$no=1;
				foreach($list_bp as $data){

					echo "
					<tr>
							<td>".$data['nama_bp']."</td>
							

							<td align='right'>".format_rp($data['total'])."</td>
							<td></td>
							</tr>"; 
					?>
			
					<?php
					$no++;
				} 
				?>

			<tr>
				<th>Total Biaya Overhead Pabrik Variabel</th>
				<td></td>
				<td align='right'><b><?php echo format_rp($totalbop)?></b></td>
			</tr>

			<tr>
				<th>Total Biaya Produksi</th>
				<td></td>
				<td align='right'><b><?php echo format_rp($totalhpp)?></b></td>
			</tr>
			<tr>
				<td>Persediaan Produk Dalam Proses Awal</td>
				<td></td>
				<td align='right'><?php echo format_rp('0')?></td>
			</tr>
			<tr>
				<td>Produk Siap DiProses</td>
				<td></td>
				<td align='right'><b><?php echo format_rp($totalhpp)?></b></td>
			</tr>
			<tr>
				<th>Persediaan Produk Dalam Proses Akhir</th>
				<td></td>
				<td align='right'><?php echo format_rp('0')?></td>
			</tr>
			<tr>
				<th>Harga Pokok Produksi</th>
				<td></td>
				<td align='right'><b><?php echo format_rp($totalhpp)?></b></td>
			</tr>
			
			
		</table>

	
	
	</body>
</html>