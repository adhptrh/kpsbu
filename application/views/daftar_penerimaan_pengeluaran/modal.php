<?php foreach ($list as $d) { ?>
    <div class="modal fade" id="mdl_<?= md5($d->no_dokumen) ?>" tabindex="-1" role="dialog" aria-labelledby="struks" aria-hidden="false">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="exampleModalLabel">Struk</h5>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama COA</th>
                                <th>Aktifitas</th>
                                <th>Nominal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 1;
                            foreach ($detail as $dd) { 
                                if ($dd->no_dokumen == $d->no_dokumen ) {
                                ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $dd->nama_coa ?></td>
                                <td><?= $dd->aktivitas ?></td>
                                <td class="text-right"><?= format_rp($dd->nominal) ?></td>
                            </tr>
                            <?php }} ?>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
<?php } ?>