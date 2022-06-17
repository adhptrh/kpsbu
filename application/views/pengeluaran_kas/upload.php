<!-- Modal -->
<div class="modal fade" id="upload" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="exampleModalLabel">Pengeluaran Kas</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form action="<?= base_url('Pengeluaran_kas/upload')?>" method="post" enctype="multipart/form-data">
            <div class="modal-body">
                <input type="hidden" value="" id="id" name="id">
                
                <div class="form-group row">
                    <label for="bukti" class="col-sm-4 col-form-label">Bukti Transfer</label>
                    <div class="col-sm-8">
                    <input type="file" class="form-control" id="bukti" name="bukti">
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