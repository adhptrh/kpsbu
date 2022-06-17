<div class="row">
    <div class="col-sm-6">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Penjualan Susu Olahan</h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <form action="<?= base_url('penjualan/detail_pakan_konsentrat')?>" method="post">
                    <div class="form-group row">
                        <label for="pnj_susu" class="col-sm-2 col-form-label">Kode Penjualan</label>
                        <div class="col-sm-6">
                            <input type="text" name="pnj_susu" class="form-control" id="pnj_susu" value="<?= $kode?>" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="tanggal" class="col-sm-2 col-form-label">Tanggal</label>
                        <div class="col-sm-6">
                            <input type="date" name="tanggal" class="form-control" id="tanggal" value="<?= date('Y-m-d')?>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="prod_susu" class="col-sm-2 col-form-label">Produk</label>
                        <div class="col-sm-10">
                            <select name="prod_susu" id="prod_susu" class="form-control" required>
                                <option value="">-</option>
                                <?php foreach ($produk as $key => $value) { ?>
                                <option value="<?= $value->no_produk?>"><?= $value->nama_produk?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="jumlah_lt" class="col-sm-2 col-form-label">Jumlah</label>
                        <div class="col-sm-10">
                            <input type="number" name="jumlah_lt" class="form-control" id="jumlah_lt" placeholder="Jumlah Liter" min="1" value="1">
                        </div>
                    </div>
                    <hr>
                    <a class="btn btn-default btn-md" href="<?= base_url('penjualan/pakan_konsentrat')?>">Kembali</a>
                    <button type="submit" class="btn btn-primary btn-md">Tambah</button>
                </form>
            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Detail Penjualan Susu</h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <!-- <div class="table-responsive"> -->
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Kode Produk</th>
                                <th>Nama Produk</th>
                                <th>Jumlah Liter Susu</th>
                                <th>Harga Satuan</th>
                                <th>Subtotal</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            $no=1;
                            $total = 0;
                            $subtotal = 0;
                            $grandtot = 0;
                            foreach ($detail as $value) { ?>
                            <?php 
                            $subtotal += $value->harga_satuan * $value->jml_liter; 
                            $grandtot = $subtotal + $total
                            ?>
                            <tr>
                                <td><?= $no++?></td>
                                <td><?= $value->kd_produk?></td>
                                <td><?= $value->nm_produk?></td>
                                <td><?= $value->jml_liter?></td>
                                <td class="text-right"><?= format_rp($value->harga_satuan)?></td>
                                <td class="text-right"><?= format_rp($value->jml_liter * $value->harga_satuan)?></td>
                                <td class="text-center"><i class="fa fa-trash"></i></td>
                            </tr>
                            <?php } ?>
                        </tbody>
                        <tfooter>
                            <tr>
                                <th colspan="5">Total</th>
                                <th class="text-right"><?= format_rp($grandtot) ?></th>
                            </tr>
                        </tfooter>
                    </table>
                    <hr>
                    <?php if (count($detail) > 0) { ?>
                        <form action="<?= base_url('Penjualan/save_pnj')?>" method="post">
                            <input type="hidden" value="<?= $kode ?>" name="id">
                            <input type="hidden" value="<?= $total1 ?>" name="total">
                            <input type="hidden" value="pakan_konsentrat" name="jenis">

                            <div class="form-group row">
                                <label for="pelanggan" class="col-sm-2 col-form-label">Anggota</label>
                                <div class="col-sm-6">
                                    <select name="pelanggan" id="pelanggan" class="form-control">
                                        <option value="">-</option>
                                        <?php foreach ($anggota as $key => $value) { ?>
                                        <option value="<?= $value->nama_peternak?>"><?= $value->nama_peternak?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <hr>
                            <button class="btn btn-success btn-md" type="submit">Selesai</button>
                        </form>
                    <?php } ?>
                <!-- </div> -->
            </div>
        </div>
    </div>
</div>
