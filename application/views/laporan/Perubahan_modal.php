<html>

<body>
	<!-- 	
	<center><h3><b>Jurnal</b></h3></center>
	<hr> -->
	<div class="x_panel">
		<div class="x_title">
			<h3 class="panel-title"><b>Perubahan Modal</b></h3>
		</div>
		<div class="x_content">


			<div class="row">
				<div class="col-sm-7">
					<form method="get" class="form-inline">
						<span>Periode</span>
						<select name="tahun" class="form-control">
							<?php for ($i = 2020; $i <= date("Y"); $i++) { ?>
								<option value="<?= $i ?>" <?php if ($i == $tahun) echo "selected"; ?>><?= $i ?></option>
							<?php } ?>
						</select>
						<input type="submit" value="filter" class="btn btn-info">
					</form>
				</div>
			</div>

			<br>
			<center>
				<b>
					<div style="font-size: 25px">KPSBU Lembang</div>
					<div style="font-size: 20px">Laporan Perubahan Modal</div>
					<?php if (isset($tahun)) { ?>
						<div style="font-size: 15px">
							Periode <?php echo $tahun ?>
						</div><?php
							} ?>
				</b>
			</center>
			<br>

			<table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
				<thead>
				</thead>
				<tbody>
					<tr>
						<td>Modal Awal</td>
						<td></td>
						<td><?= format_rp($modalAwal) ?></td>
					</tr>
					<tr>
						<td>SHU Dibagikan</td>
						<td><?= format_rp($shudibagikan) ?></td>
						<td></td>
					</tr>
					<tr>
						<td>Laba Ditahan</td>
						<td><?= format_rp($labaditahan) ?></td>
						<td></td>
					</tr>
					<tr>
						<td>Total</td>
						<td></td>
						<td><?= format_rp($total) ?></td>
					</tr>
					<tr>
						<td>Modal Akhir</td>
						<td></td>
						<td><?= format_rp($modalakhir) ?></td>
					</tr>
				</tbody>

			</table>


</body>

</html>