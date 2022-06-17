<html>
	<head>
		<title>Transaksi Penjualan IPS</title>
	</head>
	<!-- <center><h3><b>Transaksi Penjualan IPS</h3></b></center>
	<hr> -->
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Form Penjualan IPS</b></h3>
  </div>
  	 <div class="x_content">
  	 	
	<body>
		<form method = "POST" action = "<?php echo site_url('c_transaksi/tambah_penjs0');?>">
			<div class="form-group">
			  <label>ID Penjualan IPS</label>
			  <input type = "text" name = "no_trans" class = "form-control" value="<?php echo $id?>" readonly>
			
			</div>
			<div class="form-group">
			  <label>Tanggal</label>
			  <input type = "text" name = "tgl_trans" class = "form-control" readonly value="<?php echo date('Y-m-d')?>">
			</div>

			  <div class="form-group">
				<label>ID Pembagian ke IPS</label>
						<select name = "no_trans_pembg" class = "form-control">
							    <option value="#" disabled selected>Pilih ID Pembagian</option>
								<?php				
								foreach($pembagian as $data){				
								echo "<option value = ".$data['no_trans'].">".$data['no_trans']." - ".number($data['jual'])." buah</option>";
															}
								?>
						</select>
			<?php echo form_error('no_trans_pembg'); ?>
	
				</div>
			
			  <hr>
			<button type="submit" class="btn btn-default btn-primary">Simpan</button>
			<a href = "<?php echo site_url()."/c_transaksi/lihat_penjs"?>" type="button" class="btn btn-default">Kembali</a>
		</form>
	</body>
</html>