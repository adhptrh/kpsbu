<html>
	<head>
		<title>Transaksi Pembelian Bahan Penolong</title>
	</head>
	<!-- <center><h3><b>Transaksi Pembelian Bahan Penolong</h3></b></center>
	<hr> -->

	<body>
	




		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Pembelian Bahan Penolong</b></h3>
  </div>
  	 <div class="x_content">
<div>
	<!-- <?php if (isset($error)){ echo "<div class='alert alert-danger'><li>".$error."</li></div>"; }?> -->
<form method = "POST" action = "<?php echo site_url('c_transaksi/tambah_pembp');?>">
		<div class="row">
	<div class="form-group">
			<div class="col-xs-6">
				<div class="form-group">
				<label>ID Transaksi</label>
				<input readonly type="text" class="form-control"  value="<?php echo $id ; ?>"  name ="no_trans">
			</div>
		</div>
		
	
			<div class="col-xs-6">
				<div class="form-group">
				<label>Tanggal Transaksi</label>
				<input type="text" class="form-control"  value="<?php echo date('Y-m-d') ; ?>"readonly >
				</div>
			</div>
			
			</div>
	</div>
	<div class="row">
	<div class="form-group">
			<div class="col-xs-3">
				<div class="form-group">
				<label>Bahan Penolong</label>
				<select name = "no_bp" class = "form-control">
							    <option value="#" disabled selected>Pilih Bahan Penolong</option>
								<?php				
								foreach($bp as $data){				
								echo "<option value = ".$data['no_bp'].">".$data['nama_bp']." (".$data['satuan'].")</option>";
															}
								?>
						</select>
			<?php echo form_error('no_bp'); ?>

			</div>
		</div>
			
	
			<div class="col-xs-3">
				<div class="form-group">
				<label>Jumlah</label>
				<input type="number" class="form-control" name="jumlah" >
			  <?php echo form_error('jumlah'); ?>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
				<label>Harga</label>
				<input type="number" class="form-control" name="harga" >
			  <?php echo form_error('harga'); ?>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="form-group">
				<label>Supplier</label>
				<select name = "no_supp_bp" class = "form-control">
							    <option value="#" disabled selected>Pilih Supplier</option>
								<?php				
								foreach($supp as $data){				
								echo "<option value = ".$data['no_supp_bp'].">".$data['no_supp_bp']." - ".$data['nama_supp_bp']."</option>";
															}
								?>
						</select>
			<?php echo form_error('no_supp_bp'); ?>

			</div>
		</div>
		
			
	</div>
	</div>
<hr>
	<center>
		
	<button type="submit" class="btn btn-dark">Tambah Pembelian</button>

</form>

		<a class="btn btn-info" role="button" <?php if($detail == TRUE){?> href = "<?php echo site_url()."/c_transaksi/selesai_pembp/$id/$total"?>" <?php }else {?>disabled="disabled" <?php } ?>>Selesai Pembelian</a>
	</center>


	<hr>
			<div class="form-group" >
			  <label>Total Transaksi</label>
			  <input readonly type = "text" class = "form-control" value = "<?php echo format_rp($total);?>">
			</div>
		<hr>

		<div class="row" >

	<div class="col-md-12" >
		<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>Nama Bahan Penolong</th>
				<th>Supplier</th>
				<th>Jumlah</th>
				<th>Harga</th>
				<th>Subtotal</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
			$total = 0;
				foreach($detail as $data){
					
					echo "
							<tr>
							<td>".$data['nama_bp']."</td>
							<td>".$data['no_supp_bp']." - ".$data['nama_supp_bp']."</td>
							<td>".number($data['jumlah'])." ".$data['satuan']."</td>
							<td align='right'>".format_rp($data['harga'])."</td>
						
							
							<td align='right'>".format_rp($data['harga']*$data['jumlah'])."</td>"; ?>
							

						</tr>
						
					<?php
					$subtotal = $data['harga'] * $data['jumlah'];
					$total=$total+$subtotal;
					$no++;
				}
			?>
			<tr>
				<td colspan="4" align="center">Total</td>
				<td align="right"><?php echo format_rp($total) ?></td>
			</tr>
			</tbody>

		</table>
		
	</div>
	</div>
	</div>
</div>

	</body>
</html>