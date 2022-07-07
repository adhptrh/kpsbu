<div class="row">
<div class="col-sm-12">
        <div class="x_panel">
            <div class="x_content">
                <form action="<?= base_url('Laporan/neraca_saldo')?>" method="post">
                    <div class="form-group row">
                        <label for="periode" class="col-sm-1">Periode</label>
                        <div class="col-sm-2">
                            <select name="bulan" id="bulan" class="form-control" required>
                            <option value="">-</option>
                            <option value="01">Januari</option>
                            <option value="02">Februari</option>
                            <option value="03">Maret</option>
                            <option value="04">April</option>
                            <option value="05">Mei</option>
                            <option value="06">Juni</option>
                            <option value="07">Juli</option>
                            <option value="08">Agustus</option>
                            <option value="09">September</option>
                            <option value="10">Oktober</option>
                            <option value="11">November</option>
                            <option value="12">Desember</option>
                            </select>
                        </div>
                        <div class="col-sm-1">
                            <select name="tahun" id="tahun" class="form-control" required>
                                <option value="">-</option>
                                <?php for ($i=2020; $i <= 2025; $i++) { ?>
                                    <option value="<?= $i ?>"><?= $i ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="col-sm-2">
                            <button class="btn btn-primary" type="submit">Filter</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>
                <div class="header" style="padding-bottom: 10px;">
                    <h3 class="text-center">Neraca Saldo KPSBU</h3>
                    <h5 class="text-center">Periode <?= $periode ?></h5>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="text-center">Nomor Akun</th>
                                <th class="text-center">Nama Akun</th>
                                <th class="text-center">Debit</th>
                                <th class="text-center">Kredit</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            $jumlah_debit = 0;
                            $jumlah_kredit = 0;
                            foreach ($list as $key => $value) { ?>
                            <?php 
                            if ($value->saldo_normal =='d') {
                                $jumlah_debit += $value->nominal;
                            } else {
                                $jumlah_kredit += $value->nominal;
                            }
                            ?>
                            <tr>
                                <td><?= $value->no_coa?></td>
                                <td><?= $value->nama_coa?></td>
                                <?php if ($value->saldo_normal == 'd') { ?>
                                <td class="text-right"><?= format_rp($value->nominal)?></td>
                                <td class="text-right"></td>
                                <?php } else { ?>
                                <td class="text-right"></td>
                                <td class="text-right"><?= format_rp($value->nominal)?></td>
                                <?php } ?>
                            </tr>
                            <?php } ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th colspan="2" class="text-center">Jumlah Akhir</th>
                                <th class="text-right"><?= format_rp($jumlah_debit) ?></th>
                                <th class="text-right"><?= format_rp($jumlah_kredit) ?></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>