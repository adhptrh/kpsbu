<!-- Modal -->
<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="exampleModalLabel">Pengajuan Bonus</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form action="<?= base_url('Pengajuan/savePengajuanBonus2')?>" method="post">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="id_pengajuan" class="col-sm-4 col-form-label">ID Pengajuan</label>
                    <div class="col-sm-8">
                    <input type="text" class="form-control" id="id_pengajuan" name="id_pengajuan"  value="<?= $kode ?>" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="tgl" class="col-sm-4 col-form-label">Periode</label>
                    <div class="col-sm-8">
                    <input type="month" class="form-control" id="tgl" name="tgl" placeholder="Tanggal" value="<?= date('Y-m')?>" readonly>
                    </div>
                </div>
                <hr>
                <div class="form-group row">
                    <div class="table-responsive" style="padding-left:10px;padding-right:10px;">
                        <?php
                        foreach ($pegawai as $k=>$item) { ?>
                            <input type="hidden" name="nip[]" value="<?= $item->nip?>">
                            <input type="hidden" name="nominal_<?= $item->nip ?>" id="nominal_<?= $item->nip ?>" value="0">
                            <input type="hidden" name="keterangan_<?= $item->nip ?>" id="keterangan_<?= $item->nip ?>" value="">
                        <?php } ?>
                        <table id="datatableyes" class="table table-bordered">
                            <thead>
                                <th>NIP</th>
                                <th>Nama</th>
                                <th>Nominal</th>
                                <th>Keterangan</th>
                            </thead>
                            <tbody>
                            <?php foreach ($pegawai as $k=>$item) { ?>
                                <tr>
                                    <td><?= $item->nip ?></td>
                                    <td><?= $item->nama ?></td>
                                    <td>
                                        <input onchange="
                                        let sender = document.getElementById('sender_nom_<?=$item->nip?>');
                                        document.getElementById('nominal_<?=$item->nip?>').value = sender.value
                                        " id="sender_nom_<?= $item->nip?>" class="form-control" type="number" value="0">
                                    </td>
                                    <td>
                                        <input onchange="
                                        let sender = document.getElementById('sender_ket_<?=$item->nip?>');
                                        document.getElementById('keterangan_<?=$item->nip?>').value = sender.value
                                        " id="sender_ket_<?= $item->nip?>" class="form-control" type="text">
                                    </td>
                                </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                    <script>
                        $(document).ready(function(){
                            $('#datatableyes').DataTable();
                        });
                        </script>
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