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
			</div>

			<br>
				<center>
					<b>
						<div style="font-size: 25px">KPSBU Lembang</div>
						<div style="font-size: 20px">Jurnal</div>
						<?php if (isset($awal, $akhir)) { ?>
							<div style="font-size: 15px">
								Periode <?php echo $awal ?> s/d <?php echo $akhir;
								?> 
								</div><?php
															} ?>
					</b>
				</center>

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
					$total = 0;
					$total2 = 0;
					foreach ($jurnal as $data) {
						$no++;
						$tgl_jurnal = substr($data['tgl_jurnal'], 0, 10);
						if ($data['posisi_dr_cr'] == 'd') {
							echo "<tr>
						<td class=text-center>$no</td>
						<td>" . $tgl_jurnal . "</td>";
						} else {
							echo "<tr>
						<td class=text-center>$no</td>
								<td></td>";
						}
						if ($data['posisi_dr_cr'] == 'd') {
							echo "
						<td>" . $data['nama_coa'] . "</td>
						<td class=text-center>" . $data['no_coa'] . "</td>
						<td class=text-center>-</td>
						<td align = 'right'>" . format_rp($data['nominal']) . "</td>
						<td align = 'right'></td>";
							$total = $total + $data['nominal'];
						} else {
							echo "
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"  . $data['nama_coa'] . "</td>
						<td class=text-center>" . $data['no_coa'] . "</td>
						<td class=text-center>-</td>
						<td align = 'right'></td>
						<td align = 'right'>" . format_rp($data['nominal']) . "</td>
					</tr>
					
				";
							$total2 = $total2 + $data['nominal'];
						}
					}
					?>
				</tbody>
				<tr>
					<td colspan="5" align='center'>Total</td>
					<td align="right"><?php echo format_rp($total); ?></td>
					<td align="right"><?php echo format_rp($total2); ?></td>
				</tr>

			</table>
		</div>
				</div>

				<div class="x_panel">
		<div class="x_title">
			<h3 class="panel-title"><b>HPP dan Persediaan Barang Harga Beli</b></h3>
		</div>
		<div class="x_content">

		</div>
				</div>

</body>

</html>