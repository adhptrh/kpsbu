<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Data Jenis Pegawai</h3>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <a href="#add" data-toggle="modal" class="btn pull-right btn-primary">Tambah data</a>
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
                                <th style="width: 5%;">#</th>
                                <th>Deskripsi</th>
                                <th>Pendidikan Terakhir</th>
                                <th>Gaji Pokok</th>
                                <th class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1;
                            foreach ($jp as $key => $value) { ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $value->desc?></td>
                                <td><?= $value->pendidikan?></td>
                                <td class="text-right"><?= format_rp($value->gaji_pokok)?></td>
                                <td class="text-center">
                                    <a href="#edit_<?= $value->id ?>" data-toggle="modal" class="btn btn-default btn-sm">Edit</a>
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
<?php $this->load->view('pegawai/jenis_pegawai/add');?>
<?php $this->load->view('pegawai/jenis_pegawai/edit');?>