<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h4 id="quote">Aktivitas</h4>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <a href="#add" data-toggle="modal" class="btn pull-right btn-primary">Tambah</a>
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
                                <th>Nama Aktivitas</th>
                                <th style="width: 15%;" class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php 
                        $no = 1;
                        foreach ($aktivitas as $item) { ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $item->nama_aktivitas ?></td>
                                <td class="text-center">
                                    <a href="#edit_<?= $item->id?>" data-toggle="modal" class="btn btn-sm btn-default">Edit</a>
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
<?php $this->load->view('aktivitas/add'); ?>
<?php $this->load->view('aktivitas/edit'); ?>
