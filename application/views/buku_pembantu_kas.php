<html>

<body>
    <div class="x_panel">
        <div class="x_title">
            <h3 class="panel-title"><b>Buku Pembantu Kas</b></h3>
        </div>

        <div class="x_content">
            <div class="row">
                <div class="col-sm-7">
                    <!-- <form method="post" action="<?php echo site_url() . 'c_transaksi/buku_pinjaman' ?> " class="form-inline">
                        <label>Pilih anggota</label>
                        <select name="id_peternak" class="form-control">
                            <option value="#">Pilih anggota</option>
                            <?php foreach ($peternak as $data) { ?>
                                <option value="<?= $data->no_peternak ?>"><?= $data->nama_peternak ?></option>
                            <?php } ?>
                        </select>&nbsp&nbsp
                        <input type="submit" value="Filter" class="btn btn-info">
                    </form> -->
                </div>
            </div>
            <hr>
            <center>
            <h3>KPSBU</h3>
            <h3>Buku Pembantu Kas</h3>
            <!-- <?php if ($list != null) { ?>
                <h3>Per <?= date('d-m-Y'); ?><br><?= $nama_anggota ?></h3>
            <?php } ?> -->
            <center>
            <hr>
            <table class="table table-striped table-bordered table-hover jambo_table">
                <thead>
                    <tr>
                        <th rowspan="2" class="text-center">#</th>
                        <th rowspan="2" class="text-center">Tanggal</th>
                        <th rowspan="2" class="text-center">ID Ref</th>
                        <th rowspan="2" class="text-center">Keterangan</th>
                        <th colspan="2" class="text-center">Mutasi</th>
                        <th rowspan="2" class="text-center">Saldo</th>
                    </tr>
                    <tr>
                        <th class="text-center">Debit</th>
                        <th class="text-center">Kredit</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                    $saldo = 0;
                    $no = 1;
                    foreach ($list as $key => $value) { ?>
                    <tr>
                        <td><?= $no++ ?></td>
                        <td><?= $value->tanggal ?></td>
                        <td><?= $value->id_ref ?></td>
                        <td><?= $value->keterangan ?></td>

                        <?php if ($value->posisi_dr_cr == 'd') { ?>
                            <?php $saldo += $value->nominal ?>
                            <td class="text-right"><?= format_rp($value->nominal)?></td>
                            <td></td>
                        <?php } else { ?>
                            <?php $saldo -= $value->nominal ?>
                            <td></td>
                            <td class="text-right"><?= format_rp($value->nominal)?></td>
                        <?php } ?>
                        
                        <!-- saldo -->
                        <td class="text-right"><?= format_rp($saldo) ?></td>
                    </tr>
                    
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>