<html>
	<body>
		<div class="x_panel">
			<div class="x_title">
				<h3 class="panel-title"><b>Detail Penyusutan</b></h3>
			</div>
			<div class="x_content">
				<div class="" role="tabpanel" data-example-id="togglable-tabs">

                    <h4>ID Penyusutan &nbsp;&nbsp;&nbsp;: <b><?= $id ?></b></h4>
                    <h4>ID Detail Aset &nbsp;&nbsp;&nbsp;&nbsp; : <b><?= $header->id_detail_aset?></b></h4>
                    <h4>Nama Aset &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <b><?= $header->aset?></b></h4>

					<table class="table table-striped table-bordered table-hover jambo_table">
						<thead>
							<tr class="headings">
								<th>ID Transaksi</th>
								<th>Bulan Penyusutan</th>
								<th>Jenis Transaksi</th>
								<th>Nilai Penyusutan</th>
								<th>Nilai Akumulasi Penyusutan</th>
								<!-- <th>Nilai Revaluasi</th> -->
								<th>Nilai Buku</th>
							</tr>
						</thead>
						<tbody>
                            <tr>
                                <td colspan="5"></td>
                                <td class="text-right"><?= penyusutan($nilai_buku) ?></td>
                            </tr>
							<?php
                            foreach ($list as $key => $value) { ?>
                            <?php 
                            $jenis = substr($value->id_penyusutan, 0, 3) == 'PNY' ? 'Penyusutan' : 'Revaluasi';
                            $detail_id = $value->id_penyusutan == $id ? '<b> '.$value->id_penyusutan.' </b>' : ' '.$value->id_penyusutan.' ';
                            ?>
                            <tr>
                                <td><?= $detail_id ?></td>
                                <td><?= $value->bulan_penyusutan ?></td>
                                <td><?= $jenis ?></td>
                                <td class="text-right"><?= penyusutan($value->total_penyusutan) ?></td>
                                <td class="text-right"><?= penyusutan($value->akumulasi_peny) ?></td>
                                <!-- <td class="text-right"><?= penyusutan($value->akumulasi_peny) ?></td> -->
                                <td class="text-right"><?= penyusutan($value->nilai_akhir) ?></td>
                            </tr>
                            <?php } ?>
						</tbody> 
					</table>
                    <a href="<?= base_url('c_transaksi/penyusutan')?>" class="btn btn-default">Kembali</a>
				</div>
			</div>
		</div>
	</body>
</html>