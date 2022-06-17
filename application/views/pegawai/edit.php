<?php foreach ($list as $item) { ?>
    <div class="modal fade bd-example-modal-lg" id="edit_<?= $item->id?>" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="exampleModalLabel">Edit Pegawai</h5>
                </div>
                <form action="<?= base_url('c_masterdata/edit_peg')?>" method="post">
                <div class="modal-body">
                    <div class="row">
                        <input type="hidden" value="<?= $item->id?>" name="id">
                        <input type="hidden" value="<?= $item->nip?>" name="nip">
                        <div class="col-sm-6">
                            <div class="form-group row">
                                <label for="nama" class="col-sm-4 col-form-label">Nama Pegawai</label>
                                <div class="col-sm-8">
                                    <input type="text" name="nama" class="form-control" id="nama" placeholder="Nama Pegawai" value="<?= $item->nama?>" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="alamat" class="col-sm-4 col-form-label">Alamat</label>
                                <div class="col-sm-8">
                                    <textarea name="alamat" id="alamat" cols="10" rows="5" class="form-control" placeholder="Alamat" value="<?= $item->alamat?>" required><?= htmlspecialchars($item->alamat) ?></textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="no_telp" class="col-sm-4 col-form-label">No Telp</label>
                                <div class="col-sm-8">
                                    <input type="text" name="no_telp" class="form-control" id="no_telp" placeholder="No Telp" value="<?= $item->no_telp?>" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="tempat_lahir" class="col-sm-4 col-form-label">Tempat Lahir</label>
                                <div class="col-sm-8">
                                    <input type="text" name="tempat_lahir" class="form-control" id="tempat_lahir" placeholder="Tempat Lahir" value="<?= $item->tempat_lahir?>" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="ttl" class="col-sm-4 col-form-label">Tanggal Lahir</label>
                                <div class="col-sm-8">
                                    <input type="date" name="ttl" value="<?= $item->tgl_lahir?>" class="form-control" id="ttl" required>
                                </div>
                            </div>
                        </div>

                        <!-- kanan -->
                        <div class="col-sm-6">
                            <div class="form-group row">
                                <label for="desc" class="col-sm-3 col-form-label">Jabatan</label>
                                <div class="col-sm-9">
                                    <select name="jabatan" id="jabatan" class="form-control">
                                        <option value="">-</option>
                                        <?php foreach ($jabatan as $key => $value) { ?>
                                            <option <?php if ($item->id_jabatan == $value->desc) {
                                                echo ("selected");
                                            }?>><?= $value->desc?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="desc" class="col-sm-3 col-form-label">Jenis Pegawai</label>
                                <div class="col-sm-9">
                                    <select name="jp" id="jp" class="form-control">
                                        <option value="">-</option>
                                        <?php foreach ($jp as $key => $value) { ?>
                                            <option <?php if ($item->id_jenis_pegawai == $value->desc) {
                                                echo ("selected");
                                            }?>><?= $value->desc?></option>
                                        <?php } ?>
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
                                            <option <?php if ($item->id_ptkp == $value->desc) {
                                                echo ("selected");
                                            }?>><?= $value->desc ?></option>
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
                                        <option value="BCA"<?= ($item->nama_bank == 'BCA') ? 'selected' : ''; ?>>BCA</option>
                                        <option value="Mandiri"<?= ($item->nama_bank == 'Mandiri') ? 'selected' : ''; ?>>Mandiri</option>
                                        <option value="BRI"<?= ($item->nama_bank == 'BRI') ? 'selected' : ''; ?>>BRI</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="no_rek" class="col-sm-3 col-form-label">No Rek</label>
                                <div class="col-sm-9">
                                    <input type="text" name="no_rek" class="form-control" id="no_rek" placeholder="No Rekening" value="<?= $item->no_rek?>" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" required>
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
<?php } ?>