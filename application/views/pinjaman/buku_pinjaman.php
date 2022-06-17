<html>

<body>
    <div class="x_panel">
        <div class="x_title">
            <h3 class="panel-title"><b>Buku Pembantu Pinjaman</b></h3>
        </div>

        <div class="x_content">
            <div class="row">
                <div class="col-sm-7">
                    <form method="post" action="<?php echo site_url() . 'c_transaksi/buku_pinjaman' ?> " class="form-inline">
                        <label>Pilih anggota</label>
                        <select name="id_peternak" class="form-control">
                            <option value="#">Pilih anggota</option>
                            <?php foreach ($peternak as $data) { ?>
                                <option value="<?= $data->no_peternak ?>"><?= $data->nama_peternak ?></option>
                            <?php } ?>
                        </select>&nbsp&nbsp
                        <input type="submit" value="Filter" class="btn btn-info">
                    </form>
                </div>
            </div>
            <hr>
            <center>
            <h3>KPSBU</h3>
            <h3>Buku Pembantu Pinjaman</h3>
            <?php if ($list != null) { ?>
                <h3>Per <?= date('d-m-Y'); ?><br><?= $nama_anggota ?></h3>
            <?php } ?>
            <center>
            <hr>
            <table class="table table-striped table-bordered table-hover jambo_table">
                <thead>
                    <tr>
                        <th rowspan="2" class="text-center">Waktu Bayar</th>
                        <th rowspan="2" class="text-center">Keterangan</th>
                        <th colspan="2" class="text-center">Mutasi</th>
                        <th colspan="2" class="text-center">Saldo</th>
                    </tr>
                    <tr>
                        <th class="text-center">Debit</th>
                        <th class="text-center">Kredit</th>
                        <th class="text-center">Debit</th>
                        <th class="text-center">Kredit</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $saldo = 0;
                    foreach ($list as $key => $value) { ?>
                        <tr>
                            <td><?= $value->waktu_bayar ?></td>
                            <td><?= $value->nama_coa ?></td>

                            <?php if ($value->nama_coa == 'Kas') { ?>
                                <td class="text-right"><?= format_rp($value->nominal) ?></td>
                                <td></td>
                            <?php } else { ?>
                                <td></td>
                                <td class="text-right"><?= format_rp($value->nominal) ?></td>
                            <?php } ?>

                            <!-- hitung saldo -->

                            <?php if ($value->nama_coa == 'Kas') { ?>
                                <?php $saldo += $value->nominal ?>
                            <?php } else { ?>
                                <?php $saldo -= $value->nominal ?></td>
                            <?php } ?>

                            <?php if ($value->nama_coa == 'Kas') { ?>
                                <td class="text-right"><?= format_rp($saldo) ?></td>
                                <td></td>
                            <?php } else { ?>
                                <td class="text-right"><?= format_rp($saldo) ?></td>
                                <td></td>
                            <?php } ?>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>