<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Shift</h3>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <button class="btn pull-right btn-primary" data-target="#add" data-toggle="modal">Tambah Data</button>
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
                                <th>Deskrispsi</th>
                                <th>Jam Masuk</th>
                                <th>Jam Keluar</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php 
                        $no = 1;
                        foreach ($list as $value) { ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $value->desc ?></td>
                                <td><?= $value->time_in ?></td>
                                <td><?= $value->time_out ?></td>
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
<?php $this->load->view('shift/master_shift/add')?>