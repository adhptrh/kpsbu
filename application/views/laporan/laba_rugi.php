<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>
                <div class="header" style="padding-bottom: 10px;">
                    <h4 class="text-center">Laporan Laba Rugi</h4>
                    <h5 class="text-center">Periode </h5>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <?php 
                            $total_pendapatan = 0;
                            $total_hpp = 0;
                            $total_beban = 0;
                            $total_hpp = 0;
                            $laba_kotor = 0;
                        ?>
                        <thead>
                            <?php 
                            foreach ($pendapatan as $item) { ?>
                            <?php $total_pendapatan += $item->nominal ?>
                            <tr>
                                <td><?= $item->nama_coa?></td>
                                <td></td>
                                <td class="text-right"><?= format_rp($item->nominal) ?></td>
                            </tr>
                            <?php } ?>
                            <tr>
                                <td>Harga Pokok Penjualan</td>
                                <td class="text-right"><?= format_rp($hpp[0]->nominal)?></td>
                                <td></td>
                            </tr>
                            <?php $laba_kotor = $total_pendapatan - $hpp[0]->nominal; ?>
                            <tr>
                                <th>Laba Kotor</th>
                                <td></td>
                                <td class="text-right"><?= format_rp($laba_kotor)?></td>
                            </tr>
                            <tr>
                                <th>Beban Usaha</th>
                                <td></td> <!-- DEBIT -->
                                <td></td>
                            </tr>
                            <?php foreach ($beban as $item) { ?>
                            <?php $total_beban += $item->nominal ?>
                            <tr>
                                <td><?= '&nbsp;&nbsp;&nbsp;&nbsp;' . $item->nama_coa?></td>
                                <td class="text-right"><?= format_rp($item->nominal) ?></td>
                                <td></td>
                            </tr>
                            <?php } ?>
                            <tr>
                                <th>Total Beban</th>
                                <td class="text-right"><?= format_rp($total_beban)?></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>Laba Bersih</th>
                                <td></td>
                                <td class="text-right"><?= format_rp($laba_kotor - $total_beban)?></td>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>