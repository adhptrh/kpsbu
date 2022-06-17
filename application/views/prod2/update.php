<html>
<head></head>

<body>


<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Detail Produksi Olahan</b></h3>
  </div>
  	 <div class="x_content">
<div>



		<div class="row">
		<div class="form-group">
			<div class="col-xs-3">
				<div class="form-group">
				<label>ID Produksi Olahan</label>
				<input readonly type="text" class="form-control"  value="<?php echo $no_trans ; ?>"  >
			</div>
		</div>

			<div class="col-xs-3">
				<div class="form-group">
				<label>ID Target Produksi</label>
				<input readonly type="text" class="form-control"  value="<?php echo $no_tp ; ?>"  >
			</div>
		</div>
		
	
			<div class="col-xs-2">
				<div class="form-group">
				<label>Tanggal Transaksi</label>
				<input type="text" class="form-control"  value="<?php echo $tgl ; ?>"readonly >
				</div>
			</div>

			<div class="col-xs-2">
				<div class="form-group">
				<label>Produk</label>
				<input readonly type="text" class="form-control"  value="<?php echo $nama_produk; ?>"  >
			</div>
		</div>

			<div class="col-xs-2">
				<div class="form-group">
				<label>Jumlah Produksi</label>
				<input readonly type="text" class="form-control"  value="<?php echo number($jumlah); ?> liter"  >
			</div>
		</div>
			
			</div>
	</div>
		<hr>
	<?php if (isset($error)){ echo "<div class='alert alert-danger'>".$error."</div>"; }?>
