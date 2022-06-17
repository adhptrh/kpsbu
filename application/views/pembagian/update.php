<html>
<head></head>

<body>
<?php
 if($cek  == '0')
{
	?>
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Pembagian</b></h3>
  </div>
  	 <div class="x_content">
<div>
	<?php if (isset($error)){ echo "<div class='alert alert-danger'><li>".$error."</li></div>"; }?>
	
		<div class="row">
	<div class="form-group">
			<div class="col-xs-4">
				<div class="form-group">
				<label>ID Transaksi</label>
				<input readonly type="text" class="form-control"  value="<?php echo $no_trans ; ?>"  >
			</div>
		</div>
		
		<div class="col-xs-4">
				<div class="form-group">
				<label>ID Produksi</label>
				<input readonly type="text" class="form-control"  value="<?php echo $prod ; ?>"  >
			</div>
		</div>
	
			<div class="col-xs-4">
				<div class="form-group">
				<label>Tanggal Transaksi</label>
				<input type="text" class="form-control"  value="<?php echo $tgl ; ?>"readonly >
				</div>
			</div>
			
	</div>
	</div>
<form method = "POST" action = "<?php echo site_url('c_transaksi/selesai_pembagian');?>">
	<div class="row">
	<div class="form-group">
			<input readonly type="hidden" class="form-control"  name ="no_trans" value="<?php echo $no_trans ; ?>"  >
			<input readonly type="hidden" class="form-control"  name = "jumlah" value="<?php echo $jumlah?>"  >
			<input readonly type="hidden" class="form-control"  name = "no_prod" value="<?php echo $prod?>"  >
			<input readonly type="hidden" class="form-control"  name = "tgl_trans" value="<?php echo $tgl?>"  >

				<div class="col-xs-4">
				<div class="form-group">
				<label>Bahan Baku</label>
				<input readonly type="text" class="form-control"  value="Susu Sapi"  >
			</div>
		</div>
			<div class="col-xs-4">
				<div class="form-group">
				<label>Penjualan ke IPS</label>
				<input type="text" class="form-control"  value="<?php echo number(130000)?>" readonly>
				<input type="hidden" class="form-control"  name="jual" value="130000" readonly>
			  <?php echo form_error('jual'); ?>
			</div>
		</div>
			<div class="col-xs-4">
				<div class="form-group">
				<label>Dari</label>
				<input readonly type="text" class="form-control"  value="<?php echo number($jumlah) ?> <?php echo $satuan?>"  >
				<input readonly type="hidden" class="form-control"  value="<?php echo $jumlah?>"  name="jumlah">;
			</div>
		</div>
		
		

			
	</div>
</div>
<hr>
	<center>

	<button type="submit" class="btn btn-dark">Selesai Pembagian</button>
</form>
	
		
	</center>

		

 
	</div>
	</div>
</div>
<?php 
} 
?>


<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Detail Pembagian</b></h3>
  </div>
  	 <div class="x_content">
<div>
	
		<div class="row">
	<div class="form-group">
			<div class="col-xs-3">
				<div class="form-group">
				<label>ID Transaksi</label>
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
				<label>Bahan Baku</label>
				<input readonly type="text" class="form-control"  value="Susu Sapi"  >
			</div>
		</div>

			<div class="col-xs-3">
				<div class="form-group">
				<label>Jumlah Tersedia</label>
				<input readonly type="text" class="form-control"  value="<?php echo number($jumlah)?> <?php echo $satuan?>"  >
			</div>
		</div>
			</div>
	</div>
		
		<hr>
<br>
		<div class="row" >

	<div class="col-md-12" >
		<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>Dijual ke IPS</th>	
				<th>Produksi Olahan</th>
				<th>Total</th>
			<!-- 	<th>Supplier</th>
				<th>Aksi</th> -->
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
			$total = 0;
				foreach($detail as $data){
					$total = $data['produksi'] + $data['jual'];
					echo "
							<tr>
							<td align='right'>".number($data['jual'])." </td>
							<td align='right'>".number($data['produksi'])."</td>
							<td align='right'>".number($total)." </td>"; ?>
							

						</tr>
						
					<?php

					$no++;
				}
			?>
			
			</tbody>

		</table>
		
	</div>

	<!-- 
		<a href="lihat_BOM" class="btn btn-default">Back</a>
		<input type="button" class="btn btn-default" value="Back" onClick=history.go(-1);> -->
	</div>
	<a href = "<?php echo site_url()."c_transaksi/lihat_pembagian"?>" class="btn btn-default" role="button">Kembali</a>

	</div>
	</div>
</div>



</body>
</html>