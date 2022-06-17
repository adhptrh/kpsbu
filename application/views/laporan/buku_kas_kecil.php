<html>
	<body>
		<div class="x_panel">
			<div class="x_title">
				<h3 class="panel-title"><b>Buku Kas Kacil</b></h3>
			</div>
			<div class="x_content">
				<center>
					<h3>Buku Kas Kecil</h3>
				</center>
				<hr>
				<table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
					<thead>
						<tr class="headings">
							<th>#</th>
							<th>Tanggal Transaksi</th>
							<th>ID Ref</th>
							<th>Keterangan</th>
							<th>Debet</th>
							<th>Kredit</th>
							<th>Saldo</th>
						</tr>
					</thead>
					<tbody>
                        <?php 
                        $no = 1;
                        $saldo = 0;
                        foreach ($list as $key => $value) { ?>
                        <?php
                            if ($value->posisi_d_c == 'd') {
                                $saldo += $value->nominal;
                            } else {
                                $saldo -= $value->nominal;
                            }
                        ?>
                        <tr>
                            <td><?= $no++ ?></td>
                            <td><?= $value->tgl_transaksi ?></td>
                            <td><?= $value->id_ref ?></td>
                            <td><?= $value->keterangan ?></td>
                            <?php if ($value->posisi_d_c == 'd') { ?>
                                <td class="text-right"><?= format_rp($value->nominal) ?></td>
                                <td></td>
                            <?php } else { ?>
                                <td></td>
                                <td class="text-right"><?= format_rp($value->nominal) ?></td>
                            <?php } ?>
                            <td class="text-right"><?= format_rp($saldo) ?></td>
                        </tr>
                        <?php } ?>
                    </tbody>
				</table>
			</div>
		</div>
	</body>
</html>