<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Laporan Kehadiran</h3>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <!-- <a href="#add" data-toggle="modal" class="btn pull-right btn-primary">Tambah Data</a> -->
                        </h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>
                
                <form class="form-inline" method="get">
                <label>Tgl Awal</label>
                <input type="month" style="margin-right:10px;" class="form-control" name="tgl_awal" value="<?= $tgl_awal  ?>">
                <label>Tgl Akhir</label>
                <input type="month" style="margin-right:10px;" class="form-control" name="tgl_akhir" value="<?= $tgl_akhir  ?>">
                    <button class="btn btn-primary">Filter</button>
                </form>
                <br>
                <div class="">
                <br>
        <center>
				<b>
					<div style="font-size: 25px">KPSBU Lembang</div>
					<div style="font-size: 20px">Kehadiran</div>
					<?php if (isset($tgl_awal, $tgl_akhir)) { ?>
						<div style="font-size: 15px">
							Periode <?php echo $tgl_awal ?> s/d <?php echo $tgl_akhir;
															?>
						</div><?php
							} ?>
				</b>
			</center>
            <br><br>
                    <table class="table table-stripped " id="datatable-buttons">
                        <thead>
                            <tr>
                                <th style="width: 5%;">No</th>
                                <th>Tanggal</th>
                                <th>Jam</th>
                                <th>Nama Pegawai</th>
                                <th>No. RFID</th>
                                <th class="text-center">Keterangan</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php 
                        $no = 1; 
                        foreach ($list as $key => $value) { 
                            if ($this->session->userdata("level") == "pegawai" && $this->session->userdata("nama_lengkap") != $value->nama ) continue;
                            ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= date('d-m-Y', strtotime($value->tanggal)) ?></td>
                                <td><?= $value->jam ?></td>
                                <td><?= $value->nama ?></td>
                                <td><?= $value->rfid ?></td>
                                <td class="text-center">
                                    <?= $value->keterangan == 'Presensi Keluar' ? '<button class="btn btn-sm btn-default">'.$value->keterangan.'</button>' : '<button class="btn btn-sm btn-primary">'.$value->keterangan.'</button>';  ?>
                                </td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('#datatable').dataTable({
            "pageLength" : 25
        })
    })
</script>