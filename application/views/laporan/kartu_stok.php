<div class="col-md-12 col-sm-6 col-xs-12">
    <div class="x_panel">
        <div class="x_title">
        <ul class="nav navbar-right panel_toolbox">
            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
            </li>
            <li><a class="close-link"><i class="fa fa-close"></i></a>
            </li>
        </ul>
        <div class="clearfix"><h3>Laporan Kartu Stok</h3></div>
        </div>
        <div class="x_content">
            <form class="form-horizontal" method="post" action="<?= base_url('Laporan/kartu_stok')?>">
                <div class="form-group">
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <label for="id_barang">Nama Barang<i class="text-danger"> *</i></label>
                        <select name="nama_brg" id="nama_brg" class="form-control" required>
                            <option value="">-</option>
                            <?php foreach ($produk as $key => $value) {
                                echo '<option value='.$value->kode.'>'.$value->nama_produk.'</option>';
                            } ?>
                        </select>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <label for="periode">Periode</label>
                        <input type="month" id="periode" class="form-control" name="periode" required="">
                    </div>
                    <div class="col-md-2 col-sm-6 col-xs-12">
                        <label for="">&nbsp;</label>
                        <input type="submit" class="btn btn-primary form-control" value="Search">
                    </div>
                </div>
            </form>
            <hr>
            <center>
            <h3>Kartu Stok</h3>
            <h5>Periode -</h5>
            </center>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center" rowspan="2">Waktu Transaksi</th>
                        <!-- <th class="text-center" rowspan="2">Keterangan</th> -->
                        <th class="text-center" colspan="3">IN</th>
                        <th class="text-center" colspan="3">OUT</th>
                        <th class="text-center" colspan="3">Saldo</th>
                    </tr>
                    <tr>
                        <th class="text-center">Unit</th>
                        <th class="text-center">Harga</th>
                        <th class="text-center">Total</th>
                        <th class="text-center">Unit</th>
                        <th class="text-center">Harga</th>
                        <th class="text-center">Total</th>
                        <th class="text-center">Unit</th>
                        <th class="text-center">Harga</th>
                        <th class="text-center">Total</th>
                    </tr>
                </thead>
                <tbody>
                <?php foreach ($kartu_stok as $item) { ?>
                    <tr>
                        <td><?= $item->tgl_transaksi ?></td>
                        <td><?= $item->unit_in ?></td>
                        <td><?= ($item->harga_in == '-') ? '-' : format_rp($item->harga_in) ?></td>
                        <td><?= ($item->total_in == '-') ? '-' : format_rp($item->total_in) ?></td>
                        <td><?= $item->unit_out ?></td>
                        <td><?= ($item->harga_out == '-') ? '-' : format_rp($item->harga_out) ?></td>
                        <td><?= ($item->total_out == '-') ? '-' : format_rp($item->total_out) ?></td>
                        <td><?= $item->unit_total ?></td>
                        <td><?= ($item->harga_total == '-') ? '-' : format_rp($item->harga_total) ?></td>
                        <td><?= ($item->total == '-') ? '-' : format_rp($item->total) ?></td>
                    </tr>
                <?php } ?>
                </tbody>
                <!-- <tfoot>
                    <tr>
                    <th colspan="1">Total</th>
                    <th>0</th>
                    <th></th>
                    <th class="text-right">Rp 0</th>
                    <th>0</th>
                    <th></th>
                    <th class="text-right">Rp 0</th>
                    <th>0</th>
                    <th></th>
                    <th class="text-right">Rp 0</th>
                    </tr>
                </tfoot> -->
            </table>
        </div>
    </div>
</div>