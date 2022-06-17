<html>
<head></head>

<body>

		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><center><b>Edit BOP IPS</b></center></h3>
  </div>
  	 <div class="x_content">
<div>
	
		<div class="row">
	<div class="form-group">
			<div class="col-xs-6">
				<label>ID BOP IPS</label>
				<input readonly type="text" class="form-control"  value="<?php echo $data['no_bop'] ; ?>"  >
			</div>
			<div class="col-xs-6">
				<label>Tanggal IPS</label>
				<input type="text" class="form-control"  value="<?php echo $data['tgl_bop'] ; ?>"readonly >
			</div>
	
			<!-- <div class="col-xs-4">
				<label>Bulan</label>
				<input type="text" class="form-control"  value="<?php echo $data['bulan'] ; ?>"readonly >
			</div>
			<div class="col-xs-4">
				<label>Tahun</label>
				<input type="text" class="form-control"  value="<?php echo $data['tahun'] ; ?>" readonly> 
			</div> -->
			</div>
	</div>



	<div class="row">
	<div class="form-group">
			<div class="col-xs-6">
				<div class="form-group">

		<form method="POST" action="<?php echo site_url().'/c_masterdata/edit_bop'; ?>">
			<input readonly type="hidden" class="form-control" name="no_bop" value="<?php echo $data['no_bop'] ; ?>"  >
			  <label>Nama Jenis BOP IPS</label>
			    <select name = "no_jbop" class = "form-control">
			    <option value="#" disabled selected>Pilih Jenis BOP</option>
				<?php
				
					foreach($jenis_bop as $data){
						
						echo "<option value = ".$data['no_jbop'].">".$data['nama_jbop']."</option>";
					}
				?>
			  </select>
			  
			  <?php echo form_error('no_jbop'); ?>
			
			</div>
		</div>
		
	
			<div class="col-xs-6">
				<div class="form-group">
			  <label>Harga Var</label>
			  <input type = "text" name = "harga" class = "form-control">
			  
			  <?php echo form_error('harga'); ?>
			
			</div>
			</div>
			<!-- <div class="col-xs-4">
				<label>Tahun</label>
				<input type="text" class="form-control" name="harga" value="<?php echo $data['tahun'] ; ?>" readonly> 
			</div> -->
			</div>
	</div>
	<div class="form-group">
		<center>
		<a href = "<?php echo site_url()."/c_masterdata/lihat_bop"?>" class="btn btn-default" role="button">Kembali</a>
<input type="submit" name="submit" class="btn btn-primary" value="Simpan">
</form>
</center>
</div>

	
		<hr>
<br>
		<div class="row" >
			
	<div class="col-md-12" >
		<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>Nama BOP IPS</th>
				<!-- <th>Harga (bulanan)</th> -->
				<th>Harga</th>
				<th>Aksi</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
				foreach($result as $data){
					echo "
							<tr>
							<td>".$data['nama_jbop']."</td>
							<td align='right'>".format_rp($data['harga'])."</td>
							" ?>
							<td>
							<!-- 
							
							<td>".format_rp(ROUND($data['harga']/$data['hari']))." (".$data['hari']." hari)</td>
							<a href="isi_edit_bop/<?php echo $data['no_bop']; ?>"><span class="fa-stack">
							  <i class="fa fa-square fa-stack-2x" style="color:orange"></i>
							  <i class="fa fa-edit fa-stack-1x fa-inverse"></i>
							</span></a> -->
							<!-- <a class="btn btn-warning" href="hapus_bop/<?php echo $data['no_bop'];?>/<?php echo $data['nama_bop'];?>" onclick="return confirm('Yakin mau dihapus?')" class="btn btn-daner">Hapus</a> -->
							<a class="btn btn-warning" onclick="return confirm('Apakah Anda Yakin Menghapus Data Ini?')" href="<?php echo site_url()."/c_masterdata/hapus_bop/".$data['no_bop']."/".$data['no_jbop']; ?>" >Hapus</a>
					</td>

						</tr>
						
					<?php
					$no++;
				}
			?>
			</tbody>

		</table>
		
	</form>
	</div>

	<!-- 
		<a href="lihat_bop" class="btn btn-default">Back</a>
		<input type="button" class="btn btn-default" value="Back" onClick=history.go(-1);> -->
	</div>
	</div>
	
</body>
</html>