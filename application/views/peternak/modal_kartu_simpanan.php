<!-- Modal -->
<?php foreach ($result as $key => $value) { ?>
    <div class="modal fade" id="kartu_simpanan_<?= $value['no_peternak']?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Kartu Simapanan</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">ID Anggota</label>
                        <div class="col-sm-9">
                            <input type="text" readonly class="form-control" value="<?= $value['no_peternak']?>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Nama Peternak</label>
                        <div class="col-sm-9">
                            <input type="text" readonly class="form-control" value="<?= $value['nama_peternak']?>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Simpanan Pokok</label>
                        <div class="col-sm-9">
                        <input type="text" readonly class="form-control" value="<?= format_rp($value['deposit'])?>">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
<?php } ?>