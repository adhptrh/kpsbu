<div role="tabpanel" class="tab-pane fade active in" id="tab_content2" aria-labelledby="profile-tab">
    <table class="data table table-striped no-margin">
        <thead>
        <tr>
            <th>#</th>
            <th>ID Pengajuan</th>
            <th>Tgl. Lembur</th>
            <th>Total Jam Lembur</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <?php
        $no = 1; 
        foreach ($lembur as $item) { ?>
        <tr>
            <td><?= $no++ ?></td>
            <td><?= $item->id_pengajuan ?></td>
            <td><?= $item->tgl_pengajuan ?></td>
            <td><?= $item->total_jam ?></td>
            <td>
                <?= $item->status == 1 ? '<span class="label label-warning">Menunggu persetujuan</span>' : (($item->status == 2) ? '<span class="label label-danger">Ditolak</span>':'<span class="label label-success">Sudah disetujui</span>'); ?>
            </td>
        </tr>
        <?php }?>
        </tbody>
    </table>
</div>