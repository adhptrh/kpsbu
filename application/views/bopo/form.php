<html>
	<head>
		<title>Master Data BOP Olahan</title>
	</head>
	<!-- <center><h3><b>Master Data BOP</h3></b></center>
	<hr> -->
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Form BOP Olahan</b></h3>
  </div>
  	 <div class="x_content">
  	 	
	<body>
		<form method = "POST" action = "<?php echo site_url('c_masterdata/tambah_bopo');?>">
			<div class="form-group">
			  <label>ID BOP Olahan</label>
			  <input type = "text" name = "no_bopo" class = "form-control" value="<?php echo $id?>" readonly>
			
			</div>
			  <div class="form-group">
              <label>Tanggal</label>
                <input type = "text" name = "tgl_bopo" class = "form-control" value="<?php echo date('Y-m-d')?>" readonly>
               <!--  <div class="form-group">
                        <div class='input-group date' id='myDatepicker2'>
                            <input type='text' class="form-control" name = "tgl_bop">
                            <span class="input-group-addon">
                               <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div> -->
            
			  <?php echo form_error('tgl_bopo'); ?>
            </div>
			<!-- <div class="form-group">
			  <label>Bulan</label>
			  <select name="bulan" class="form-control">
					<option value="*" disabled selected>Pilih Bulan</option>
					<option value="01">Januari</option>
					<option value="02">Februari</option>
					<option value="03">Maret</option>
					<option value="04">April</option>
					<option value="05">Mei</option>
					<option value="06">Juni</option>
					<option value="07">Juli</option>
					<option value="08" >Agustus</option>
					<option value="09" >September</option>
					<option value="10" >Oktober</option>
					<option value="11" >November</option>
					<option value="12" >Desember</option>

					</select>
			  
			  <?php echo form_error('bulan'); ?>
			
			</div>
			<div class="form-group">
			  <label>Tahun</label>
			<select name="tahun" class="form-control">
				<option value="#" disabled selected>Pilih Tahun</option>
				<?php
				$now =date('Y');
				for ($a=2018;$a<=$now;$a++)

					{

     echo "<option value='".$a."'>".$a."</option>";

					}
				?>
				</select>
			  
			  <?php echo form_error('tahun'); ?>
			
			</div> -->
			
				
			  <hr>
			<button type="submit" class="btn btn-default btn-primary">Simpan</button>
			<a href = "<?php echo site_url()."/c_masterdata/lihat_bopo"?>" type="button" class="btn btn-default">Kembali</a>
		</form>
	</body>
</html>