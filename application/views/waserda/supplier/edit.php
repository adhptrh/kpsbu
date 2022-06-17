<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Edit Supplier</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form action="<?= base_url('Supplier_produk/ubah')?>" method="POST">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="kode" class="col-sm-3 col-form-label">Kode</label>
                    <div class="col-sm-9">
                    <input type="text" name="kode" class="form-control" id="kode" value="<?= $kode ?>" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="supplier" class="col-sm-3 col-form-label">Nama Supplier</label>
                    <div class="col-sm-9">
                    <input type="text" name="supplier" class="form-control" id="supplier" placeholder="Nama Supplier" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="alamat" class="col-sm-3 col-form-label">Alamat</label>
                    <div class="col-sm-9">
                        <textarea name="alamat" class="form-control" id="alamat" cols="10" rows="5" placeholder="Alamat" required></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="no_telp" class="col-sm-3 col-form-label">No Telp</label>
                    <div class="col-sm-9">
                    <input type="text" name="no_telp" class="form-control" id="no_telp" placeholder="No Telp" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" required>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Simpan</button>
            </div>
        </form>
        </div>
    </div>
</div>