<html>
	<!-- <head><center><h3><b>Master Data Produksi Pertama</b></h3></center></head>
	<hr> -->
	<body>
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Laporan Biaya Produksi IPS</b></h3>
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
      '12' => 'Desember'
    );?>
  	 <div class="x_content">
  	 		<div class="row">
  	 		<div class="col-sm-6">
		<form class = 'form-inline' method = "POST" class = "form-inline" action = "<?php echo site_url().'/c_keuangan/lap_bp_ips';?>">
		

				<label>Pilih Bulan :</label> 
				<select name="bulan" class="form-control">
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
  	 <div style="font-size: 20px">Laporan Biaya Produksi IPS</div>
  
  	<?php if(isset($bulan, $tahun)){ ?>
  	 <div style="font-size: 15px">
  	 	<?php echo $namabulan[$bulan] ?> <?php echo $tahun; ?>
  	 </div>
  	 <?php }?>
</b>
</center>
</p>
  	 	 <table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
		 	<thead>
			<tr class="headings">
				<th style="width: 2px;">No</th>
				<th>ID Transaksi</th>
				<th>Tanggal Transaksi</th>
				<th>Total Transaksi</th>
				<th>Aksi</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
			$total = 0;
			$totalbiaya = 0;
				foreach($result as $data){
					$total = $data['bbb'] + $data['btk'] + $data['bop'];
					echo "

						<tr><td>$no</td>
							<td>".$data['no_trans']."</td>
							<td>".$data['tgl_trans']."</td>
							<td align = 'right'>".format_rp($total)."</td>
							" ?>
							<td>
							<a href="detail_lap_bp_ips/<?php echo $data['no_trans']; ?>">
							
							<span class="fa-stack">
							  <i class="fa fa-square fa-stack-2x" style="color:#2A3F54;"></i>
							 <span class="glyphicon glyphicon-pencil fa-stack-1x" aria-hidden="true" style="color:white"></span>
							</span> </a>
							</td>
							<!--<td align="center">
							<a class="btn btn-warning" href="isi_edit_pemb/<?php echo $data['no_pemb']; ?>" onclick="return confirm('Yakin mau dihapus?')" class="btn btn-daner">Hapus</a>
					</td>-->

						</tr>
						
					<?php
					$no++;
					$totalbiaya = $totalbiaya + $total;
				}
			?>
				<td colspan="3" align='center'><b>Total</b></td>
			<td align ="right"><b><?php echo format_rp($totalbiaya) ; ?></b></td>
			<td></td>
		</tr>
			</tbody>
		</table>

	
	
	</body>
</html>