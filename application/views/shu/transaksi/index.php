<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Transaksi SHU</h3>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <?php 
                            $datenow = date('Y-m-d');

                            // hardcode tahun
                            
                            $tahun = date('Y');
                            //$format = $tahun.'-12-31';
                            $format = '2022-06-18';
                            $cek = date('Y-m-d', strtotime($format));
                            if ($datenow == $cek) { ?>
                                <button class="btn pull-right btn-primary" data-target="#add" data-toggle="modal">Tambah</button>
                            <?php } ?>
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
                                <th>Kode</th>
                                <th>Tanggal</th>
                                <th>Nominal</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php 
                        $no = 1;
                        foreach ($list as $key => $value) { ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $value->kode_shu?></td>
                                <td><?= $value->tanggal?></td>
                                <td class="text-right"><?= format_rp($value->nominal)?></td>
                                <td>
                                    <a href="#detail_<?= $value->kode_shu?>" data-toggle="modal" class="btn btn-sm btn-default">Detail</a>
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
<?php $this->load->view('shu/transaksi/add')?>
<?php $this->load->view('shu/transaksi/detail')?>
