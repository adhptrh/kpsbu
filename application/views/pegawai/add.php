<div class="modal fade bd-example-modal-lg" id="add" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h5 class="modal-title" id="exampleModalLabel">Tambah Pegawai</h5>
            </div>
            <form action="<?= base_url('c_masterdata/save_pegawai')?>" method="post">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="username" class="col-sm-2 col-form-label">Username</label>
                    <div class="col-sm-6">
                        <input type="text" name="username" class="form-control" id="username" placeholder="Username" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="password" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-6">
                        <input type="password" name="password" class="form-control" id="password" placeholder="Password" required>
                    </div>
                </div>
                <hr>
                <div class="form-group row">
                    <label for="nip" class="col-sm-2 col-form-label">NIP</label>
                    <div class="col-sm-6">
                        <input type="text" name="nip" class="form-control" value="<?= $nip ?>" id="nip" placeholder="NIP" required readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="npwp" class="col-sm-2 col-form-label">NPWP</label>
                    <div class="col-sm-6">
                        <input type="text" name="npwp" class="form-control" id="npwp" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" placeholder="NPWP" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="rfid" class="col-sm-2 col-form-label">RFID</label>
                    <div class="col-sm-6">
                        <input type="text" name="rfid" class="form-control" id="rfid" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" placeholder="RFID" required>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="nama" class="col-sm-4 col-form-label">Nama Pegawai</label>
                            <div class="col-sm-8">
                                <input type="text" name="nama" class="form-control" id="nama" placeholder="Nama Pegawai" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="alamat" class="col-sm-4 col-form-label">Alamat</label>
                            <div class="col-sm-8">
                                <textarea name="alamat" id="alamat" cols="10" rows="5" class="form-control" placeholder="Alamat" required></textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="no_telp" class="col-sm-4 col-form-label">No Telp</label>
                            <div class="col-sm-8">
                                <input type="text" name="no_telp" class="form-control" id="no_telp" placeholder="No Telp" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="tempat_lahir" class="col-sm-4 col-form-label">Tempat Lahir</label>
                            <div class="col-sm-8">
                                <input type="text" name="tempat_lahir" class="form-control" id="tempat_lahir" placeholder="Tempat Lahir" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="ttl" class="col-sm-4 col-form-label">Tanggal Lahir</label>
                            <div class="col-sm-8">
                                <input type="date" name="ttl" class="form-control" id="ttl" required>
                            </div>
                        </div>
                    </div>

                    <!-- kanan -->
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="jabatan" class="col-sm-3 col-form-label">Jabatan</label>
                            <div class="col-sm-9">
                                <select name="jabatan" id="jabatan" class="form-control">
                                    <option value="">-</option>
                                    <?php foreach ($jabatan as $key => $value) { ?>
                                    <option value="<?= $value->desc?>"><?= $value->desc?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="jp" class="col-sm-3 col-form-label">Jenis Pegawai</label>
                            <div class="col-sm-9">
                                <select name="jp" id="jp" class="form-control">
                                    <option value="">-</option>
                                    <?php foreach ($jp as $key => $value) { ?>
                                    <option value="<?= $value->desc?>"><?= $value->desc?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="pendidikan" class="col-sm-3 col-form-label">Pendidikan</label>
                            <div class="col-sm-9">
                                <select name="pendidikan" id="pendidikan" class="form-control">
                                </select>
                            </div>
                        </div>
                        <div id="hide_ptkp">
                        <div class="form-group row">
                            <label for="desc" class="col-sm-3 col-form-label">PTKP</label>
                            <div class="col-sm-9">
                                <select name="ptkp" id="ptkp" class="form-control">
                                    <option value="">-</option>
                                    <?php foreach ($ptkp as $key => $value) { ?>
                                    <option value="<?= $value->desc?>"><?= $value->desc?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        </div>
                        <div class="form-group row">
                            <label for="nama_bank" class="col-sm-3 col-form-label">Bank</label>
                            <div class="col-sm-9">
                                <select name="nama_bank" id="nama_bank" class="form-control" required>
                                    <option value="">-</option>
                                    <option value="BCA">BCA</option>
                                    <option value="Mandiri">Mandiri</option>
                                    <option value="BRI">BRI</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="no_rek" class="col-sm-3 col-form-label">No Rek</label>
                            <div class="col-sm-9">
                                <input type="text" name="no_rek" class="form-control" id="no_rek" placeholder="No Rekening" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" required>
                            </div>
                        </div>
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