<?php foreach ($list as $item) { ?>
    <div class="modal fade bd-example-modal-lg" id="detail_<?= $item->id?>" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span> 
                    </button>
                    <h4 class="modal-title" id="exampleModalLabel">Detail Pegawai - <?= $item->nama?></h4>
                </div>
                <form action="<?= base_url('c_masterdata/edit_peg')?>" method="post">
                <div class="modal-body">
                    <div class="row">
                        <table class="table table-striped">
                            <tr>
                                <th>Tempat Lahir</th>
                                <th>Tanggal Lahir</th>
                                <th>Jabatan</th>
                                <th>Status PTKP</th>
                                <th>Jenis Pegawai</th>
                            </tr>
                            <tr>
                                <td><?= $item->tempat_lahir?></td>
                                <td><?= $item->tgl_lahir?></td>
                                <td><?= $item->id_jabatan?></td>
                                <td><?= $item->id_ptkp ? $item->id_ptkp : '-'?></td>
                                <td><?= $item->id_jenis_pegawai?></td>
                            </tr>
                        </table>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
<?php } ?>