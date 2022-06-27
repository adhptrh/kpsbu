<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote"><?= $this->uri->segment(1);?></h3>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <a href="<?= base_url('Pembelian/add')?>" class="btn pull-right btn-primary">Tambah Pembelian</a>
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
                                <th>Tanggal Pembelian</th>
                                <th>No Nota</th>
                                <th>Total Pembelian</th>
                                <th>PPN</th>
                                <th>Grand Total</th>
                                <th class="text-center">Status</th>
                                <th style="width: 10px;"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            $no = 1;
                            foreach ($list as $key => $value) { ?>
                                <tr>
                                    <td><?= $no++ ?></td>
                                    <td><?= date('d F Y', strtotime($value->tanggal)) ?></td>
                                    <td><?= $value->invoice ?></td>
                                    <td class="text-right"><?= format_rp($value->total) ?></td>
                                    <td class="text-right"><?= format_rp($value->ppn) ?></td>
                                    <td class="text-right"><?= format_rp($value->grandtotal) ?></td>
                                    <td class="text-center">
                                        <?php if ($value->status == 'selesai') { ?>
                                            <button class="btn btn-xs btn-success"><?= $value->status ?></button>
                                            
                                        <?php } else { ?>
                                            <button class="btn btn-xs btn-warning"><?= $value->status ?></button>
                                        <?php } ?>
                                    </td>
                                    <td>
                                        <a href="<?= base_url('Pembelian/detail_print/'. $value->invoice ) ?>" class="btn btn-default"><i class="fa fa-info-circle"></i></a>
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
