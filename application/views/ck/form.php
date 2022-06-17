<html>
	<head>
		<title>Transaksi Cek Kualitas</title>
	</head>
	<!-- <center><h3><b>Transaksi Cek Kualitas</h3></b></center>
	<hr> -->
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Form Cek Kualitas</b></h3>
  </div>
  	 <div class="x_content">
  	 	
	<body>
		<?php if (isset($error)){ echo "<div class='alert alert-danger'><li>".$error."</li></div>"; }?>
	<form method = "POST" action = "<?php echo site_url('c_transaksi/tambah_ck');?>">
		<div class="row">
	<div class="form-group">
			<div class="col-xs-6">
				<div class="form-group">
				<label>ID Pengecekan</label>
				<input readonly type="text" class="form-control"  value="<?php echo $id ; ?>"  name ="no_trans">
			</div>
		</div>
		
	
			<div class="col-xs-6">
				<div class="form-group">
				<label>Tanggal Pengecekan</label>
				<input type="text" class="form-control"  value="<?php echo date('Y-m-d') ; ?>"readonly >
				</div>
			</div>
			
			</div>
	</div>
	<div class="row">
	<div class="form-group">
			<div class="col-xs-4">
				<div class="form-group">
				<label>Bahan Baku</label>
				<input type="text" class="form-control" value="Susu Sapi" readonly="" >
				</div>
			</div>
			<div class="col-xs-4">
				<div class="form-group">
				<label>ID Pembelian Bahan Baku</label>
				<select name = "pbb" class = "form-control">
							    <option value="#" disabled selected>Pilih Peternak</option>
								<?php				
								foreach($pbb as $data){				
								echo "<option value = ".$data['no_trans'].">".$data['no_trans']." - ".number($data['jumlah'])." liter</option>";
															}
								?>
						</select>
			
 				<?php echo form_error('pbb'); ?>
			</div>
		</div>
			
	
			<div class="col-xs-4">
				<div class="form-group">
				<label>Lulus Uji Lab</label>
				<input type="number" class="form-control" name="lulus" >
			  <?php echo form_error('lulus'); ?>
				</div>
			</div>
			
			
		
			
	</div>
	</div>
	<center>
	
	<button type="submit" class="btn btn-dark" <?php if($cek_lulus >= 140000){?> disabled="disabled" <?php }?>>Tambah</button>

</form>
	
		<a class="btn btn-info" role="button" <?php if($cek_lulus >= 140000){?> href = "<?php echo site_url()."/c_transaksi/selesai_ck/$id"?>" <?php }else{ ?> disabled="disabled" <?php }?>>Selesai Pengecekan</a>
	</center>
<hr>


	<div class="col-md-12" >
		<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>ID Pembelian Bahan Baku</th>
				<th>Lulus</th>
				<th>Gagal</th>
				<th>Total</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no=1;
			$total = 0;
			$lulus = 0;
			$gagal = 0;
				foreach($detail as $data){
					
					echo "
							<tr>
							<td>".$data['no_trans_pmb']."</td>
							<td>".number($data['lulus'])."</td>
							<td>".number($data['gagal'])."</td>	
							<td class=\"text-right\">".number($data['total'])."</td>"; ?>
							

						</tr>
						
					<?php
				
					$lulus=$lulus+$data['lulus'];
					$gagal=$gagal+$data['gagal'];
					$total=$total+$data['total'];
					$no++;
				}
			?>
			<tr>
				<td align="center">Total</td>
				<td ><?php echo number($lulus) ;?></td>
				<td ><?php echo number($gagal) ;?></td>
				<td ><?php echo number($total) ;?></td>
			</tr>
			</tbody>

		</table>
		
	</div>
	</body>
</html>