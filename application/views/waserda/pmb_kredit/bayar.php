<div class="modal fade" id="bayar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="exampleModalLabel">Pembayaran Kredit</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <!-- <span aria-hidden="true">&times;</span> -->
                </button>
            </div>
            <form method="POST" action="<?= base_url("kasir/save_pmb_kredit")?>">
                <div class="modal-body">
                    <input type="hidden" value="" name="anggota" id="anggota">
                    <div class="form-group row">
                        <label for="kd_pembayaran" class="col-sm-4 col-form-label">Kode Pembayaran</label>
                        <div class="col-sm-6">
                        <input type="text" readonly class="form-control" id="kd_pembayaran" name="kd_pembayaran" value="<?= $kode ?>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="tgl_pembayaran" class="col-sm-4 col-form-label">Tanggal Pembayaran</label>
                        <div class="col-sm-6">
                        <input type="date" class="form-control" id="tgl_pembayaran" name="tgl_pembayaran" value="<?= date('Y-m-d')?>">
                        </div>
                    </div>
                    <hr>
                    <div class="form-group row">
                        <label for="invoice" class="col-sm-4 col-form-label">Invoice</label>
                        <div class="col-sm-6">
                        <input type="text" readonly class="form-control" id="invoice" name="invoice" value="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="nm_pembeli" class="col-sm-4 col-form-label">Nama Pembeli</label>
                        <div class="col-sm-6">
                        <input type="text" readonly class="form-control" id="nm_pembeli" name="nm_pembeli" value="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="total" class="col-sm-4 col-form-label">Total</label>
                        <div class="col-sm-6">
                        <input type="text" readonly class="form-control" id="total" name="total" value="">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
                    <button type="submit" class="btn btn-primary">Bayar</button>
                </div>
            </form>
        </div>
    </div>
</div>