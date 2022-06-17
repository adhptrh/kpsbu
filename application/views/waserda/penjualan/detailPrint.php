<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Detail Penjualan Waserda</h3>
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
                                <th>Invoice</th>
                                <th>Tgl. Penjualan</th>
                                <th>Nama Barang</th>
                                <th>Harga Jual</th>
                                <th>Qty</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            $no = 1;
                            $subtotal = 0;
                            $grandtotal = 0;
                            foreach ($detail as $key => $value) { ?>
                            <?php 
                            $subtotal = $value->jml * $value->harga;
                            $grandtotal += $subtotal ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $value->invoice ?></td>
                                <td><?= $value->tanggal ?></td>
                                <td><?= $value->nama_produk ?></td>
                                <td class="text-right"><?= format_rp($value->harga) ?></td>
                                <td><?= $value->jml ?></td>
                                <td class="text-right"><?= format_rp($subtotal) ?></td>
                            </tr>
                            <?php } ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th colspan="6" class="text-center">Grandtotal</th>
                                <th class="text-right"><?= format_rp($grandtotal) ?></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <a href="<?= base_url('Kasir/list_penjualan') ?>" class="btn btn-default">Kembali</a>
                <button type="button" data-id="<?= $value->invoice?>" class="btn btn-primary" id="printPdf">Print</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $("#printPdf").on('click', function(){
            var invoice = $(this).data('id');
            var url = "<?= base_url('Kasir/pdf/')?>";
            var win = window.open(url + invoice, '_blank');
            if (win) {
                window.focus();
            } else {
                alert('Please allow popups for this website');
            }
        });
    });
</script>
