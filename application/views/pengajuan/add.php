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
        <form action="<?= base_url('Pengajuan/save')?>" method="post">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="tgl" class="col-sm-4 col-form-label">Tanggal Pengajuan</label>
                    <div class="col-sm-8">
                    <input type="datetime-local" class="form-control" id="tgl" name="tgl" placeholder="Tanggal" value="<?= date('Y-m-d')?>">
                    </div>
                </div>
                <hr>
                <div class="form-group row">
                    <label for="nama" class="col-sm-4 col-form-label">Nama Barang</label>
                    <div class="col-sm-8">
                        <select name="nama" id="nama" class="form-control" required>
                            <option value="">-</option>
                            <?php foreach ($barang as $item) { ?>
                            <option value="<?= $item->nama_produk?>"><?= $item->nama_produk?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="jumlah" class="col-sm-4 col-form-label">Jumlah Pengajuan</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="jumlah" id="jumlah" placeholder="Jumlah Pengajuan" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="desc" class="col-sm-4 col-form-label">Deskripsi</label>
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