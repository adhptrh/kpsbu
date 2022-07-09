<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <h3 class="modal-title" id="exampleModalLabel">Tambah SHU</h3>
        </div>
        <form action="<?= base_url('shu/save_transaksi_shu')?>" method="POST">
            <div class="modal-body">
                <?php 
                $total1 = 0;
                foreach ($shu as $key => $value) { ?>
                <?php
                    $persentase1 = ($value->persentase/100);
                    $total1 = $persentase1 * $nominal_shu;
                ?>
                <input type="hidden" value="<?= $value->deskripsi ?>" name="uraian[]">
                <input type="hidden" value="<?= round($total1) ?>" name="total[]">
                <?php } ?>
                <h6>Kode SHU : <?= $kode ?></h6>
                <input type="hidden" value="<?= $kode ?>" name="kode_shu">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Uraian</th>
                            <th>Persentase</th>
                            <th>Nominal</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                        $no = 1;
                        $total = 0;
                        foreach ($shu as $item) { ?>
                        <?php
                        $persentase = ($item->persentase/100);
                        $total = $persentase * $nominal_shu;
                        // print_r($total);
                        ?>
                        <tr>
                            <td><?= $no++ ?></td>
                            <td><?= $item->deskripsi?></td>
                            <td><?= $item->persentase?></td>
                            <td class="text-right"><?= format_rp($nominal_shu) ?></td>
                            <td class="text-right"><?= format_rp($total)?></td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table> 

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Simpan</button>
            </div>
        </form>
        </div>
    </div>
</div>