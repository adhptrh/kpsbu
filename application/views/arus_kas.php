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
                <form class="form-inline" style="margin-bottom:20px;" method="GET">
                    <div class="form-group">
                        <label>Bulan Tahun</label>
                        <input name="bulantahun" class="form-control" type="month" value="<?= $bulantahun ?>">
                        <button class="btn btn-primary">Filter</button>
                    </div>
                </form>

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
                            <th>#</th>
                            <th>Masuk</th>
                            <th>Keluar</th>
                        </tr>
                        <tr>
                            <th colspan="3">Arus Kas dari Aktivitas Operasi</th>
                        </tr>
                        <tr>
                            <td>Kas yang diterima</td>
                            <td class="text-right"><?= format_rp($kas) ?></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Kas Bank</td>
                            <td class="text-right"><?= format_rp($kasbank)?></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Kas Kecil</td>
                            <td class="text-right"><?= format_rp($kaskecil)?></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Pembelian</td>
                            <td></td>
                            <td class="text-right"><?= format_rp($pembelian)?></td>
                        </tr>
                        <tr>
                            <td>Pengeluaran Beban</td>
                            <td></td>
                            <td class="text-right"><?= format_rp($pembelian)?></td>
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
                            <th class="text-right">
                                <?php if ($kas > $pembelian || $kas - $pembelian == 0) {
                                    echo format_rp($arus_kas_bersih_keg_operasional = $sebelum_beban - $t_beban + $kaskecil + $kasbank);
                                } ?>
                            </td>
                            <th class="text-right">
                                <?php if ($kas < $pembelian) {
                                    echo format_rp($arus_kas_bersih_keg_operasional = $sebelum_beban - $t_beban + $kaskecil + $kasbank);
                                } ?>
                            </th>
                        </tr>
                        <tr>
                            <th colspan="3">Arus kas dari aktivitas investasi</th>
                        </tr>

                        <tr>
                            <td>Penjualan aktiva tetap</td>
                            <td class="text-right"><?= format_rp(0)?></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Pembelian aktiva tetap</td>
                            <td></td>
                            <td class="text-right"><?= format_rp($pmb_aktiva)?></td>
                        </tr>
                        
                        <tr>
                            <th>Arus kas bersih dari kegiatan Investasi</th>
                            <th class="text-right">
                                <?php if (0 > $pmb_aktiva || 0 - $pmb_aktiva == 0) {
                                    echo format_rp($arus_kas_bersih_keg_investasi = $arus_kas_bersih_keg_operasional + 0 - $pmb_aktiva);
                                } ?>
                            </td>
                            <th class="text-right">
                                <?php if ($kas < $pembelian) {
                                    echo format_rp($arus_kas_bersih_keg_investasi = $arus_kas_bersih_keg_operasional + 0 - $pmb_aktiva);
                                } ?>
                            </th>
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
                            <td></td>
                            <td class="text-right"><?= format_rp($prive)?></td>
                        </tr>
                        <tr>
                            <td>Pinjaman Bank</td>
                            <td class="text-right"><?= format_rp(0)?></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Angsuran Pinjaman</td>
                            <td></td>
                            <td class="text-right"><?= format_rp(0)?></td>
                        </tr>
                        
                        <tr>
                            <th>Arus kas bersih dari kegiatan Pendanaan</th>
                            <th class="text-right">
                                <?php if ($modal+0 >= $prive+0 || $modal+0 - $prive+0 == 0) {
                                    echo format_rp($arus_kas_bersih_keg_pendanaan = $arus_kas_bersih_keg_investasi+$modal-$prive+0-0);
                                } ?>
                            </td>
                            <th class="text-right">
                                <?php if ($modal+0 < $prive+0) {
                                    echo format_rp($arus_kas_bersih_keg_pendanaan = $arus_kas_bersih_keg_investasi+$modal-$prive+0-0);
                                } ?>
                            </th>
                        </tr>
                        <tr>
                            <th>Ending Cash Flow</th>
                            <th class="text-right">
                                <?php if ($modal+0 >= $prive+0 || $modal+0 - $prive+0 == 0) {
                                    echo format_rp($arus_kas_bersih_keg_pendanaan = $arus_kas_bersih_keg_investasi+$modal-$prive+0-0);
                                } ?>
                            </td>
                            <th class="text-right">
                                <?php if ($modal+0 < $prive+0) {
                                    echo format_rp($arus_kas_bersih_keg_pendanaan = $arus_kas_bersih_keg_investasi+$modal-$prive+0-0);
                                } ?>
                            </th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
