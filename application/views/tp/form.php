<html>
	<head>
		<title>Master Data Target Produksi</title>
	</head>
	<!-- <center><h3><b>Master Data Target Produksi</h3></b></center>
	<hr> -->
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Form Target Produksi</b></h3>
  </div>
  	 <div class="x_content">
  	 	
	<body>
		<form method = "POST" action = "<?php echo site_url('c_transaksi/tambah_tp');?>">
			<div class="form-group">
			  <label>ID Target Produksi</label>
			  <input type = "text" name = "no_tp" class = "form-control" value="<?php echo $id?>" readonly>
			
			</div>
			  <div class="form-group">
              <label>Tanggal Produksi</label>
               <input type = "text" name = "tgl_tp" class = "form-control" value="<?php echo date('Y-m-d')?>" readonly>
                <!-- <input type = "date" name = "tgl_tp" class = "form-control" id="myDatepicker2"> -->
<!-- 
                <div class="form-group">
                        <div class='input-group date' id='myDatepicker2'>
                            <input type='text' class="form-control" name = "tgl_tp">
                            <span class="input-group-addon">
                               <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div> -->
            
			  <?php echo form_error('tgl_tp'); ?>
            </div>
			  
			
				  <div class="form-group">
				<label>ID Pembagian</label>
						<select name = "no_trans_pembagian" class = "form-control">
							    <option value="#" disabled selected>Pilih Pembagian</option>
								<?php				
								foreach($pembagian as $data){				
								echo "<option value = ".$data['no_trans'].">".$data['no_trans']."</option>";
															}
								?>
						</select>
	
			  <?php echo form_error('no_trans_pembagian'); ?>
				</div>
			
			  <hr>
			<button type="submit" class="btn btn-default btn-primary">Simpan</button>
			<a href = "<?php echo site_url()."/c_transaksi/lihat_tp"?>" type="button" class="btn btn-default">Kembali</a>
		</form>
	</body>
</html>