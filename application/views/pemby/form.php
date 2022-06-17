<html>
	<head>
		<title>Transaksi Pembayaran Beban Tetap</title>
	</head>
	<!-- <center><h3><b>Transaksi Pembayaran Beban</h3></b></center>
	<hr> -->
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Pembayaran Beban Tetap</b></h3>
  </div>
  	 <div class="x_content">
<div>
	
<form method = "POST" action = "<?php echo site_url('c_transaksi/tambah_pemby1');?>">
		<div class="row">
	<div class="form-group">
			<div class="col-xs-6">
				<div class="form-group">
				<label>ID Transaksi</label>
				<input readonly type="text" class="form-control"  value="<?php echo $id ;?>" name="no_trans"  >
			</div>
		</div>
		
	
			<div class="col-xs-6">
				<div class="form-group">
				<label>Tanggal Transaksi</label>
				<input type="text" class="form-control"  value="<?php echo date('Y-m-d') ; ?>"readonly >
				</div>
			</div>
			
			</div>
	</div>
	<div class="row">
	<div class="form-group">
				<div class="col-xs-4">
				<div class="form-group">
				<label>Beban</label>
						<select name = "no_coa" class = "form-control">
							    <option value="#" disabled selected>Pilih Beban Tetap</option>
							     <option value="#" disabled>Beban Tetap</option>
								<?php				
								foreach($bebant as $data){				
								echo "<option value = ".$data['no_coa'].">".$data['nama_coa']."</option>";
															}
								?>
								
						</select>
	
				</div>
			</div>
		
	
			<div class="col-xs-4">
				<div class="form-group">
				<label>Jumlah</label>
				<input type="number" class="form-control" name="jumlah" >
				</div>
			</div>

			<div class="col-xs-4">
				<div class="form-group">
				<label>Jenis Penjualan</label>
						<select name = "jenis_penjualan" class = "form-control">
							    <option value="#" disabled selected>Pilih Jenis</option>
								<option value="ips">IPS</option>
								<option value="toko">Toko</option>
						</select>
	
				</div>
			</div>
			
		
			
	</div>
	</div>
<hr>
	<center>

	<button type="submit" class="btn btn-dark">Tambah Pembayaran</button>
</form>
	
		<a class="btn btn-info" role="button" <?php if($cek_selesai > '0'){?> href = "<?php echo site_url()."/c_transaksi/selesai_pemby/$id/$total"?>" <?php }else{?> disabled="disabled" <?php } ?>>Selesai Pembayaran</a>
	</center>

	
 <hr>
			<div class="form-group" >
			  <label>Total Transaksi</label>
			  <input readonly type = "text" class = "form-control" value = "<?php echo format_rp($total);?>">
			</div>
		<hr>

		<div class="row" >

	<div class="col-md-6" >
		<label>Beban Penjualan IPS</label>
		<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>Nama Beban</th>
				<th>Subtotal</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
			$total = 0;
				foreach($detailips as $data){
					
					echo "
							<tr>
							<td>".$data['nama_coa']."</td>
							<td align='right'>".format_rp($data['subtotal'])."</td>"; ?>
							

						</tr>
						
					<?php
					$total=$total+$data['subtotal'];
					$no++;
				}
			?>
			<tr>
				<td align="center">Total</td>
				<td align="right"><?php echo format_rp($total) ?></td>
			</tr>
			</tbody>

		</table>
		
	</div>
	<div class="col-md-6" >
		<label>Beban Penjualan Toko</label>
		<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>Nama Bahan</th>
				<th>Subtotal</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
			$total1 = 0;
				foreach($detailtoko as $data){
					
					echo "
							<tr>
							<td>".$data['nama_coa']."</td>
							<td align='right'>".format_rp($data['subtotal'])."</td>"; ?>
							

						</tr>
						
					<?php
					$total1=$total1+$data['subtotal'];
					$no++;
				}
			?>
			<tr>
				<td align="center">Total</td>
				<td align="right"><?php echo format_rp($total1) ?></td>
			</tr>
			</tbody>

		</table>
		
	</div>
	</div>
	</div>
</div>
	</body>
</html>