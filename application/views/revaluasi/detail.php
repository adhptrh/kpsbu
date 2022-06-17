<html>
	<body>
		<div class="x_panel">
			<div class="x_title">
				<h3 class="panel-title"><b>Detail Revaluasi</b></h3>
			</div>
			<div class="x_content">
				<div class="" role="tabpanel" data-example-id="togglable-tabs">

                    <h4>ID Revaluasi &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <b><?= $id ?></b></h4>
                    <h4>ID Detail Aset &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : <b><?= $header->id_detail_aset?></b></h4>
                    <h4>Nama Aset &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <b><?= $header->aset?></b></h4>

					<table class="table table-striped table-bordered table-hover jambo_table">
						<thead>
							<tr class="headings">
								<th>ID Transaksi</th>
								<th>Tanggal Transaksi</th>
								<th>Tarif Peny. Revaluasi</th>
								<th>Nilai Buku Perbaikan</th>
								<th>Nilai Buku Baru</th>
							</tr>
						</thead>
						<tbody>
							<?php
                            foreach ($list_rev as $key => $value) { ?>
                            <?php 
                            $jenis = substr($value->id_revaluasi, 0, 3) == 'PNY' ? 'Penyusutan' : 'Revaluasi';
                            $detail_id = $value->id_revaluasi == $id ? '<b> '.$value->id_revaluasi.' </b>' : ' '.$value->id_revaluasi.' ';
                            ?>
                            <tr>
                                <td><?= $detail_id ?></td>
                                <td><?= date('d F Y', strtotime($value->tgl_input)) ?></td>
                                <td class="text-right"><?= penyusutan($value->tarif_revaluasi) ?></td>
                                <td class="text-right"><?= penyusutan($value->nilai_buku_perbaikan) ?></td>
                                <td class="text-right"><?= penyusutan($value->nilai_buku_baru) ?></td>
                            </tr>
                            <?php } ?>
						</tbody> 
					</table>
                    <a href="<?= base_url('c_transaksi/revaluasi')?>" class="btn btn-default">Kembali</a>
				</div>
			</div>
		</div>
	</body>
</html>