<html>

	<head>
		<title>Transaksi Penjualan Toko</title>
	</head>
	<!-- <center><h3><b>Transaksi Penjualan Toko</h3></b></center>
	<hr> -->
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Form Penjualan Toko</b></h3>
  </div>
  	 <div class="x_content">
  	 	
	<body>
		<form method = "POST" action = "<?php echo site_url('c_transaksi/tambah_penjt');?>">
			<div class="form-group">
			  <label>No Transaksi</label>
			  <input type = "text" name = "no_trans" class = "form-control" value = "<?php echo $id;?>" readonly>
			</div>
			<div class="form-group">
			  <label>Tgl Transaksi</label>
			  <input type = "text" class = "form-control"  value = "<?php echo date('Y-m-d');?>" readonly>
			  <!-- <input type = "text" class = "form-control"  id="startdate"> -->
			</div>
				
			<div class="form-group">
			  <label>Produk</label>
			  <select name = "no_produk" class = "form-control">
			    <option value="#" disabled selected>Pilih Nama Produk</option>
				<?php
					foreach($barang as $data){
						echo "<option value = ".$data['no_produk'].">".$data['nama_produk']." - ".number($data['stok'])." ".$data['satuan']." @".format_rp($data['harga_jual'])."</option>";
					}
				?>
			  </select>
			  <?php echo form_error('no_produk'); ?>
			  
			</div>
		
			<div class="form-group">
			  <label>Jumlah</label>
			  <input type = "text" name = "jumlah" class = "form-control">
			  <?php echo form_error('jumlah'); ?>
			</div>
			
			<button type="submit" class="btn btn-success">Tambah</button>
		</form>
		<hr>
			<div class="form-group" >
			  <label>Total Transaksi</label>
			  <input readonly type = "text" class = "form-control" value = "<?php echo format_rp($total);?>">
			</div>
		<hr>

		<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>Nama Produk</th>
				<th>Jumlah</th>
				<th>Harga</th>
				<th>Satuan</th>
				<th>Subtotal</th>
			</tr>
		</thead>
		<tbody>
<?php
				foreach($detail as $data){
					echo "
						<tr>
							<td>".$data['nama_produk']."</td>
							<td align = 'right'>".number($data['jumlah'])."</td>
							<td align = 'right'>".format_rp($data['harga'])."</td>
							<td align = 'left'>".$data['satuan']."</td>
							<td align = 'right'>".format_rp($data['harga']*$data['jumlah'])."</td>
						</tr>
					";
				}
			?>
		</tbody>
			
		</table>
	
		<a <?php if($detail == TRUE){?>href = "<?php echo site_url()."/c_transaksi/selesai_penjt/$id/$total"?>" <?php }else{ ?> disabled="disabled" <?php } ?> class="btn btn-info" role="button">Selesai Belanja</a>
			<a href = "<?php echo site_url()."/c_transaksi/lihat_penjt"?>" type="button" class="btn btn-default">Kembali</a>
		</form>
	</body>
</html>
