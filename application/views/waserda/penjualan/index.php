<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">List Penjualan</h3>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <!-- <a href="" class="btn pull-right btn-primary">Tambah Pembayaran Kredit</a> -->
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
                                <th>Waktu Transaksi</th>
                                <th>Invoice</th>
                                <th>Nama Pembeli</th>
                                <th>Jenis Pembayaran</th>
                                <th>Jumlah Pembayaran</th>
                                <th>Total Transaksi</th>
                                <th>PPN</th>
                                <th>Grand Total</th>
                                <th>Kembalian</th>
                                <th class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php
                        $no = 1;
                        foreach ($list as $key => $value) { ?>
                        <?php 
                        $jenis = $value->jenis_pembayaran;
                        if (empty($jenis)) {
                            $jenis = 'Tunai';
                        }
                        ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $value->date_payment ?></td>
                                <td><?= $value->invoice ?></td>
                                <td><?= $value->nama_pembeli ?></td>
                                <td><?= ucwords($jenis) ?></td>
                                <td class="text-right"><?= format_rp($value->pembayaran) ?></td>
                                <td class="text-right"><?= format_rp($value->total_trans) ?></td>
                                <td class="text-right"><?= format_rp($value->ppn) ?></td>
                                <td class="text-right"><?= format_rp($value->total) ?></td>
                                <td class="text-right"><?= format_rp($value->kembalian) ?></td>
                                <td class="text-center">
                                    <?php 
                                    if ($value->jenis_pembayaran == 'kredit' && !is_null($value->status_kredit)) { ?>
                                        <a href="<?= base_url('Kasir/detail_print/'. $value->invoice ) ?>" class="btn btn-default"><i class="fa fa-print"></i></a>
                                    <?php } else if ($value->jenis_pembayaran == 'tunai' || empty($value->jenis_pembayaran)) { ?>
                                        <a href="<?= base_url('Kasir/detail_print/'. $value->invoice ) ?>" class="btn btn-default"><i class="fa fa-print"></i></a>
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
