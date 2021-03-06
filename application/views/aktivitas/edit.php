<?php foreach ($aktivitas as $key => $value) { ?>
    <!-- Modal -->
    <div class="modal fade" id="edit_<?= $value->id?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="exampleModalLabel">Edit Aktivitas</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= base_url('c_masterdata/edit_aktivitas')?>" method="post">
                <input type="hidden" value="<?= $value->id ?>" name="id">
                <div class="modal-body">
                    <div class="form-group row">
                        <label for="nama_aktivitas" class="col-sm-4 col-form-label">Nama Aktivitas</label>
                        <div class="col-sm-8">
                        <input type="text" class="form-control" id="nama_aktivitas" name="nama_aktivitas" value="<?= $value->nama_aktivitas?>">
                        <?php echo form_error('nama_aktivitas'); ?>
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
<?php } ?>