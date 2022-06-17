<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Laporan Arus Kas</h3>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <!-- <button class="btn pull-right btn-primary" data-target="#add" data-toggle="modal">Tambah Jadwal Shift</button> -->
                        </h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <?php
                        $kas = $kas_diterima ?? 0;
                        $pembelian = $pmb ?? 0;
                        $sebelum_beban = $kas - $pembelian;
                        $t_beban = 0;
                        $pmb_aktiva = 50000000;
                        $prive = 250000000;
                        $modal = 500000000;
                        $arus_kas_bersih_pendanaan = 0;
                        ?>
                        <tr>
                            <th colspan="3">Arus Kas dari Aktivitas Operasi</th>
                        </tr>
                        <tr>
                            <td>Kas yang diterima</td>
                            <td class="text-right"><?= format_rp($kas) ?></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Pembelian</td>
                            <td class="text-right"><?= format_rp($pembelian)?></td>
                            <td></td>
                        </tr>
                        <?php foreach ($beban as $key => $value) { ?>
                        <?php $t_beban += $value->total?>
                        <tr>
                            <td><?= $value->nama_coa?></td>
                            <td class="text-right"><?= format_rp($value->total)?></td>
                            <td></td>
                        </tr>
                        <?php } ?>
                        <tr>
                            <th>Arus kas bersih dari kegiatan operasional</th>
                            <td></td>
                            <th class="text-right"><?= format_rp($arus_kas_bersih_keg_operasional = $sebelum_beban - $t_beban)?></th>
                        </tr>
                        <tr>
                            <th colspan="3">Arus kas dari aktivitas investasi</th>
                        </tr>
                        <tr>
                            <td>Pembelian aktiva tetap</td>
                            <td class="text-right"><?= format_rp($pmb_aktiva)?></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th colspan="3">Arus kas dari aktivitas pendanaan</th>
                        </tr>
                        <tr>
                            <td>Modal</td>
                            <td class="text-right"><?= format_rp($modal)?></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Prive</td>
                            <td class="text-right"><?= format_rp($prive)?></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>Arus kas bersih dari aktivitas pendanaan</th>
                            <td></td>
                            <th class="text-right"><?= format_rp($arus_kas_bersih_pendanaan = $modal - $prive) ?></th>
                        </tr>
                        <tr>
                            <th>Saldo Kas</th>
                            <td></td>
                            <th class="text-right"><?= format_rp(($arus_kas_bersih_keg_operasional - $pmb_aktiva) + $arus_kas_bersih_pendanaan) ?></th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
