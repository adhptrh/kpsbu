<html>

<div class="x_panel">
	<div class="x_title">
		<h3 class="panel-title"><b>Daftar COA</b></h3>
	</div>
	<div class="x_content">

		<a href="<?php echo site_url() . "/c_masterdata/form_coa" ?>" class="btn btn-info" role="button"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>
		<table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
			<thead>
				<tr class="headings">
					<th>No COA</th>
					<th>Nama COA</th>
					<th>Saldo Awal</th>
					<th>Aksi</th>
				</tr>
			</thead>

			<tbody>
				<?php
				$no = 1;
				foreach ($result as $data) :
					echo "<tr>";
					echo "<td>" .  $data['no_coa'] . "</td>";
					echo "<td>" . $data['nama_coa'] . "</td>";
					echo "<td class=text-right>" . format_rp($data['saldo_awal']) . "</td>";
					echo "<td class=text-center>";
				?>
					<a href='<?php echo site_url('c_masterdata/edit_form_coa/' . $data['no_coa']) ?>' class="btn btn-warning btn-sm">Edit</a>
				<?php
					echo "</td>";
					echo "</tr>";
					$no++;
				endforeach;
				?>
			</tbody>
		</table>


		</body>

</html>