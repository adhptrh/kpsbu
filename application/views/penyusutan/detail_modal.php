<?php foreach ($detail as $key => $d) { ?>
    <div class="modal fade" id="detail_modal_<?= $d->id_penyusutan?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Detail </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <table class="table table-borderless">
                            <tr>
                                <th style="width: 22%;">ID Penyusutan</th>
                                <td><?= $d->id_penyusutan?></td>
                            </tr>
                            <tr>
                                <th>Nama Aset</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>Detail Aset</th>
                                <td>asd</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
<?php } ?>