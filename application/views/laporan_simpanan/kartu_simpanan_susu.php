<html>
	<body>
		<div class="x_panel">
 <div class="x_title">
    <h3 class="panel-title"><b>Laporan Setoran Susu Anggota</b></h3>
  </div>
  	 <div class="x_content">
		<?php if ($this->session->userdata("level") != "anggota") { ?>
			<div class="row">
				<div class="col-sm-7">
					<form method="post" action="<?php echo site_url().'simpanan/laporan_setoran_anggota' ?> " class="form-inline">
					 <label>Pilih anggota</label>
					 <select name="id_peternak" class="form-control">
						 <option value="#" >Pilih anggota</option>
						 <?php foreach ($peternak as $data ) { ?>
						 <option value="<?= $data->no_peternak?>"><?= $data->nama_peternak?></option>
						 <?php } ?>
					 </select>&nbsp&nbsp
					 <input type="submit" value="Filter" class="btn btn-info">
				 </form>
			 </div>
			 <hr>
		 </div>
		<?php } ?>
		<hr>
		<center>
			<h3>Laporan Setoran Susu Anggota</h3>
		</center>
	<hr>
	<table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
		<thead>
			<tr class="headings">
				<th style="width:2px">No</th>
				<th>No transaksi</th>
				<th>Tanggal</th>
				<th>Anggota</th>
				<th>Jumlah susu</th>
				<th>Harga susu</th>
				<th>Total pendapatan susu</th>
			</tr>
		</thead>
		<tbody>
			<!-- $total = 0; -->
			<?php 
			$no = 1; 
			foreach ($detail as $data) { ?>
			<tr>
				<td><?= $no++ ?></td>
				<td><?= $data->no_trans ?></td>
				<td><?= $data->tgl_trans ?></td>
				<td><?= $data->nama_peternak ?></td>
				<td class="text-right"><?= $data->jumlah ?> liter</td>
				<td align='right'><?= format_rp($data->harga) ?></td>
				<td align='right'><?= format_rp($data->subtotal) ?></td>
			</tr>
				<!-- <td><?= $total += $data->subtotal ?></td> -->
			<?php } ?>
			<!-- $total += $data->subtotal; -->
		</tbody>
		<tr>
			<td colspan="6" align='left'>Subtotal</td>
			<?php if (empty($total)) {
				$total = 0;
			} else {
				$total = $total ;
			} ?>
			<td align='right'><?= format_rp($total) ?></td>
		</tr>
	
	</table>

	
	</body>
	</html>