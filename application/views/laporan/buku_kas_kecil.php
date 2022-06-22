<html>
	<body>
		<div class="x_panel">
			<div class="x_title">
				<h3 class="panel-title"><b>Buku Kas Kacil</b></h3>
			</div>
			<div class="x_content">
                <form class="form-inline" style="margin-bottom:20px;" method="GET">
                    <div class="form-group">
                        <label>Bulan Tahun</label>
                        <input name="bulantahun" class="form-control" type="month" value="<?= $bulantahun ?>">
                        <button class="btn btn-primary">Filter</button>
                    </div>
                </form>
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
							<th>Uraian</th>
							<th>Debet</th>
							<th>Kredit</th>
							<th>Saldo</th>
						</tr>
					</thead>
					<tbody>
                       <!--  <tr>
                            <td>0</td>
                            <td><?= $kaskecil->tgl_jurnal ?></td>
                            <td><?= $kaskecil->id_jurnal ?></td>
                            <td>Pembentukan kas kecil</td>
                            <td class='text-right'><?= format_rp($kaskecil->nominal) ?></td>
                            <td class='text-right'><?= format_rp($kaskecil->nominal) ?></td>
                            <td></td>
                        </tr> -->
                        <?php 
                        $no = 1;
                        $saldo = 0;
                        $jumlahdebit = 0;
                        $jumlahkredit = 0;
                        foreach ($list as $key => $value) { ?>
                        <?php
                            if ($value->posisi_dr_cr == 'd') {
                                $saldo += $value->nominal;
                                $jumlahdebit += $value->nominal;
                            } else {
                                $saldo -= $value->nominal;
                                $jumlahkredit += $value->nominal;
                            }
                        ?>
                        <tr>
                            <td><?= $no++ ?></td>
                            <td><?= $value->tgl_jurnal ?></td>
                            <td><?= $value->id_jurnal ?></td>
                            <td><?= $value->deskripsi ?></td>
                            <?php if ($value->posisi_dr_cr == 'd') { ?>
                                <td class="text-right"><?= format_rp($value->nominal) ?></td>
                                <td></td>
                            <?php } else { ?>
                                <td></td>
                                <td class="text-right"><?= format_rp($value->nominal) ?></td>
                            <?php } ?>
                            <td class="text-right"><?= format_rp($saldo) ?></td>
                        </tr>
                        <?php } ?>
                        <tr>
                            <td colspan="4">Jumlah</td>
                            <td class="text-right"><?= format_rp($jumlahdebit) ?></td>
                            <td class="text-right"><?= format_rp($jumlahkredit) ?></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Terpakai</td>
                            <td colspan="6" class="text-right"><?= format_rp($jumlahkredit) ?></td>
                        </tr>
                        <tr>
                            <td>Saldo</td>
                            <td colspan="6" class="text-right"><?= format_rp($jumlahdebit-$jumlahkredit) ?></td>
                        </tr>
                        <tr>
                            <td>Pengisian Kembali</td>
                            <td colspan="6"class="text-right"><?= format_rp($jumlahkredit) ?></td>
                        </tr>
                    </tbody>
				</table>
			</div>
		</div>
	</body>
</html>