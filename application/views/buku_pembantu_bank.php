<html>

<body>
    <div class="x_panel">
        <div class="x_title">
            <h3 class="panel-title"><b>Buku Pembantu Bank</b></h3>
        </div>

        <div class="x_content">
            <form class="form-inline">
                <label>Bulan Tahun</label>
                <input class="form-control" type="month">
                <button class="btn btn-primary">Filter</button>
            </form>
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
            <h3>Buku Pembantu Bank</h3>
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
                        <th rowspan="2" class="text-center">Uraian</th>
                        <th rowspan="2" class="text-center">Bukti Transaksi</th>
                        <th colspan="2" class="text-center">Pemasukan</th>
                        <th colspan="3" class="text-center">Pengeluaran</th>
                        <th rowspan="2" class="text-center">Saldo</th>
                    </tr>
                    <tr>
                        <th>Setoran</th>
                        <th>Bunga Bank</th>
                        <th>Penarikan</th>
                        <th>Pajak</th>
                        <th>B. Admin</th>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>