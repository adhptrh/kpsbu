<head>
	<title>Master Data TPS</title>
</head>

<div class="x_panel">
		<div class="x_title">
		<h3 class="panel-title"><b>Form TPS</b></h3>
		</div>
	 	
	 	<div class="x_content">
	 	
		<body>
			<form method = "POST" action = "<?php echo site_url('c_masterdata/simpan_tps');?>">
				
				<div class="form-group row">
					<label class="col-sm-2">ID TPS</label>	
					<div class="col-sm-6">
				  		<input type = "text" name ="id" class ="form-control" value="<?= $id?>" readonly>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">Alamat TPS</label>	
					<div class="col-sm-6">
						<textarea name="alamat" id="alamat" cols="10" rows="5" class="form-control" placeholder="Alamat" required></textarea>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">Kordinator Wilayah</label>	
					<div class="col-sm-6">
				  		<input type ="text" name ="kordinator" class="form-control" autocomplete="off" placeholder="Nama Kordinator Wilayah">
						  <?= form_error('kordinator')?>
					</div>
				</div>
				<hr>
				<a href="<?= base_url('c_masterdata/tps')?>" class="btn btn-default">Kembali</a>
				<button type="submit" class="btn btn-primary">Simpan</button>
			</form>
		</body>
	</div>
</div>