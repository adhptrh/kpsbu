<html>

<body>
    <div class="x_panel">
        <div class="x_title">
            <h3 class="panel-title"><b>Laporan Kartu Simpanan </b></h3>
        </div>
        <div class="x_content">
            <div class="row">
                <div class="col-sm-7">
                    <form method="post" action="<?php echo site_url() . 'simpanan/laporan_kartu_simpanan' ?> " class="form-inline">
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
                <h3>Laporan Kartu Simpanan</h3>
                <?php if ($detail != null) { ?>
                    <h3>S/d <?= date('d-m-Y'); ?><br><?= $header ?></h3>
                <?php } ?>
            </center>
            <hr>
            <table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
                <thead>
                    <tr class="headings">
                        <th style="width:2px">No</th>
                        <th>Nama Simpanan</th>
                        <th>Jumlah</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="text-center">1</td>
                        <td>
                            Simpanan Wajib
                        </td>
                        <td class="text-right">
                            <?= format_rp($total_wajib) ?>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">2</td>
                        <td>
                            Simpanan Masuka
                        </td>
                        <td class="text-right">
                            <?= format_rp($total_masuka) ?>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">3</td>
                        <td>
                            Simpanan Hari Raya
                        </td>
                        <td class="text-right">
                            <?= format_rp($total_hr) ?>
                        </td>
                    </tr>
                </tbody>
                <!-- <tr>
                    <th colspan="3" align='left'>Subtotal</th>
                    <th class="text-right"><?= format_rp(0) ?></th>
                    <?php
                    if (is_null($total)) {
                        $total = 0;
                    } else {
                        $total = $total;
                    } ?>
                    <th class="text-right"><?= format_rp($total) ?></th>
                </tr> -->
            </table>
        </div>
    </div>
</body>

</html>