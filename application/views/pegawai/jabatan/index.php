<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Data Jabatan</h3>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <!-- <button class="btn pull-right btn-primary" data-target="#add" data-toggle="modal">Tambah data</button> -->
                            <a href="#add" data-toggle="modal" class="btn pull-right btn-primary">Tambah data</a>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <div id="notif">
                    <?php echo validation_errors(); ?>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered" id="datatable">
                        <thead>
                            <tr>
                                <th style="width: 5%;">#</th>
                                <th>Nama Jabatan</th>
                                <th>Tunjangan Jabatan</th>
                                <th>Tunjangan Kesehatan</th>
                                <th class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1;
                            foreach ($list as $key => $value) { ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $value->desc?></td>
                                <td class="text-right"><?= format_rp($value->tunjangan_jabatan)?></td>
                                <td class="text-right"><?= format_rp($value->tunjangan_kesehatan)?></td>
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
<?php $this->load->view('pegawai/jabatan/add');?>
<?php $this->load->view('pegawai/jabatan/edit');?>