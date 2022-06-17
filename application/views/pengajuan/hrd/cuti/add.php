<!-- Modal -->
<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title" id="exampleModalLabel">Pengajuan Cuti</h4>
        </div>
        <form action="<?= base_url('Cuti/save')?>" method="post">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="id_pengajuan" class="col-sm-4 col-form-label">ID Pengajuan</label>
                    <div class="col-sm-8">
                    <input type="text" class="form-control" id="id_pengajuan" name="id_pengajuan" value="<?= $kode ?>" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="" class="col-sm-4 col-form-label">Tgl. Pengajuan Cuti</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="start" name="start" placeholder="Tgl. Mulai" required>
                    </div>
                    <div class="col-sm-2">
                        <input type="text" value="s/d" class="form-control text-center" readonly>
                    </div>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="end" name="end" placeholder="Tgl. Selesai" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="jml_hari_cuti" class="col-sm-4 col-form-label">Jumlah Hari Cuti</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="jml_hari_cuti" name="jml_hari_cuti" value="0" readonly>
                        <div id="info"></div>
                    </div>
                </div>
                <hr>
                <div class="form-group row">
                    <label for="nama_pegawai" class="col-sm-4 col-form-label">Nama Pegawai</label>
                    <div class="col-sm-8">
                        <input type="hidden" value="<?= $pegawai->nip ?>" name="nip" class="form-control" readonly>
                        <input type="text" value="<?= $pegawai->nama ?>" name="nama_pegawai" class="form-control" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="desc" class="col-sm-4 col-form-label">Alasan Cuti</label>
                    <div class="col-sm-8">
                        <textarea name="desc" id="desc" cols="10" rows="5" class="form-control" placeholder="Alasan Cuti"></textarea>
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