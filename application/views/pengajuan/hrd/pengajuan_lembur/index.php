<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h4 id="quote">Lembur Pegawai</h4>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <!-- <a href="#add" data-toggle="modal" class="btn pull-right btn-primary">Tambah</a> -->
                            <?= $role == 'pegawai' ? '<a href="#add" data-toggle="modal" class="btn pull-right btn-primary">Tambah</a>' : '' ?>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>
                <div style="margin-bottom: 20px;">
                    <strong>Note :<br></strong>
                    <p>*untuk lembur pegawai, maksimal 6 jam<br></p>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered" id="datatable">
                        <thead>
                            <tr>
                                <th style="width: 5%;">#</th>
                                <th>ID Pengajuan</th>
                                <th>Tanggal Pengajuan</th>
                                <th>Nama Pegawai</th>
                                <th>Jumlah Pengajuan (jam lembur)</th>
                                <th class="text-center">Status</th>
                                <?php if ($role != 'pegawai') { ?>
                                <th style="width: 12%;" class="text-center">Aksi</th>
                                <?php } ?>
                            </tr>
                        </thead>
                        <tbody>
                        <?php 
                        $no = 1;
                        foreach ($lembur as $key => $value) { ?>
                            <tr>
                                <td><?= $no++?></td>
                                <td><?= $value->id_pengajuan?></td>
                                <td><?= $value->tgl_pengajuan?></td>
                                <td><?= $value->nama?></td>
                                <td><?= $value->total_jam?></td>
                                <td class="text-center">
                                    <?= ($value->status == 0 && ($role != 'atasan')) ? '<span class="label label-warning">Menunggu persetujuan atasan</span>' : 
                                    (($value->status == 0 && $role == "atasan") ? '<span class="label label-warning">Menunggu persetujuan</span>' : 
                                    (($value->status == 1 && $role == 'atasan') ? '<span class="label label-warning">Menunggu persetujuan personalia</span>' : 
                                    (($value->status == 1 && ($role == "admin" || $role == "personalia")) ? '<span class="label label-warning">Menunggu persetujuan</span>':
                                    (($value->status == 1 && ($role != 'atasan')) ? '<span class="label label-warning">Menunggu persetujuan personalia</span>':
                                    (($value->status == 2) ? '<span class="label label-danger">Ditolak</span>':'<span class="label label-success">Diterima</span>'))))); ?>
                                </td>
                                <?php if ($role != 'pegawai') { ?>
                                <td class="text-center">
                                    <?php if ($value->status == 0 && $role == "atasan") { ?>
                                        <button type="button" class="btn btn-default btn-xs setuju" data-id="<?= $value->id_pengajuan?>" data-nominal="<?= $value->total_nominal_lembur?>" onclick="confirm('Anda yakin?')"><i class="fa fa-check"></i></button>
                                        <button type="button" class="btn btn-default btn-xs tolak" data-id="<?= $value->id_pengajuan?>" onclick="confirm('Data yang ditolak tidak dapat dikembalikan, anda yakin?')"><i class="fa fa-times"></i></button>
                                    <?php } ?>
                                    <?php if ($value->status == 1 && ($role == "admin" || $role == 'personalia')) { ?>
                                        <button type="button" class="btn btn-default btn-xs setuju" data-id="<?= $value->id_pengajuan?>" data-nominal="<?= $value->total_nominal_lembur?>" onclick="confirm('Anda yakin?')"><i class="fa fa-check"></i></button>
                                        <button type="button" class="btn btn-default btn-xs tolak" data-id="<?= $value->id_pengajuan?>" onclick="confirm('Data yang ditolak tidak dapat dikembalikan, anda yakin?')"><i class="fa fa-times"></i></button>
                                    <?php } ?>
                                </td>
                                <?php } ?>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $this->load->view('pengajuan/hrd/pengajuan_lembur/add');?>
<script>

    $(document).ready(function (){
        $(".setuju").on('click', function() {
            var id_pengajuan = $(this).data("id");
            var nominal = $(this).data("nominal");
            $.ajax({
                url : "<?= base_url('Lembur/accept')?>", 
                method : "post", 
                data : {
                    id_pengajuan : id_pengajuan,
                    nominal : nominal,
                },
                success:function(response) {
                    location.reload();
                }
            })
        })

        $(".tolak").on('click', function() {
            var id_pengajuan = $(this).data("id");
            $.ajax({
                url : "<?= base_url('Lembur/reject')?>", 
                method : "post", 
                data : {
                    id_pengajuan : id_pengajuan,
                },
                success:function(response) {
                    location.reload();
                    // console.log(response)
                }
            })
        })
    })

</script>