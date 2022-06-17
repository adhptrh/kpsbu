<html>
<head></head>

<body>

<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Detail Pembayaran Beban Variabel</b></h3>
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
				<label>ID Penjualan</label>
				<input type="text" class="form-control"  value="<?php echo $no_penj ; ?>"readonly >
				</div>
			</div>
			
			<div class="col-xs-3">
				<div class="form-group">
				<label>Jumlah Penjualan</label>
				<input readonly type="text" class="form-control"  value="<?php echo number($jumlahpenj); ?> liter"  >
			</div>
			
		</div>
			</div>
	</div>
	<?php if($cek1 == 0){?>
	<div class="row">
	<div class="form-group">
<form method = "POST" action = "<?php echo site_url('c_transaksi/tambah_pembyv1');?>">
				<input readonly type="hidden" class="form-control"  value="<?php echo $no_trans ; ?>"  name="no_trans">
				<input readonly type="hidden" class="form-control"  value="<?php echo $tgl ; ?>"  name="tgl_trans">
				<input readonly type="hidden" class="form-control"  value="<?php echo $jumlahpenj ; ?>"  name="jumlah_penj">
	
			<div class="col-xs-6">
				<div class="form-group">
				<label>Jenis Beban Variabel</label>
				<?php if($cpn == 'PENJS'){ ?>
				<input type="text" class="form-control"  value="Beban Angkut Penjualan" readonly>
				<input type="hidden" class="form-control"  value="5213" readonly name="no_coa">
				<?php }else{ ?>
						<select name = "no_coa" class = "form-control">
							    <option value="#" disabled selected>Pilih Beban Variabel</option>
								<?php				
								foreach($bebanv as $data){				
								echo "<option value = ".$data['no_coa'].">".$data['nama_coa']."</option>";
															}
								?>
								
						</select>

				<?php } ?>
			  <?php echo form_error('no_coa'); ?>
				</div>
			</div>

			<div class="col-xs-6">
				<div class="form-group">
				<label>Tarif (satuan)</label>
				<input type="text" class="form-control" name='tarif' >
			  <?php echo form_error('tarif'); ?>

				</div>
			</div>
			<center>
	<button type="submit" class="btn btn-dark">Tambah</button>
</center>
		
		</form>	
		</div>
	</div>
<?php } ?>
		
		<hr>
<br>
		<div class="row" >

	<div class="col-md-12" >
		<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>Nama Beban</th>
				<th>Jumlah Penjualan</th>
				<th>Tarif</th>
				<th>Subtotal</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
			$total = 0;
				foreach($detail as $data){
				
					echo "
							<tr>
							<td>".$data['nama_coa']."</td>
							<td align='right'>".number($data['jumlah'])."</td>
							<td align='right'>".format_rp($data['tarif'])."</td>
							<td align='right'>".format_rp($data['subtotal'])."</td>"; ?>
							

						</tr>
						
					<?php
					$total=$total+$data['subtotal'];
					$no++;
				}
			?>
			<tr>
				<td colspan="3" align="center">Total</td>
				<td align="right"><?php echo format_rp($total) ?></td>
			</tr>
			</tbody>

		</table>
		
	</div>
	
	</div>

	<!-- 
		<a href="lihat_BOM" class="btn btn-default">Back</a>
		<input type="button" class="btn btn-default" value="Back" onClick=history.go(-1);> -->
	</div>

	<div class="row">
		<div class="col-md-12">
	<?php if($cek1 == 0){?>

			<center>
	<a href = "<?php echo site_url()."/c_transaksi/lihat_pembyv"?>" class="btn btn-default" role="button">Kembali</a>
		<a href = "<?php echo site_url()."/c_transaksi/selesai_pembyv/$id/$total/$tgl "?>" class="btn btn-info" role="button">Selesai</a>
			</center>
		<?php }else{?>
	<a href = "<?php echo site_url()."/c_transaksi/lihat_pembyv"?>" class="btn btn-default" role="button">Kembali</a>
<?php } ?>
		</div>

	</div>
	</div>
</div>




</body>
</html>