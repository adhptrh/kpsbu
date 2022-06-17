<div class="modal fade" id="bayar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="exampleModalLabel">Check Out</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= base_url('Kasir/checkout')?>" method="post">
                <div class="modal-body">
                    <?php foreach ($id_bb as $key => $value) { ?>
                        <input type="hidden" name="id_bb[]" value="<?= $value->id_produk?>">
                        <input type="hidden" name="qty[]" value="<?= $value->jml?>">
                        <input type="hidden" name="harga_beli[]" value="<?= $value->harga_beli?>">
                    <?php } ?>
                    <div class="form-group row">
                        <label for="kode" class="col-sm-3 col-form-label">Kode</label>
                        <div class="col-sm-9">
                        <input type="text" name="kode" class="form-control" id="kode" value="<?= $kode ?>" readonly>
                        </div>
                    </div>
                    <hr>
                    <div class="form-group row">
                        <label for="jenis" class="col-sm-3 col-form-label">Jenis</label>
                        <div class="col-sm-5">
                            <select name="jenis" id="jenis" class="form-control">
                                <option value="">-</option>
                                <?php foreach ($jenis_anggota as $key) { ?>
                                <option value="<?= $key->id?>"><?= $key->deskripsi?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="col-sm-4 anggota">
                            <select name="anggota" id="anggota" class="form-control">
                                <option value="">-</option>
                                <option value="pegawai">Pegawai</option>
                                <option value="peternak">Peternak</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row" id="div-pembeli">
                        <label for="pembeli" class="col-sm-3 col-form-label">Nama Pembeli</label>
                        <div class="col-sm-9" id="pembeli">
                            <select name="pembeli" class="form-control pilih_pembeli">
                            </select>
                        </div>
                    </div>
                    <hr>
                    <div id="selain-umum">
                        <div class="form-group row">
                            <label for="tipe" class="col-sm-3 col-form-label">Tipe Pembayaran</label>
                            <div class="col-sm-4">
                                <select name="tipe" id="tipe" class="form-control">
                                    <option value="">-</option>
                                    <option value="tunai">Tunai</option>
                                    <option value="kredit">Kredit</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div id="umum">
                        <div class="form-group row">
                            <label for="pembayaran" class="col-sm-3 col-form-label">Input Pembayaran</label>
                            <div class="col-sm-5">
                                <input type="number" name="pembayaran" id="input_pembayaran" class="form-control" placeholder="Input Pembayaran" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
                            </div>
                        </div>
                    </div>
                    <div class="form-group row form-kembalian">
                        <label class="col-sm-3 col-form-label">Kembalian</label>
                        <div class="col-sm-5">
                            <input type="text" name="kembalian" id="kembalian" class="form-control" placeholder="Kembalian" value="0" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Total</label>
                        <div class="col-sm-5">
                            <input type="text" name="total" id="total" class="form-control" placeholder="Total Pembayaran" value="<?= $gtot ?>" readonly>
                            <input type="hidden" value="<?= $ppn ?>" name="ppn">
                            <input type="hidden" value="<?= $total ?>" name="total_trans">
                        </div>
                    </div>
                    <div class="info">
                        <h6 style="color:red"> *pembayaran kurang  </h6>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success btn-checkout">Checkout</button>
                    <!-- <button type="button" onclick="print_checkout()" class="btn btn-outline-primary">Print & Checkout</button> -->
                </div>
            </form>
        </div>
    </div>
</div>