<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Penjualan Pengolahan Susu</h3>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <!-- <button class="btn pull-right btn-primary" data-target="#add" data-toggle="modal">Tambah data</button> -->
                            <a href="<?= base_url('penjualan/form_pengolahan_susu')?>" class="btn pull-right btn-primary">Tambah data</a>
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
                                <th>Kode Penjualan</th>
                                <th>Tanggal</th>
                                <th>Nama Pelanggan</th>
                                <th>Status</th>
                                <th style="width: 7%;" class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            $no = 1;
                            foreach ($list as $key => $value) { ?>
                            <tr>
                                <td><?= $no++?></td>
                                <td><?= $value->kd_pnj_susu?></td>
                                <td><?= $value->tanggal?></td>
                                <td><?= $value->nm_pelanggan?></td>
                                <td><?= ucwords($value->status)?></td>
                                <td>
                                    <a href="" class="btn btn-md btn-default">Detail</a>
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
