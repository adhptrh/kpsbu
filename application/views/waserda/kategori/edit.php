<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Edit Supplier</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form action="<?= base_url('Kategori/ubah')?>" method="POST">
            <div class="modal-body">
                <div class="form-group row">
                        <label for="kode" class="col-sm-3 col-form-label">Kode Kategori</label>
                        <div class="col-sm-9">
                        <input type="text" class="form-control" id="kode" value="<?= $kode ?>" name="kode" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="desc" class="col-sm-3 col-form-label">Deskripsi</label>
                        <div class="col-sm-9">
                        <input type="text" class="form-control" id="desc" placeholder="Deskripsi" name="desc">
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