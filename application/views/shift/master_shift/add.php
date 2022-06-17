<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title" id="exampleModalLabel">Master Shift</h3>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form action="<?= base_url('c_masterdata/save_shift')?>" method="POST">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="desc" class="col-sm-2 col-form-label">Deskrispi</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="desc" required placeholder="Deskrispi">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="tgl" class="col-sm-2 col-form-label">Jam</label>
                    <div class="col-sm-5">
                        <input type="time" class="form-control" id="" name="jam_masuk" required>
                    </div>
                    <div class="col-sm-5">
                        <input type="time" class="form-control" id="" name="jam_keluar" required>
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