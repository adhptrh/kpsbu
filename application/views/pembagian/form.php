<html>
	<head>
		<title>Transaksi Pembagian</title>
	</head>
	<!-- <center><h3><b>Transaksi Pembagian</h3></b></center>
	<hr> -->
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Form Pembagian</b></h3>
  </div>
  	 <div class="x_content">
  	 	
	<body>
		<form method = "POST" action = "<?php echo site_url('c_transaksi/tambah_pembagian');?>">
			<div class="form-group">
			  <label>ID Pembagian</label>
			  <input type = "text" name = "no_trans" class = "form-control" value="<?php echo $id?>" readonly>
			
			</div>
			<div class="form-group">
			  <label>Tanggal</label>
			  <input type = "text" name = "tgl_trans" class = "form-control" readonly value="<?php echo date('Y-m-d')?>">
			</div>

			<div class="form-group">
				<label>ID Produksi IPS</label>
						<select name = "no_trans_produksi1" class = "form-control">
							    <option value="#" disabled selected>Pilih Produksi</option>
								<?php				
								foreach($prod as $data){				
								echo "<option value = ".$data['no_trans'].">".$data['no_trans']." (".$data['tgl_trans'].")</option>";
															}
								?>
						</select>
			  <?php echo form_error('no_trans_produksi1'); ?>
	
				</div>
			  
			
			  <hr>
			<button type="submit" class="btn btn-default btn-primary">Simpan</button>
			<a href = "<?php echo site_url()."/c_transaksi/lihat_pembagian"?>" type="button" class="btn btn-default">Kembali</a>
		</form>
	</body>
</html>