<!-- Modal -->
<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="exampleModalLabel">Pengeluaran Kas</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form action="<?= base_url('Pengeluaran_kas/save')?>" method="post">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="id_pengeluaran" class="col-sm-4 col-form-label">ID Pengeluaran</label>
                    <div class="col-sm-8">
                    <input type="text" readonly class="form-control" id="id_pengeluaran" name="id_pengeluaran" value="<?= $kode ?>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="tgl" class="col-sm-4 col-form-label">Tanggal</label>
                    <div class="col-sm-8">
                    <input type="date" class="form-control" id="tgl" name="tgl" placeholder="Tanggal" value="<?= date('Y-m-d')?>">
                    </div>
                </div>
                <hr>
                <div class="form-group row">
                    <label for="sumber_pmb" class="col-sm-4 col-form-label">Sumber Pengeluaran</label>
                    <div class="col-sm-8">
                    <!-- <input type="text" class="form-control" name="sumber_pmb" id="sumber_pmb" placeholder="Sumber Pengeluaran" required> -->
                    <select name="sumber_pmb" id="sumber_pmb" class="form-control" required>
                        <option value="">-</option>
                        <?php foreach ($aktivitas as $key => $value) { ?>
                        <option value="<?= $value->nama_aktivitas?>"><?= $value->nama_aktivitas?></option>
                        <?php } ?>
                    </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="beban" class="col-sm-4 col-form-label">Jenis Pengeluaran</label>
                    <div class="col-sm-8">
                    <select name="beban" id="beban" class="form-control">
                        <option value="">-</option>
                        <?php foreach ($beban as $key => $value) { ?>
                        <option value="<?= $value->nama_coa?>"><?= $value->nama_coa?></option>
                        <?php } ?>
                    </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="jenis_pmb" class="col-sm-4 col-form-label">Jenis Pembayaran</label>
                    <div class="col-sm-8">
                    <select name="jenis_pmb" id="jenis_pmb" class="form-control">
                        <option value="">-</option>
                        <option value="Tunai">Tunai</option>
                        <option value="Non Tunai">Non Tunai</option>
                    </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="nominal" class="col-sm-4 col-form-label">Nominal</label>
                    <div class="col-sm-8">
                    <input type="text" class="form-control" name="nominal" id="nominal" placeholder="Nominal" required>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
        </form>
        </div>
    </div>
</div>