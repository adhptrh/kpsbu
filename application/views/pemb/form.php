<html>
	<head>
		<title>Transaksi Pembelian Bahan Baku</title>
	</head>
	<!-- <center><h3><b>Transaksi Pembelian Bahan Baku</h3></b></center>
	<hr> -->

	<body>
	




		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Pembelian Bahan Baku</b></h3>
  </div>
  	 <div class="x_content">
<div>
	<!-- <?php if (isset($error)){ echo "<div class='alert alert-danger'><li>".$error."</li></div>"; }?> -->
<form method = "POST" action = "<?php echo site_url('c_transaksi/tambah_pemb');?>">
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
				<label>Bahan Baku</label>
				<input readonly type="text" class="form-control"  value="Susu Sapi"  >
				<input readonly type="hidden" class="form-control"  value="BB_001" name="no_bb">
			

			</div>
		</div>
			
	
			<div class="col-xs-2">
				<div class="form-group">
				<label>Jumlah (Liter)</label>
				<input type="number" class="form-control" name="jumlah" min="0" placeholder="Masukkan jumlah liter" autocomplete="off">
			  <?php echo form_error('jumlah'); ?>
				</div>
			</div>
			<div class="col-xs-2">
				<div class="form-group">
				<label>Harga</label>
				<input type="number" class="form-control" name="harga" placeholder="Masukkan harga" min="0" autocomplete="off">
			  <?php echo form_error('harga'); ?>
				</div>
			</div>
			
			<div class="col-xs-5">
				<div class="form-group">
				<label>Peternak</label>
					<select name = "no_peternak" class = "form-control">
					<option value="#" disabled selected>Pilih Peternak</option>
						<?php				
						foreach($peternak as $data){				
						echo "<option value = ".$data['no_peternak'].">".$data['no_peternak']." - ".$data['nama_peternak']."</option>";
					} ?>
					</select>
			  <?php echo form_error('no_peternak'); ?>
					
				</div>
			</div>
			
	</div>
	</div>
<hr>
	<center>
		<!-- <?php if($cek_jml_pmb != '150000'){?> -->
	<button type="submit" class="btn btn-dark">Tambah Pembelian</button>
<!-- <?php }else{?>
	<a href="#" class="btn btn-dark" disabled="disabled">Tambah Pembelian</a>
		<?php }?> -->
</form>
	<!-- AND $cek_jml_pmb == 150000-->
		<a class="btn btn-info" role="button" <?php if($cek_selesai > '0' ){?> href = "<?php echo site_url()."/c_transaksi/selesai_pemb/$id/$total"?>" <?php }else{?> disabled="disabled" <?php } ?>>Selesai Pembelian</a>
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
				<th>Nama Bahan</th>
				<th>ID - Nama Peternak</th>
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
							<td>".$data['nama_bb']."</td>
							<td>".$data['no_peternak']." - ".$data['nama_peternak']."</td>
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