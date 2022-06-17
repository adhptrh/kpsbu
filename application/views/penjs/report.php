	<!DOCTYPE html>
	<html>
	<head>
		<title>Laporan Penjualan IPS</title>
	</head>
	<body>
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
	<!-- 	<center><h3><b>Laporan </b></h3></center>
	<hr> -->
	<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Daftar Penjualan IPS</b></h3>
  </div>
  	 <div class="x_content">
  	 	<div class="row">
  	 		<div class="col-sm-6">
		<form class = 'form-inline' method = "POST" class = "form-inline" action = "<?php echo site_url().'/c_keuangan/lap_penjs';?>">
		

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
  	 <div style="font-size: 20px">Laporan Penjualan IPS</div>
  
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
		<td>ID Transaksi</td>
		<td>Tanggal Transaksi</td>
		<td>Total Transaksi</td>
	</tr>
</thead>
<tbody>
	<?php
		$total=0;
				foreach($result as $data){
						echo"
					<tr>
						<td>".$data['no_trans']."</td>
						<td>".$data['tgl_trans']."</td>
						<td align='right'>".format_rp($data['total'])."</td>
					</tr>
					";
					$total = $total+$data['total'];
		}
		?>
		</tbody>
		<tr>

			<td colspan=2 align='center'> Total</td>
			<td align='right'><?php echo format_rp($total);?></td>
		</tr>
	</table>
	<center>
</center>
	<!-- 
	<a href="<?php echo site_url()."/c_keuangan/print_excel_lap_pemb"?>" target="_blank" rel="nofollow" class="btn btn-info" role="button">Print to Excel</a>
	<a href="<?php echo site_url()."/keuangan_penjualan/print_pdf_lap_penj"?>" target="_blank" rel="nofollow" class="btn btn-info" role="button">Print to PDF</a>
 -->
</body>
</html>