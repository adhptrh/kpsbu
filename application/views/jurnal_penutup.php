<html>

<body>
	<!-- 	
	<center><h3><b>Jurnal</b></h3></center>
	<hr> -->
	<div class="x_panel">
		<div class="x_title">
			<h3 class="panel-title"><b>Daftar Jurnal</b></h3>
		</div>
		<div class="x_content">
			<div class="row">
				<div class="col-sm-7">
					<form method="post" action="<?php echo site_url() . '/c_keuangan/view_jurnal' ?> " class="form-inline">

						<label>Tanggal Awal :</label>
						<input type="date" name="tgl_awal" class="form-control" required="">

						<label>Tanggal Akhir :</label>
						<input type="date" name="tgl_akhir" class="form-control" required="">&nbsp&nbsp

						<input type="submit" value="filter" class="btn btn-info">
					</form>
				</div>
				<hr>
			</div>

			<p>
				<center><b>
						<div style="font-size: 25px">
							KPSBU Lembang</div>
						<div style="font-size: 20px">Jurnal Penutup</div>
						<?php if (isset($awal, $akhir)) { ?>
							<div style="font-size: 15px">
								Periode <?php echo $awal ?> s/d <?php echo $akhir;
															} ?>
							</div>
					</b>
				</center>
			</p>

			<table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
				<thead>
					<tr class="headings">
						<th width="40">No</th>
						<th>Tanggal</th>
						<th>Keterangan</th>
						<th width="80">Kode Akun</th>
						<th>Ref</th>
						<th>Debit</th>
						<th>Kredit</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$no = 0;
					foreach ($jurnalpenutup as $k=>$v) { 
						if ($v["tanggal"] != null) {
							$no++;
						}
						;?> 
					<tr>
						<td><span <?= ($v["tanggal"] == null) ? 'style="color:#ffffff00;"':'' ?>><?= $no ?></span></td>
						<td><?= ($v["tanggal"] == null) ? "":$v["tanggal"] ?></td>
						<td><?= ($v["kredit"] == null) ? "":"&nbsp&nbsp&nbsp&nbsp" ?> <?= $v["keterangan"] ?></td>
						<td><?= $v["no_coa"] ?></td>
						<td>-</td>
						<td><?= ($v["debit"] == null) ? "":format_rp($v["debit"]) ?></td>
						<td><?= ($v["kredit"] == null) ? "":format_rp($v["kredit"]) ?></td>
					</tr>
					<?php } ?>
					<tr>
						<td><span style="color:#ffffff00;"><?= $no++ ?></span></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td><span style="color:#ffffff00;"><?= $no++ ?></span></td>
						<td>Total</td>
						<td></td>
						<td></td>
						<td></td>
						<td><?= format_rp($totaldebit) ?></td>
						<td><?= format_rp($totalkredit) ?></td>
					</tr>
				</tbody>

			</table>


</body>

</html>