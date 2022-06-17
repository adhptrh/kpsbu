<div class="modal" tabindex="-1" role="dialog" id="add">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h5 class="modal-title">Tambah HPP</h5>
            </div>
            <form action="<?= base_url('Penjualan/save_hpp')?>" method="post">
                <div class="modal-body">
                    <div class="form-group row">
                        <label for="kode" class="col-sm-3 col-form-label">Kode Transaksi</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="kode" name="kode" value="<?= $kode ?>" readonly>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="hpp" class="col-sm-3 col-form-label">Jenis HPP</label>
                        <div class="col-sm-9">
                            <select name="hpp" id="hpp" class="form-control">
                                <option value="">-</option>
                                <?php foreach ($jenis as $key => $value) { ?>
                                <option value="<?= $value->desc?>"><?= $value->desc?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="nominal" class="col-sm-3 col-form-label">Nominal</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="nominal" name="nominal" placeholder="Nominal" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div> 