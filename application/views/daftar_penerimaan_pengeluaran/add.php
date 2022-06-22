<div class="modal fade bd-example-modal-lg" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <h5 class="modal-title" id="exampleModalLabel">Penerimaan & Pengeluaran Kas</h5>
        </div>
        <form action="#" method="POST">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="periode" class="col-sm-3 col-form-label">Peridoe</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="periode" name="periode" value="<?= date('Ym')?>" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="tanggal" class="col-sm-3 col-form-label">Tanggal</label>
                    <div class="col-sm-5">
                        <input type="date" class="form-control" id="tanggal" name="tanggal">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="no_dokumen" class="col-sm-3 col-form-label">No. Dokumen</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="no_dokumen" name="no_dokumen" placeholder="No. Dokumen">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="deskripsi" class="col-sm-3 col-form-label">Deskripsi</label>
                    <div class="col-sm-5">
                        <textarea name="deskripsi" id="deskripsi" cols="10" rows="5" class="form-control" placeholder="Deskripsi"></textarea>
                    </div>
                </div>
                <hr>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>No. Akun</th>
                            <th>Nama Akun</th>
                            <th>Tanggal Transaksi</th>
                            <th>Aktivitas</th>
                            <th>Jenis Transaksi</th>
                            <th>Nominal</th>
                            <th>Posisi Debit/Kredit</th>
                            <th>Tipe Pembayaran</th>
                            <th>Bukti Upload</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="text"></td>
                            <td><input type="text"></td>
                            <td><input type="text"></td>
                            <td><input type="text"></td>
                            <td><input type="text"></td>
                            <td><input type="text"></td>
                            <td><input type="text"></td>
                            <td><input type="text"></td>
                            <td><input type="text"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Simpan</button>
            </div>
        </form>
        </div>
    </div>
</div>