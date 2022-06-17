<html>
	<body>
		<div class="x_panel">
			<div class="x_title">
				<h3 class="panel-title"><b>Kartu Penyusutan Aset</b></h3>
			</div>
			<div class="x_content">
				<div class="row">
					<div class="col-sm-7">
						<form method="post" action="<?php echo site_url().'c_transaksi/kartu_aset' ?> " class="form-inline">
                            <label>Pilih Aset</label>
                            &nbsp&nbsp&nbsp&nbsp
							<select name="aset" class="form-control" required>
								<option value="#" >Pilih Aset</option>
								<?php foreach ($aset as $data ) { ?>
								<option value="<?= $data->id_detail_aset?>"><?= $data->aset?> - <b><?= $data->id_detail_aset?></b></option>
								<?php } ?>
							</select>
							<input type="submit" value="Filter" class="btn btn-info">
						</form>
					</div>
				</div>
				<hr>
				<center>
					<h3>Kartu Penyusutan Aset</h3>
					<h2><?= $nm_aset ?></h2>
				</center>
				<hr>
				<table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
					<thead>
						<tr class="headings">
							<th>ID Transaksi</th>
							<th>Tanggal Transaksi</th>
							<th>Nilai Penyusutan</th>
							<th>Total Penyusutan</th>
							<th>Nilai Buku</th>
							<th>Tarif Revaluasi</th>
							<th>Nilai Buku Perbaikan</th>
							<th>Nilai Buku Baru</th>
						</tr>
					</thead>
					<tbody>
                    <?php foreach ($list as $key => $value) { ?>
                        <tr>
                            <td><?= $value->id_trans?></td>
                            <td><?= date('d F Y', strtotime($value->tgl_trans))?></td>
                            <td><?= penyusutan($value->total_peny)?></td>
                            <td><?= penyusutan($value->total_akum)?></td>
                            <td><?= penyusutan($value->nilai_peny)?></td>
                            <td class="text-right"><?= penyusutan($value->tarif_rev)?></td>
                            <td><?= penyusutan($value->nilai_bk_perbaikan)?></td>
                            <td><?= penyusutan($value->nilai_bk_baru)?></td>
                        </tr>
                    <?php } ?>
                    </tbody>
				</table>
			</div>
		</div>
	</body>
</html>