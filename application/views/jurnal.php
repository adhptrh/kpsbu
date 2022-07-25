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
					$no = 1;
					$total = 0;
					$total2 = 0;

					$stack = [];
					$stacks = [];
					$id_jurnal = "";

					foreach ($jurnal as $data) {
						
						if ($id_jurnal != $data["id_jurnal"] ) {
							$id_jurnal = $data["id_jurnal"];
							if (count($stack) > 0) {
								array_push($stacks, $stack);
							}
							$stack = [];
							array_push($stack, $data);
						} elseif (count($stack) == 3)  {
							if (
								$stack[0]["no_coa"] == "1414"  &&
								$stack[1]["no_coa"] == "2130"  &&
								$stack[2]["no_coa"] == "1111" 
								) {
									array_push($stacks, $stack);
									$id_jurnal = "";
									$stack = [];
								}
							array_push($stack, $data);
						} elseif (count($stack) == 5) {
							if (
								$stack[0]["no_coa"] == "1111"  &&
								$stack[1]["no_coa"] == "2140"  &&
								$stack[2]["no_coa"] == "4116"  &&
								$stack[3]["no_coa"] == "6113"  &&
								$stack[4]["no_coa"] == "1414"

								) {
									array_push($stacks, $stack);
									$id_jurnal = "";
									$stack = [];
								}
							array_push($stack, $data);
						} elseif (count($stack) == 2) {
							if (
								$stack[0]["no_coa"] == "5112"  &&
								$stack[1]["no_coa"] == "5311" ||
								$stack[0]["no_coa"] == "5113"  &&
								$stack[1]["no_coa"] == "5312" ||
								$stack[0]["no_coa"] == "5135"  &&
								$stack[1]["no_coa"] == "1113" ||
								$stack[0]["no_coa"] == "1111"  &&
								$stack[1]["no_coa"] == "4111" ||

								$stack[0]["no_coa"] == "5221"  &&
								$stack[1]["no_coa"] == "1111" ||
								$stack[0]["no_coa"] == "5228"  &&
								$stack[1]["no_coa"] == "1111"  ||
								$stack[0]["no_coa"] == "5224"  &&
								$stack[1]["no_coa"] == "1111"   ||
								$stack[0]["no_coa"] == "1111"  &&
								$stack[1]["no_coa"] == "4112" 
								) {
									array_push($stacks, $stack);
									$stack = [];
								}
							array_push($stack, $data);
						} else {
							array_push($stack, $data);
						}
					}
					array_push($stacks, $stack);

					$result = [];

					foreach ($stacks as $data) {
						$id = "";
						foreach ($data as $d) {
							$id .= $d["tgl_jurnal"] . $d["no_coa"] . $d["posisi_dr_cr"];
						}
						$id = md5($id);
						if (!isset($result[$id])) {
							$result[$id]["jumlah_paket"] = 1;
							$result[$id]["data"] = [$data];
							$result[$id]["totaldata"] = $data;
							/* var_dump($data);
							echo "<br>"; */
						} else {
							$result[$id]["jumlah_paket"]++;
							foreach ($data as $k => $d) {
								$result[$id]["totaldata"][$k]["nominal"] += $data[$k]["nominal"];
							}
							echo "<br>";
							array_push($result[$id]["data"], $data);
						}
					}

					foreach ($result as $key=>$data) {
						?>
						<?php
						$databaru = true;
						foreach ($data["totaldata"] as $k=>$v) {
							if ( $v["posisi_dr_cr"] == "d") {
								$total += $v["nominal"];
							} else {
								$total2 += $v["nominal"];
							}
					?>
							<tr>
								<td><p style="<?= ($databaru == false) ? 'display:none':'' ?>"><?= $no ?></p></td>
								<td><?= ($databaru == true) ? $v["tgl_jurnal"]:"" ?></td>
								<td>
									<?= $v["posisi_dr_cr"] == "k" ? "<span style='margin-left:15px;'>":"<span>" ?>
									<?= $v["nama_coa"]."</span>" ?></td>
								<td class="text-right"><?= $v["no_coa"] ?></td>
								<td>-</td>
								<td class="text-right"><?= $v["posisi_dr_cr"] == "d" ? format_rp($v["nominal"]):"-" ?></td>
								<td class="text-right"><?= $v["posisi_dr_cr"] == "k" ? format_rp($v["nominal"]):"-" ?></td>
							</tr>
					<?php
					
							if ($databaru == true) {
								$databaru = false;
								$no++;
							}
						}
					}

					// sistem jurnal lama
					/* foreach ($jurnal as $data) {
						$no++;
						$tgl_jurnal = substr($data['tgl_jurnal'], 0, 10);
						if ($data['posisi_dr_cr'] == 'd') {
							echo "<tr>
						<td class=text-center>$no</td>";
						echo "<td>$tgl_jurnal</td>";
						} else {
							echo "<tr>
						<td class=text-center>$no</td>
						<td></td>
								";
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
					} */
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

</body>

</html>