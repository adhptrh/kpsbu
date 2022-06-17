<!-- Modal -->
<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tambah Jenis Pegawai</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= base_url('c_masterdata/save_jenis_pegawai')?>" method="post">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="desc" class="col-sm-3 col-form-label">Deskripsi</label>
                    <div class="col-sm-9">
                        <input type="text" name="desc" class="form-control" id="desc">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="pendidikan" class="col-sm-3 col-form-label">Pendidikan</label>
                    <div class="col-sm-9">
                        <select name="pendidikan" id="pendidikan" class="form-control">
                            <option value="">-</option>
                            <option value="sma">SMA</option>
                            <option value="d3">D3</option>
                            <option value="s1">S1</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="gaji_pokok" class="col-sm-3 col-form-label">Gaji Pokok</label>
                    <div class="col-sm-9">
                        <input type="text" name="gaji_pokok" class="form-control" id="gaji_pokok" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
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