<html>
<head></head>

<body>

		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><center><b>Detail BOM</b></center></h3>
  </div>
  	 <div class="x_content">
<div>
	
		<div class="row">
	<div class="form-group">
			<div class="col-xs-6">
				<div class="form-group">
				<label>ID Produk</label>
				<input readonly type="text" class="form-control" name="no_bom" value="<?php echo $data['no_produk'] ; ?>"  >
			</div>
		</div>
			
	
			<div class="col-xs-6">
				<div class="form-group">
				<label>Nama Produk</label>
				<input type="text" class="form-control" name="bulan" value="<?php echo $data['nama_produk'] ; ?>"readonly >
				</div>
			</div>
			<!-- <div class="col-xs-4">
				<label>Tahun</label>
				<input type="text" class="form-control" name="harga" value="<?php echo $data['tahun'] ; ?>" readonly> 
			</div> -->
			</div>
	</div>
		<div class="row">
	<div class="form-group">
			<div class="col-xs-6">
				<div class="form-group">

		<form method="POST" action="<?php echo site_url().'/c_masterdata/edit_bom'; ?>">
			<input readonly type="hidden" class="form-control" name="no_produk" value="<?php echo $data['no_produk'] ; ?>"  >
			  <label>Nama Bahan Baku / Penolong</label>
			    <select name = "no_bbp" class = "form-control">
			    <option value="#" disabled selected>Pilih Bahan Baku / Penolong</option>
				<?php
				
					foreach($result as $data){
						$cek = substr($data['no_bbp'],0,2);
						if($cek == 'BB'){
							$jenis = 'Bahan Baku';
						}else{
							$jenis = 'Bahan Penolong';
						}
						echo "<option value = ".$data['no_bbp'].">".$jenis." - ".$data['nama_bbp']." - ".$data['satuan']."</option>";
					}
				?>
			  </select>
			  
			  <?php echo form_error('no_bbp'); ?>
			
			</div>
		</div>
		
	
			<div class="col-xs-6">
				<div class="form-group">
			  <label>Jumlah</label>
			  <input type = "text" name = "jumlah" class = "form-control">
			  
			  <?php echo form_error('jumlah'); ?>
			
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
	<a href = "<?php echo site_url()."/c_masterdata/lihat_bom"?>" class="btn btn-default" role="button">Kembali</a>
<input type="submit" name="submit" class="btn btn-primary" value="Simpan">
</center>
</div>

	</form>
		<hr>
<br>
		<div class="row" >

	</div>
	<div class="col-md-12" >
		<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>Nama Bahan</th>
				<th>Jenis Bahan</th>
				<th>Jumlah</th>
				<th>Satuan</th>
				<th>Aksi</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
				foreach($result1 as $data){
					$cek = substr($data['no_bbp'],0,2);
						if($cek == 'BB'){
							$jenis = 'Baku';
						}elseif($cek == 'BP'){
							$jenis = 'Penolong';
						}else{
							$jenis = 'Produk Dalam Proses';
						}
					echo "
							<tr>
							<td>".$data['nama_bbp']."</td>
							<td>".$jenis."</td>
							<td  align='right'>".$data['jumlah']."</td>
							<td>".$data['satuan']."</td>
							" ?>
							<td>
							<!-- <a href="isi_edit_BOM/<?php echo $data['no_BOM']; ?>"><span class="fa-stack">
							  <i class="fa fa-square fa-stack-2x" style="color:orange"></i>
							  <i class="fa fa-edit fa-stack-1x fa-inverse"></i>
							</span></a> -->
							<!-- <a class="btn btn-warning" href="hapus_BOM/<?php echo $data['no_BOM'];?>/<?php echo $data['nama_BOM'];?>" onclick="return confirm('Yakin mau dihapus?')" class="btn btn-daner">Hapus</a> -->
							<a class="btn btn-warning" onclick="return confirm('Apakah Anda Yakin Menghapus Data Ini?')" href="<?php echo site_url()."/c_masterdata/hapus_bom/".$data['no_produk']."/".$data['no_bbp']; ?>" >Hapus</a>
					</td>

						</tr>
						
					<?php
					$no++;
				}
			?>
			</tbody>

		</table>
		
	</div>

	<!-- 
		<a href="lihat_BOM" class="btn btn-default">Back</a>
		<input type="button" class="btn btn-default" value="Back" onClick=history.go(-1);> -->
	</div>
	</div>
	
</body>
</html>