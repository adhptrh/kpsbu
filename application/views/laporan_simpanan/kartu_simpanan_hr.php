<html>

<body>
	<div class="x_panel">
		<div class="x_title">
			<h3 class="panel-title"><b>Kartu Simpanan Hari Raya</b></h3>
		</div>
		<div class="x_content">
			<div class="row">
				<div class="col-sm-7">
					<form method="post" action="<?php echo site_url() . 'simpanan/kartu_simpanan_hr' ?> " class="form-inline">

						<label>Pilih anggota</label>
						<select name="id_peternak" class="form-control">
							<option value="#">Pilih anggota</option>
							<?php foreach ($peternak as $data) { ?>
								<option value="<?= $data->no_peternak ?>"><?= $data->nama_peternak ?></option>
							<?php } ?>
						</select>&nbsp&nbsp
						<input type="submit" value="Filter" class="btn btn-info">
					</form>
				</div>
			</div>
			<hr>
			<center>
				<h3>KPSBU</h3>
				<h3>Kartu Simpanan Hari Raya</h3>
				<?php if ($detail != null) { ?>
					<h3>S/d <?= date('d-m-Y'); ?><br><?= $header ?></h3>
				<?php } ?>
			</center>
			<hr>
			<table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
				<thead>
					<tr class="headings">
						<th style="width:2px">No</th>
						<th>No transaksi</th>
						<th>Tanggal</th>
						<!-- <th>Anggota</th> -->
						<th>Debit</th>
						<th>Kredit</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$no = 1;
					foreach ($detail as $data) { ?>
						<tr>
							<td><?= $no++ ?></td>
							<td><?= $data->kode_simpanan_hr ?></td>
							<td><?= $data->tgl_simpanan ?></td>
							<!-- <td><?= $data->nama_peternak ?></td> -->
							<td class="text-right"><?= format_rp(0) ?></td>
							<td align='right'><?= format_rp($data->nominal) ?></td>
						</tr>
					<?php } ?>
				</tbody>
				<tr>
					<td colspan="3">Subtotal</td>
					<td class="text-right"><?= format_rp(0) ?></td>
					<td align="right"><?= format_rp($total) ? format_rp($total) : format_rp(0) ?></td>
				</tr>
			</table>


</body>

</html>