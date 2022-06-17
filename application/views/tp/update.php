<html>
<head></head>

<body>

		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Target Produksi</b></h3>
  </div>
  	 <div class="x_content">
<div>
	
	<?php if (isset($error)){ echo "<div class='alert alert-danger'><li>".$error."</li></div>"; }?>
		<div class="row">
	<div class="form-group">
			<div class="col-xs-3">
				<div class="form-group">
				<label>ID Target Produksi</label>
				<input readonly type="text" class="form-control"  value="<?php echo $data['no_tp'] ; ?>"  >
			</div>
		</div>
		
	
			<div class="col-xs-3">
				<div class="form-group">
				<label>Tanggal Target Produksi</label>
				<input type="text" class="form-control"  value="<?php echo $data['tgl_tp'] ; ?>"readonly >
				</div>
			</div>

				<div class="col-xs-3">
				<div class="form-group">
				<label>Bahan Baku</label>
				<input readonly type="text" class="form-control"  value="Susu Sapi"  >
			</div>
		</div>
		
	
			<div class="col-xs-3">
				<div class="form-group">
				<label>Jumlah</label>
				<input type="text" class="form-control"  value="<?php echo number($jumlah) ; ?> liter <?php if($status == 0){?> (Sisa <?php echo number($jumlah - $cek)?> liter) <?php }?>"readonly >
				</div>
			</div>
			
			</div>
	</div>
	
		<div class="row">
			<?php 
	if($status == '0'){
		?>
			<form method="POST" action="<?php echo site_url().'/c_transaksi/edit_tp'; ?>">
			<input readonly type="hidden" class="form-control" name="no_tp" value="<?php echo $data['no_tp'] ; ?>"  >
			<input readonly type="hidden" class="form-control" name="produksi" value="<?php echo $jumlah ; ?>"  >
	<div class="form-group">
			<div class="col-xs-6">
				<div class="form-group">
			  <label>Nama Produk</label>
			    <select name = "no_produk" class = "form-control">
			    <option value="#" disabled selected>Pilih Produk</option>
				<?php
				
					foreach($result as $data){
					
						echo "<option value = ".$data['no_produk'].">".$data['nama_produk']." - (".$data['satuan'].")</option>";
					}
				?>
			  </select>
			  
			  <?php echo form_error('no_produk'); ?>
			
			</div>
		</div>
		
	
			<div class="col-xs-6">
				<div class="form-group">
			  <label>Jumlah</label>
			  <input type = "text" name = "jumlah" class = "form-control" >
			  
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
	<a href = "<?php echo site_url()."/c_transaksi/lihat_tp"?>" class="btn btn-default" role="button">Kembali</a>
	<?php if($cek < $jumlah){?>
<input type="submit" name="submit" class="btn btn-primary" value="Simpan">
	<?php }else{?>
		<a href="#" class="btn btn-primary" disabled="disabled" role="button">Simpan</a>
	<?php } ?>
</center>

	</form>
		<hr>
<?php 
} 
?>
	
</div>

<br>
</div>
</div>
</div>

<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Detail Target Produksi</b></h3>
  </div>
  	 <div class="x_content">
<div>
		<div class="row" >

	<div class="col-md-12" >
		<div class="form-group">
			<label>Produk</label>

		<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>Nama Produk</th>
				<th>Jumlah</th>
				<th>Satuan</th>
				<?php if($status == '0'){ ?>
				<th>Aksi</th>
			<?php } ?>
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
				foreach($result1 as $data){
					
					echo "
							<tr>
							<td>".$data['nama_produk']."</td>
							<td align='right'>".number($data['jumlah'])."</td>
						
							
							<td>".$data['satuan']."</td>"; ?>
								<?php if($data['status'] == '0'){?>
							<td>
							
							<a class="btn btn-warning" onclick="return confirm('Apakah Anda Yakin Menghapus Data Ini?')" href="<?php echo site_url()."/c_transaksi/hapus_tp/".$data['no_tp']."/".$data['no_produk']; ?>" >Hapus</a>
					</td>
				<?php } ?>

						</tr>
						
					<?php
					$no++;
				}
			?>
			</tbody>

		</table>
		
	</div>
</div>
	</div>


	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
			<label>Bill Of Materials</label>

			<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>Nama Bahan</th>
				<th>Jenis Bahan </th>
				<th>Jumlah</th>
				<th>Satuan</th>
				
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
				foreach($result2 as $data){
					
					echo "
							<tr>
							<td>".$data['nama_bb']."</td>"; ?>
							<?php 
							$nama = substr($data['no_bbp'],0,2);
							if($nama == 'BB'){ echo "
							<td>Bahan Baku</td> ";
						}elseif($nama == 'BP'){
							echo "<td>Bahan Penolong</td>";
						}
						echo "

							<td align='right'>".number($data['jumlah_bom'])."</td>
							
							<td>".$data['satuan']."</td>"; ?>
								

						</tr>
						
					<?php
					$no++;
				}
			?>
			</tbody>

		</table>
	</div>
		</div>
	</div>


	<?php if($status == '0'){ ?>
	<center>
		<?php if($cek == $jumlah){?>
		<a href = "<?php echo site_url()."/c_transaksi/selesai_tp/$id"?>" class="btn btn-info" role="button">Selesai</a>
	</center>
<?php }else{ ?>
		<a href = "#" class="btn btn-info" disabled="disabled" role="button">Selesai</a>

<?php } 	
		}else{ ?>

	<a href = "<?php echo site_url()."/c_transaksi/lihat_tp"?>" class="btn btn-default" role="button">Kembali</a>
<?php } ?>
	</div>
	

</body>
</html>