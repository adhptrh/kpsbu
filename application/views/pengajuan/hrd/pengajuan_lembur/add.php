<!-- Modal -->
<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="exampleModalLabel">Pengajuan Lembur</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form action="<?= base_url('Lembur/save')?>" method="post">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="id_pengajuan" class="col-sm-4 col-form-label">ID Pengajuan</label>
                    <div class="col-sm-8">
                    <input type="text" class="form-control" id="id_pengajuan" name="id_pengajuan" value="<?= $kode ?>" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="tgl" class="col-sm-4 col-form-label">Tanggal Pengajuan</label>
                    <div class="col-sm-8">
                    <input type="date" class="form-control" id="tgl" name="tgl" placeholder="Tanggal" value="<?= date('Y-m-d')?>">
                    </div>
                </div>
                <hr>
                <div class="form-group row">
                    <label for="nama" class="col-sm-4 col-form-label">Nama Pegawai</label>
                    <div class="col-sm-8">
                        <input type="hidden" name="nip" value="<?= $pegawai->nip ?>">
                        <input type="text" name="nama" class="form-control" value="<?= $pegawai->nama ?>" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="jam" class="col-sm-4 col-form-label">Jam Lembur</label>
                    <div class="col-sm-8">
                    <input type="number" class="form-control" min="1" max="6" id="jam" name="jam" value="1">
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