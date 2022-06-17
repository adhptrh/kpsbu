<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title" id="exampleModalLabel">Jadwal Shift</h3>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form action="<?= base_url('Shift/add')?>" method="POST">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="pegawai" class="col-sm-2 col-form-label">Pegawai</label>
                    <div class="col-sm-10">
                        <select style="width: 100% !important;" name="pegawai[]" multiple="multiple" id="" class="form-control js-example-basic-multiple" required>
                            <?php foreach ($pegawai as $key => $value) { ?>
                            <option value="<?= $value->nip?>"><?= $value->nama?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="shift" class="col-sm-2 col-form-label">Shift</label>
                    <div class="col-sm-10">
                        <select name="shift" class="form-control" required>
                            <?php foreach ($shift as $key => $value) { ?>
                            <option value="<?= $value->id?>"><?= $value->desc?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="tgl" class="col-sm-2 col-form-label">Tanggal</label>
                    <div class="col-sm-5">
                        <input type="date" class="form-control" id="" name="tgl_awal" required>
                    </div>
                    <div class="col-sm-5">
                        <input type="date" class="form-control" id="" name="tgl_akhir" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="desc" class="col-sm-2 col-form-label">Deskripsi</label>
                    <div class="col-sm-10">
                        <textarea name="desc" id="desc" cols="10" rows="5" class="form-control" placeholder="Deskripsi"></textarea>
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