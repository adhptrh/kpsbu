<html>
	<head>
		<title>Transaksi Pembayaran Beban Variabel</title>
	</head>
	<body>
	<!-- <center><h3><b>Transaksi Pembayaran Beban</h3></b></center>
	<hr> -->
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Pembayaran Beban Variabel</b></h3>
  </div>
  	 <div class="x_content">
<div>
<form method = "POST" action = "<?php echo site_url('c_transaksi/tambah_pembyv');?>">
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
				<input type="text" class="form-control"  value="<?php echo date('Y-m-d') ; ?>"readonly name="tgl_trans">
				</div>
			</div>
			
	</div>
	</div>
	<div class="row">
	<div class="form-group">
				<div class="col-xs-12">
				<div class="form-group">
				<label>ID Penjualan</label>
						<select name = "no_penj" class = "form-control">
							    <option value="#" disabled selected>Pilih ID Penjualan</option>
							    <option value="#" disabled selected>Penjualan IPS</option>
								<?php				
								foreach($penjips as $data){				
								echo "<option value = ".$data['no_trans'].">".$data['no_trans']." - ".number($data['jumlah'])." liter</option>";
															}
								?>
							    <option value="#" disabled selected>Penjualan Toko</option>

								<?php				
								foreach($penjtoko as $data){				
								echo "<option value = ".$data['no_trans'].">".$data['no_trans']." - ".number($data['jumlah'])." liter</option>";
															}
								?>
								
						</select>
	
				</div>
			</div>
		
	
		
			
		
			
	</div>
	</div>
	<center>

	<button type="submit" class="btn btn-dark">Tambah</button>
</form>
	</center>

	
</div>
</div>
</div>
		
	</body>
</html>