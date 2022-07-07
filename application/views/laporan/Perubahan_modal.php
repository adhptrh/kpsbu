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
			

			<p>
				<center><b>
						<div style="font-size: 25px">
							KPSBU Lembang</div>
						<div style="font-size: 20px">Laporan Perubahan Modal</div>
						<p>Periode per 31 Desember Tahun <?= date("Y") ?></div>
					</b>
				</center>
			</p>

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