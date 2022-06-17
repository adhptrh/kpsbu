<html>
	<body>
		<div class="x_panel">
			<div class="x_title">
				<h3 class="panel-title"><b>Konfirmasi Truck</b></h3>
			</div>
	  	 		
	 		<div class="x_content">

		 		<div class="table-responsive">
					<table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
						<thead>
							<tr class="headings">
								<th style="width: 5%;">No</th>
								<th>Tanggal Pengajuan</th>
								<th>Truck</th>
								<th>ID Detail Truck</th>
								<th class="text-center" style="width: 15%;">Status</th>
								<th class="text-center" style="width: 15%;">Tanggal Konfirmasi</th>
							</tr>
						</thead>
						<tbody>
                        <?php 
                        $no = 1; 
                        foreach ($list as $key => $value) { ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= date('d F Y', strtotime($value->tgl_pengajuan))?></td>
                                <td><?= $value->nama_aset?></td>
                                <td><?= $value->id_detail_truck?></td>
                                <!-- <td class="text-center"><?= $value->status == 0 ? '<a href="" onclick="return confirm("Yakin ingin konfirmasi?")" class="btn btn-warning">Menunggu konfirmasi</a>' : '<button class="btn btn-success">Sukses</button>'; ?></td> -->
                                <td class="text-center">
                                    <?php if ($value->status == 0) { ?>
                                        <a href="<?= base_url('c_transaksi/update_confirm_truck/'.$value->kd_pembelian)?>" class="btn btn-warning" onclick="return confirm('Yakin untuk konfirmasi?')">Menunggu konfirmasi</a>
                                    <?php } else { ?>
                                        <button class="btn btn-success">Sukses</button>
                                    <?php } ?>
                                </td>
                                <!-- <td><?= date('d F Y', strtotime(is_null($value->tgl_confirm) == '' ? '-' : $value->tgl_confirm))?></td> -->
                                <td class="text-center">
                                    <?php if (is_null($value->tgl_confirm)) { ?>
                                        -
                                    <?php } else { ?>
                                        <?= date('d F Y', strtotime($value->tgl_confirm)) ?>
                                    <?php } ?>
                                </td>
                            </tr>
                        <?php } ?>
						</tbody>
					</table>
				</div>
	 		</div>
	 	</div>
	</body>
</html>