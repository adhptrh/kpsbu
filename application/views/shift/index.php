<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Jadwal Shift</h3>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <button class="btn pull-right btn-primary" data-target="#add" data-toggle="modal">Tambah Jadwal Shift</button>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered" id="datatable">
                        <thead>
                            <tr>
                                <th style="width: 5%;">No</th>
                                <th>Nama Pegawai</th>
                                <th>NIP</th>
                                <th>Detail Shift</th>
                                <th>Tanggal Awal</th>
                                <th>Tanggal Akhir</th>
                                <th>Deskripsi</th>
                                <th style="width: 7%;" class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php 
                        $no = 1;
                        foreach ($list as $value) { ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $value->nama ?></td>
                                <td><?= $value->nip ?></td>
                                <td><?= $value->shift ?></td>
                                <td><?= $value->tgl_awal ?></td>
                                <td><?= $value->tgl_akhir ?></td>
                                <td><?= $value->desc ?></td>
                                <td class="text-center">
                                    <?php if ($value->is_complete == 0) { ?>
                                        <button class="btn btn-sm btn-secondary" onclick="set_done(<?= $value->id_pegawai ?>)"> Set done</button>
                                    <?php } else { ?>
                                        <button class="btn btn-sm btn-success"><i class="fa fa-check"></i> Done</button>
                                    <?php } ?>
                                </td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $this->load->view('script');?>
<?php $this->load->view('shift/add')?>
<script>
    $(document).ready(function() {
        $('.js-example-basic-multiple').select2();
    });

    function set_done(id_pegawai) {
        // alert(id_pegawai)
        $.ajax({
            url : "<?= base_url('Shift/set_done/')?>"+id_pegawai,
            success:function(e) {
                window.location.reload();
            }
        })

    }
</script>
