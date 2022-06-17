<?php foreach ($list as $value) { ?>
    <div class="modal fade" id="detail_<?= $value->kode_shu ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h5 class="modal-title" id="exampleModalLabel">Detail SHU - <b><?= $value->kode_shu?></b></h5>
            </div>
            <form action="<?= base_url('shu/save_transaksi_shu')?>" method="POST">
                <div class="modal-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Uraian</th>
                                <th>Nominal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            $no = 1;
                            foreach ($detail_shu as $item) { ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $item->uraian?></td>
                                <td class="text-right"><?= format_rp($item->nominal) ?></td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table> 
                </div>
            </form>
            </div>
        </div>
    </div>
<?php } ?>