<html>
	<head>
		<title>Master Data Supplier Aset</title>
	</head>
	
	<div class="x_panel">
 		<div class="x_title">
    		<h3 class="panel-title"><b>Form Supplier Aset</b></h3>
  		</div>
  	 	
  	 	<div class="x_content">
  	 	
			<body>
				<form method = "POST" action = "<?php echo site_url('c_masterdata/update_supplier');?>">
					
					<div class="form-group">
					  <label>ID Aset</label>
					  <input type = "text" name = "id_supplier_aset" class = "form-control" value="<?php echo $data->id ?>" readonly>
					</div>

					<div class="form-group">
					  <label>Nama Supplier</label>
					  <input type = "text" name = "nama_supplier" class = "form-control" placeholder="Enter here..." value="<?= $data->nama_supplier ?>">
					  <?php echo form_error('nama_supplier'); ?>
					</div>

					<div class="form-group">
					  <label>Alamat</label>
					  <!-- <textarea class="form-control" name="alamat" rows="5" cols="10" placeholder="Enter here..." value="<?= $data->alamat?>"></textarea> -->
					  <?php 
						    $text_area = array(
						        'name'        => 'alamat',
						        'id'          => 'alamat',
						        'value'       => $data->alamat,
						        'rows'        => '5',
						        'class'       => 'form-control',
						        );
						    echo form_textarea($text_area);
						?>
					  <?php echo form_error('alamat'); ?>
					</div>

					<div class="form-group">
					  <label>No Telepon</label>
					  <input type = "text" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" name = "no_telepon" class = "form-control" max="13" placeholder="Enter here..." value="<?= $data->no_telepon?>">
					  <?php echo form_error('no_telepon'); ?>
					</div>
					
					
					<hr>
					<input type="submit" class="btn btn-default btn-primary" value="Simpan">
					<a href = "<?php echo site_url("c_masterdata/supplier_aset") ?>" type="button" class="btn btn-default">Kembali</a>
				</form>
			</body>
		</div>
	</div>
</html>