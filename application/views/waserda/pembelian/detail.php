<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Detail Pembelian Waserda</h3>
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
                                <th class="text-center">Invoice</th>
                                <th class="text-center">Tgl. Pembelian</th>
                                <th class="text-center">Tgl. Kadaluwarsa</th>
                                <th class="text-center">Nama Barang</th>
                                <th class="text-center">Qty</th>
                                <th class="text-center">Harga Satuan</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            $no = 1;
                            foreach ($detail as $key => $value) { ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $value->invoice ?></td>
                                <td><?= $value->tanggal ?></td>
                                <td><?= $value->tanggal_kadaluwarsa ?></td>
                                <td><?= $value->nama_produk ?></td>
                                <td><?= $value->jml ?></td>
                                <td class="text-right"><?= format_rp($value->harga_satuan) ?></td>
                            </tr>
                            <?php } ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th colspan="5">Total Pembelian</th>
                                <td class="text-right" colspan="2"><?= format_rp($value->total)?></td>
                            </tr>
                            <tr> 
                                <th colspan="5">PPN (11%)</th>
                                <td class="text-right" colspan="2"><?= format_rp($value->ppn)?></td>
                            </tr>
                            <tr> 
                                <th colspan="5">GrandTotal</th>
                                <td class="text-right" colspan="2"><?= format_rp($value->grandtotal)?></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <a href="<?= base_url('Pembelian') ?>" class="btn btn-default">Kembali</a>
                <button type="button" data-id="<?= $value->invoice?>" class="btn btn-primary" id="printPdf">Print</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $("#printPdf").on('click', function(){
            var invoice = $(this).data('id');
            var url = "<?= base_url('Pembelian/pdf/')?>";
            var win = window.open(url + invoice, '_blank');
            if (win) {
                window.focus();
            } else {
                alert('Please allow popups for this website');
            }
        });
    });
</script>
