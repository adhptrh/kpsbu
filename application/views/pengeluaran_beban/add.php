<!-- Modal -->
<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="exampleModalLabel">Pengeluaran Beban</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form action="<?= base_url('Pengeluaran_beban/save')?>" method="post">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="id_pengeluaran" class="col-sm-4 col-form-label">ID Pengeluaran Beban</label>
                    <div class="col-sm-8">
                    <input type="text" readonly class="form-control" id="id_pengeluaran" name="id_pengeluaran" value="<?= $kode ?>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="tgl" class="col-sm-4 col-form-label">Tgl. Pengeluaran</label>
                    <div class="col-sm-8">
                    <input type="date" class="form-control" id="tgl" name="tgl" placeholder="Tanggal" value="<?= date('Y-m-d')?>">
                    </div>
                </div>
                <hr>
                <div class="form-group row">
                    <label for="no_coa" class="col-sm-4 col-form-label">Nama Beban</label>
                    <div class="col-sm-8">
                    <select name="no_coa" id="no_coa" class="form-control" required>
                        <option value="">-</option>
                        <?php foreach ($beban as $key => $value) { ?>
                        <option value="<?= $value->no_coa?>"><?= $value->nama_coa?></option>
                        <?php } ?>
                    </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="Keterangan" class="col-sm-4 col-form-label">Keterangan</label>
                    <div class="col-sm-8">
                        <textarea name="keterangan" id="keterangan" cols="10" rows="5" class="form-control" placeholder="Keterangan" required></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="nominal" class="col-sm-4 col-form-label">Nominal</label>
                    <div class="col-sm-8">
                    <input type="text" class="form-control" name="nominal" id="nominal" placeholder="Nominal" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" required>
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