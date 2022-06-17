<div class="x_panel">
	<div class="x_title">
		<h3 class="panel-title"><b>Daftar Buku Besar</b></h3>
	</div>
	<div class="x_content">

		<body>
			<div class="row">
				<div class="col-sm">
					<form class='form-inline' method="get" class="form-inline" action="<?php echo site_url() . '/c_keuangan/view_bukubesar'; ?>">

						<label>Nama Akun </label>
						<select name="no_coa" class="form-control" required>
							<option value="">Pilih Akun</option>
							<?php foreach ($coa as $key => $value) { ?>
								<option value="<?= $value->no_coa ?>"><?= $value->nama_coa ?></option>
							<?php } ?>
						</select>
						&nbsp&nbsp&nbsp&nbsp
						<label>Pilih Tahun :</label>
						<input type="month" class="form-control" name="bulan" required>
						&nbsp&nbsp&nbsp&nbsp
						<button class="btn btn-info btn-md" type="submit">Filter</button>
					</form>
				</div>
				<hr>

				<p>
					<center><b>
							<div style="font-size: 25px">KPSBU</div>
							<div style="font-size: 20px">Laporan Buku Besar </div>
							<div style="font-size: 15px">Periode <?= bulan($date)  ?> <?= $year ?></div>
						</b></center>
				</p>
				<p class="pr-3" style="text-align:left;padding-left: 15px;">
					Nomor Akun : <?= $id_akun ?>
					<span class="pr-3" style="float:right;padding-right: 15px;">
						Nama Akun : <?= $nm_akun ?>
					</span>
				</p>

				<hr>
				<!-- <table id="datatable" class="table table-striped table-bordered table-hover jambo_table"> -->
				<table class="table table-striped table-bordered table-hover jambo_table">
					<thead>
						<tr>
							<th rowspan="2">Tanggal</th>
							<th rowspan="2">Nama Akun</th>
							
							<th rowspan="2">Reff</th>
							<th rowspan="2" class="text-center">Debet</th>
							<th rowspan="2" class="text-center">Kredit</th>
							<th colspan="2" class="text-center">Saldo </th>
						</tr>
						<tr>
							<th class="text-center">Debet</th>
							<th class="text-center">Kredit</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>-</td>
							<td style="background-color: #eee">Saldo Awal</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							
							
							<?php
							if ($posisi_saldo_normal== 'd') {
								echo "<td style='background-color: #eee' class='text-right'>  " . format_rp($saldo_awal) . "</td>";
								echo "<td>-</td>";
								$saldo_debet = $saldo_awal;
								$saldo_kredit = 0;
							} else {
								echo "<td>-</td>";
								echo "<td style='background-color: #eee' class='text-right'>  " . format_rp($saldo_awal) . "</td>";
								$saldo_debet = 0;
								$saldo_kredit = $saldo_awal;
							}
							?>

						</tr>
						<?php
						//echo $saldo_debet."-".$saldo_kredit."<br>";
						foreach ($buku_besar as $cacah) :
							echo "<tr>";
							echo "<td>" . $cacah['tgl_jurnal'] . "</td>";
							echo "<td>" . $cacah['nama_coa'] . "</td>";
						//	echo "<td>" . $cacah['no_coa'] . "</td>";
                            echo "<td>-</td>";
						//	echo "<td>" . $cacah['id_jurnal'] . "</td>";

							//untuk posisi d c dari jurnal adalah debet / d
							if (strcmp($cacah['posisi_dr_cr'], 'd') == 0) {
								// if ($saldo_debet >= $cacah['nominal']) {
								echo "<td class='text-right'> " . format_rp($cacah['nominal']);
								echo "<td>-</td>";

								//jika posisi saldo normal ada di debet, maka di tambah dan ditampilkan ke posisi debet
								if (strcmp($posisi_saldo_normal, 'd') == 0) {
									// if ($saldo_debet >= $cacah['nominal'])
									$saldo_debet = $saldo_debet  + $cacah['nominal'];
									echo "<td class='text-right'>  " . format_rp($saldo_debet) . "</td>";
									echo "<td class='text-right'>  " . format_rp($saldo_kredit) . "</td>";
								} else {
									$saldo_kredit = $saldo_kredit  - $cacah['nominal'];
									echo "<td class='text-right'>  " . format_rp($saldo_debet) . "</td>";
									echo "<td class='text-right'>  " . format_rp($saldo_kredit) . "</td>";
								}
							} else {
								//jika posisi d c dari jurnal adalah kredit / c
								echo "<td>-</td>";
								echo "<td class='text-right'> " . format_rp($cacah['nominal']) . "</td>";

								if (strcmp($posisi_saldo_normal, 'd') == 0) {
									$saldo_debet = $saldo_debet  - $cacah['nominal'];
									echo "<td class='text-right'> " . format_rp($saldo_debet) . "</td>";
									echo "<td class='text-right'> " . format_rp($saldo_kredit) . "</td>";
								} else {
									$saldo_kredit = $saldo_kredit  + $cacah['nominal'];
									echo "<td class='text-right'>  " . format_rp($saldo_debet) . "</td>";
									echo "<td class='text-right'>  " . format_rp($saldo_kredit) . "</td>";
								}
							}
							echo "</tr>";
						endforeach;
						if (strcmp($posisi_saldo_normal, 'd') == 0) {
							$saldo_akhir = $saldo_debet - $saldo_kredit;
						} else {
							$saldo_akhir = $saldo_kredit - $saldo_debet;
						}
						?>
						<tr>
							<td>-</td>
							<td style='background-color: #eee'>Saldo Akhir</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							

							<?php
							if ($posisi_saldo_normal=='d') {
								echo "<td style='background-color: #eee' class='text-right'>  " . format_rp($saldo_akhir) . "</td>";
								echo "<td style='background-color: ' >-</td>";
							} else {
								echo "<td style='background-color: #black' >-</td>";
								echo "<td style='background-color: #eee' class='text-right'>  " . format_rp($saldo_akhir) . "</td>";
							}
							?>
							
						</tr>
					</tbody>
				</table>
		</body>
	</div>