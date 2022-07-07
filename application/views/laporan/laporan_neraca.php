<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>
                <div class="header" style="padding-bottom: 10px;">
                    <h4 class="text-center">Laporan Neraca</h4>
                    <h5 class="text-center">Periode </h5>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <tr>
                            <th colspan="2">Aktiva</th>
                            <th colspan="2">Pasiva</th>
                        </tr>
                        <tr>
                            <th colspan="2">Aktiva Lancar</th>
                            <th colspan="2">Kewajiban Lancar</th>
                        </tr>
                        <tr>
                            <td>Kas</td>
                            <td><?= format_rp($kas) ?></td>
                            <td>Utang</td>
                            <td><?= format_rp($utang) ?></td>
                        </tr>
                        <tr>
                            <td>Persediaan Bahan Baku</td>
                            <td><?= format_rp($persediaanbahanbaku) ?></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>Aktifa Tetap</th>
                            <td></td>
                            <th>Modal</th>
                            <td><?= format_rp($modal) ?></td>
                        </tr>
                        <tr>
                            <td>Akumulasi Penyusutan Kendaraan</td>
                            <td><?= format_rp($akumulasipenyusutankendaraan) ?></td>
                            <td>Simpanan Pokok</td>
                            <td><?= format_rp($simpananpokok) ?></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>Simpanan Wajib</td>
                            <td><?= format_rp($simpananwajib) ?></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>Simpanan Masuka</td>
                            <td><?= format_rp($simpananmasuka) ?></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>SHU Ditahan</td>
                            <td><?= format_rp($shuditahan) ?></td>
                        </tr>
                        <tr>
                            <td></td>
                            <th><?= format_rp($total_aktifa) ?></th>
                            <td></td>
                            <th><?= format_rp($total_pasiva) ?></th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>