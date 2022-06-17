<!-- Modal -->
<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tambah PTKP</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= base_url('c_masterdata/save_ptkp')?>" method="post">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="desc" class="col-sm-3 col-form-label">Deskripsi</label>
                    <div class="col-sm-9">
                        <input type="text" name="desc" class="form-control" id="desc">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="nominal" class="col-sm-3 col-form-label">Nominal</label>
                    <div class="col-sm-9">
                        <input type="text" name="nominal" class="form-control" id="nominal" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
            </form>
        </div>
    </div>
</div>