<div class="row">
		<div class="col-md-12">
			<div class="form-group">
			<label>Bill Of Materials</label>

			<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>Bahan Baku</th>
				<th>Kebutuhan</th>
				<th>Jumlah</th>
				<th>Satuan</th>
				<th>Harga</th>
				<th>Subtotal</th>
				
			</tr>
		</thead>
		<tbody>
			<tr>
				<?php 
				$pbdp = 0;
				$harga = $bombbb['nominal'] / $jumlah_produksi;
				$pbdp = $harga * $jumlah;
				?>
				<td >Susu Sapi</td>
				<td align='right'>1</td>
				<td align='right'><?php echo number($jumlah);?></td>
				<td>liter</td>
				<td align='right'><?php echo format_rp(round($bombbb['nominal'] / $jumlah_produksi))?></td>
				<td align="right"><?php echo format_rp(round($pbdp)) ?></td>

			</tr>
			<?php
			$no=1;
			$total = 0;
					$subtotal = 0;
				foreach($result2 as $data){
					$pengurang = $data['jumlah_bom'];
            $kode_bahan = $data['no_bbp'];

            if($cek == NULL ){
         $query111 = "SELECT * FROM kartu_stok_bp
               WHERE no_bp = '$kode_bahan' 
               ORDER by no DESC";
         $row = $this->db->query($query111)->row_array();
				          $jumlah2 = $row['unit3'];
				          
				          if(isset($error)){
				          	$subtotal3 = 0;
				          }else{
				          $subtotal3 = ($data['jumlah_bom'] / $row['unit3']) *$row['total3'];
				      		}
				          // var_dump($subtotal3);
				      }else{
				      	 $query111 = "SELECT unit2, total2, no_produk,no_bp 
				      	 				FROM kartu_stok_bp 
				      	 				WHERE no_trans = '$no_trans' AND no_produk = '$no_prod' AND no_bp = '$kode_bahan'
						               ";
			        			 		$row = $this->db->query($query111)->row_array();
							          	$jumlah2 = $row['unit2'];
							          	$subtotal3 = $row['total2'];
				      }
					
					echo "
							<tr>
							<td>".$data['nama_bp']."</td>
							<td align='right'>".number($data['jumlah'])."</td>
							
						

							<td align='right'>".number($data['jumlah_bom'])."</td>
							
							<td>".$data['satuan']."</td>
							<td align='right'>".format_rp($subtotal3 / $data['jumlah_bom'])."</td>
							<td align='right'>".format_rp($subtotal3)."</td>"; ?>
								

						</tr>
						
					<?php
					
					$total = $total + $subtotal3;
					$no++;
				}
				$totalast = $total + $pbdp;
			?>
			<tr>
				<td colspan="5" align="center">Total</td>
				<td align="right"><?php echo format_rp(round($totalast)) ?></td>
			</tr>
			</tbody>

		</table>
	</div>
		</div>
	</div>


	<div class="row" >

	<div class="col-md-12" >
		<hr>
		<h5><b>Biaya Produksi Olahan</b></h5	>
		<table  class="table table-striped table-bordered table-hover jambo_table" >
		 	<thead>
			<tr class="headings">
				<th>Keterangan</th>
				<th>Biaya</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th colspan="2">Biaya Bahan Baku</th>
			</tr>
			<tr>
				<td><?php echo $bombbb['nama_coa']?></td>
				<td align='right'><?php echo format_rp(round($pbdp)) ?></td>
				<?php $bbbb = $pbdp ?>
			</tr>
			<!-- ///////////////////////////////////////////////////////////////////////////////-->
			<tr>
				<th colspan="2">Biaya Tenaga Kerja</th>
			</tr>
			<tr>
				<td>Biaya Tenaga Kerja - @<?php echo format_rp($btk)?></td>
				<td align='right'><?php echo format_rp(($btk) * $jumlah)?> </td>
				<?php $bbtk = $btk * $jumlah; ?>
			</tr>
			<!-- ///////////////////////////////////////////////////////////////////////////////-->
			
			
			
			<!-- ////////////////////////////////////////////////////////////////////////////////////////  -->
			<tr>
				<th colspan="2">Biaya Overhead Pabrik Variabel</th>
			</tr>
			

					<?php

			$no=1;
			$bbop = 0;
				foreach($bop as $data){

					echo "
					<tr>
							<td>".$data['nama_jbop']." - @".format_rp($data['harga'])."</td>
							

							<td align='right'>".format_rp(($data['harga']) * $jumlah)."</td>
							</tr>"; 
							$bbop = $bbop + ($data['harga'] * $jumlah); 
							?>
					<?php
					$no++;
				}
			?>
			
			<tr>
				<td colspan="2">Bahan Penolong</td>
			</tr>
			
					<?php
			$no=1;
			$bbp = 0;
				foreach($result2 as $data){
			$pengurang = $data['jumlah_bom'];
            $kode_bahan = $data['no_bbp'];

         if($cek == NULL ){
         $query111 = "SELECT * FROM kartu_stok_bp
               WHERE no_bp = '$kode_bahan' 
               ORDER by no DESC";
         $row = $this->db->query($query111)->row_array();
         					if(isset($error)){
         						$jumlah2 = 0;
         						$subtotal4 = 0;
         					}else{
         						$jumlah2 = $row['unit3'];
				         		 $subtotal4 = ($data['jumlah_bom'] / $row['unit3']) *$row['total3'];
         					}
				          // var_dump($subtotal3);
				      }else{
				      	 $query111 = "SELECT unit2, total2, no_produk,no_bp 
				      	 				FROM kartu_stok_bp 
				      	 				WHERE no_trans = '$no_trans' AND no_produk = '$no_prod' AND no_bp = '$kode_bahan'
				      	 				
						               ";
			        			 		$row = $this->db->query($query111)->row_array();
							          	$jumlah2 = $row['unit2'];
							          	$subtotal4 = $row['total2'];
    						// echo "<pre>"; print_r($jumlah2); echo "</pre>"; die();

				      }
				     
					
					echo "
					<tr>
							<td>".$data['nama_bp']."</td>
							

							<td align='right'>".format_rp(round($subtotal4))."</td>
						
							</tr>"; 
							$bbp = $bbp + $subtotal4 ?>
							<!-- <td align='right'>".format_rp(round($subtotal/$jumlah))."</td> -->
					<?php
					$no++;
				}
			?>
			<!-- ///////////////////////////////////////////////////////////////////////////////-->
			<?php 
			//total Harga Pokok Produksi
			$biaya_produksi =($bbop)  + ($bbtk) + ($bbp) + ($bbbb);
			$biaya_produksi_satuan = $biaya_produksi / $jumlah; 
			?>
			<tr>
				<th>Biaya Produksi</th>
				<td align='right'><b><?php echo format_rp(round($biaya_produksi))?></b></td>

			</tr>
			<tr>
				<th>Biaya Produksi / Liter</th>

				<td align='right'><b><?php echo format_rp(round($biaya_produksi_satuan)) ?></b></td>
			</tr>

			</tbody>

		</table>
		
	</div>
	</div>


<div class="row">
		<div class="col-md-11">
	<a href = "<?php echo site_url()."/c_transaksi/isi_edit_produksi_ke21/$no_trans"?>" class="btn btn-default" role="button">Kembali</a>
</div>
<div class="col-md-1">
  	 	<div style="align-items: right;">

  	 		<?php 
  	 		if($cek == NULL){
        if($bp1 < $vbp1 OR $bp2 < $vbp2 OR $bp3 < $vbp3 OR $bp4 < $vbp4 OR $bp5 < $vbp5){
        	?>
          <a class='btn btn-dark' role="button" disabled="disabled">Produksi</a>

         <?php   	
        }else{

      
  	 		?>
		<a class="btn btn-dark" role="button" <?php if($cek == NULL){?> href = "<?php echo site_url()."/c_transaksi/selesai_produksi_ke2/$bbbb/$bbtk/$bbop/$bbp/$no_trans/$no_tp/$no_prod/$jumlah "?>" <?php }else{?> hidden <?php } ?>>Produksi</a>
		<?php 
			}
		}
		?>
</div>
</div>

	</div>


</div>
</div>
</div>




</body>
</html>