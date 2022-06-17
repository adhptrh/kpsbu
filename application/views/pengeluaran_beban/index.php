<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h4 id="quote">Pengeluaran Beban</h4>
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
                                <th>ID Pengeluaran Beban</th>
                                <th>Tgl. Pengeluaran Beban</th>
                                <th>Nama Beban</th>
                                <th>Nominal</th>
                                <th>Keterangan</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php 
                        $no = 1;
                        foreach ($list as $key => $value) { ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $value->id_pengeluaran ?></td>
                                <td><?= $value->tgl_pengeluaran ?></td>
                                <td><?= $value->nama_coa ?></td>
                                <td class="text-right"><?= format_rp($value->nominal) ?></td>
                                <td><?= ucwords($value->keterangan) ?></td>
                            </tr>
                        <?php }?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $this->load->view('pengeluaran_beban/add'); ?>