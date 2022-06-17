<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_content">
                <div class="row">
                    <div class="col-sm-1">
                        <label for="">Filter Periode</label>
                    </div>
                    <div class="col-sm-3">
                        <select name="" id="" class="form-control" required>
                            <option value="">-</option>
                            <?php for ($i=2021; $i <= 2025 ; $i++) { ?>
                            <option value="<?= $i ?>"><?= $i ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="col-sm-1">
                        <button class="btn btn-md btn-default">Filter</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Laporan SHU</h3>
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
                        $penj = $pnj;
                        $hpp = $t_hpp;
                        $laba_kotor = $penj + $hpp;
                        $pend_lain = 0;
                        $t_pnj = $pend_lain + $laba_kotor;
                        $total_beban = 0;
                        $sblm_pajak = 0;
                        $t_pajak = 0;
                        ?>
                        <tr>
                            <th colspan="3">Pendapatan</th>
                        </tr>
                        <tr>
                            <td>Penjualan</td>
                            <td class="text-right"><?= format_rp($penj) ?></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Harga Pokok Penjualan</td>
                            <td class="text-right"><?= format_rp($hpp)?></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>Laba kotor</th>
                            <th class="text-right"><?= format_rp($laba_kotor)?></th>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Pendapatan lain-lain</td>
                            <td class="text-right"><?= format_rp($pend_lain)?></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>Total penjualan</th>
                            <td></td>
                            <th class="text-right"><?= format_rp($t_pnj)?></th>
                        </tr>
                        <tr>
                            <th colspan="3">Beban Operasional</th>
                        </tr>
                        <?php
                        foreach ($beban as $item) { ?>
                        <?php $total_beban += $item->total ?>
                        <tr>
                            <td><?= $item->nama_coa?></td>
                            <td class="text-right"><?= format_rp($item->total)?></td>
                            <td></td>
                        </tr>
                        <?php } ?>
                        <tr>
                            <th>Total beban operasional</th>
                            <td></td>
                            <th class="text-right"><?= format_rp($total_beban) ?></th>
                        </tr>
                        <tr>
                            <th>SHU sebelum pajak</th>
                            <td></td>
                            <th class="text-right"><?= format_rp($sblm_pajak = $t_pnj - $total_beban) ?></th>
                        </tr>
                        <tr>
                            <th>Pajak (1%)</th>
                            <td></td>
                            <th class="text-right"><?= format_rp($t_pajak = 0.01*($sblm_pajak))?></th>
                        </tr>
                        <tr>
                            <th>SHU setelah pajak</th>
                            <td></td>
                            <th class="text-right"><?= format_rp($sblm_pajak - $t_pajak)?></th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
