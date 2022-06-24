<!-- Modal -->
<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="exampleModalLabel">Pengajuan Bonus</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form action="<?= base_url('Pengajuan/savePengajuanBonus')?>" method="post">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="id_pengajuan" class="col-sm-4 col-form-label">ID Pengajuan</label>
                    <div class="col-sm-8">
                    <input type="text" class="form-control" id="id_pengajuan" name="id_pengajuan"  value="<?= $kode ?>" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="tgl" class="col-sm-4 col-form-label">Periode</label>
                    <div class="col-sm-8">
                    <input type="month" class="form-control" id="tgl" name="tgl" placeholder="Tanggal" value="<?= date('Y-m')?>">
                    </div>
                </div>
                <hr>
                <div class="form-group row">
                    <label for="nama" class="col-sm-4 col-form-label">Nama Pegawai</label>
                    <div class="col-sm-8">
                        <select style="width: 100% !important;" name="nama[]" multiple="multiple" class="form-control js-example-basic-multiple" required>
                            <?php foreach ($pegawai as $item) { ?>
                            <option value="<?= $item->nip?>"><?= $item->nama?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="jumlah" class="col-sm-4 col-form-label">Nominal</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="jumlah" id="jumlah" placeholder="Jumlah Pengajuan" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="desc" class="col-sm-4 col-form-label">Keterangan</label>
                    <div class="col-sm-8">
                        <textarea name="desc" id="desc" cols="10" rows="5" class="form-control" placeholder="Deskripsi"></textarea>
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