<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_content">
                <div class="">
                    <form class="form-inline" action="<?= base_url("Penggajian/laporan_penggajian")?>" method="get">
                        
                            <label>Tgl Awal</label>
                <input type="month" style="margin-right:10px;" class="form-control" name="tgl_awal" value="<?= $tgl_awal  ?>">
                <label>Tgl Akhir</label>
                <input type="month" style="margin-right:10px;" class="form-control" name="tgl_akhir" value="<?= $tgl_akhir  ?>">
                <button class="btn btn-primary">Filter</button>
                           
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Laporan Penggajian</h3>
                        
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                        </h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>
                <br>
        <center>
				<b>
					<div style="font-size: 25px">KPSBU Lembang</div>
					<div style="font-size: 20px">Jurnal</div>
					<?php if (isset($tgl_awal, $tgl_akhir)) { ?>
						<div style="font-size: 15px">
							Periode <?php echo $tgl_awal ?> s/d <?php echo $tgl_akhir;
															?>
						</div><?php
							} ?>
				</b>
			</center>
            <br><br>
                <div class="table-responsive">
                    <table class="table table-bordered" id="datatable-buttons">
                        <thead>
                            <tr>
                                <th style="width: 4%;">#</th>
                                <th>Tanggal</th>
                                <th>Nama Pegawai</th>
                                <th>Gaji Pokok</th>
                                <th>Tunjangan Jabatan</th>
                                <th>Tunjangan Kesehatan</th>
                                <th>Tunjangan Hari Raya</th>
                                <th>Bonus Kerja</th>
                                <th>PTKP</th>
                                <th>PPH 21</th>
                                <th>Gaji Bersih</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php 
                        $no = 1;
                        foreach ($list as $key => $value) { ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <!-- <td><?= $value->id_penggajian ?></td> -->
                                <td><?= $value->tanggal ?></td>
                                <td><?= $value->nm_pegawai ?></td>
                                <td class="text-right"><?= format_rp($value->gaji_pokok) ?></td>
                                <td class="text-right"><?= format_rp($value->tunjangan_jabatan) ?></td>
                                <td class="text-right"><?= format_rp($value->tunjangan_kesehatan) ?></td>
                                <td class="text-right"><?= format_rp($value->tunjangan_hari_raya) ?></td>
                                <td class="text-right"><?= format_rp($value->bonus_kerja) ?></td>
                                <td class="text-right"><?= format_rp($value->ptkp) ?></td>
                                <td class="text-right"><?= format_rp($value->pph21) ?></td>
                                <td class="text-right"><?= format_rp($value->total) ?></td>
                            </tr>
                        <?php }?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
