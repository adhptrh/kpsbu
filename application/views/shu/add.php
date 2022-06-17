<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title" id="exampleModalLabel">Alokasi SHU</h3>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form action="<?= base_url('c_masterdata/save_alokasi_shu')?>" method="POST">
            <div class="modal-body">
                <!-- <input type="text" value="<?= $percent ?>"> -->

                <div class="form-group row">
                    <label for="desc" class="col-sm-2 col-form-label">Deskrispi</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="desc" id="desc" required placeholder="Deskrispi">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="persentase" class="col-sm-2 col-form-label">Persentase</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="persentase" id="persentase" max="<?= $sisa ?>" required placeholder="Persentase">
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