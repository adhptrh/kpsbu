<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <h3 class="modal-title" id="exampleModalLabel">Pembagian SHU</h3>
        </div>
        <form action="<?= base_url('shu/save_jasa_anggota')?>" method="POST">
            <div class="modal-body">

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="anggota" class="col-sm-5 col-form-label">Kode</label>
                            <div class="col-sm-7">
                                <input type="text" value="<?= $kode ?>" class="form-control" name="kode" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="anggota" class="col-sm-5 col-form-label">Anggota</label>
                            <div class="col-sm-7">
                                <select name="anggota" class="form-control" id="anggota" required>
                                    <option value="">-</option>
                                    <?php foreach ($anggota as $key => $value) { ?>
                                    <option value="<?= $value->no_peternak?>"><?= $value->nama_peternak?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row show-div">
                    <hr>
                    <div class="col-sm-6">
                        <h5>Jasa Modal</h5>
                        <hr>
                        <div class="form-group row">
                            <label for="total_modal" class="col-sm-5 col-form-label">Pembagian Jasa Modal</label>
                            <div class="col-sm-7">
                                <input type="text" name="total_modal" id="total_modal" class="form-control" readonly>
                            </div>
                        </div>
    
                        <div class="form-group row">
                            <label for="total_simpanan" class="col-sm-5 col-form-label">Total Simpanan</label>
                            <div class="col-sm-7">
                                <input type="text" name="total_simpanan" id="total_simpanan" class="form-control" readonly>
                            </div>
                        </div>
    
                        <div class="form-group row">
                            <label for="total_simpanan_anggota" class="col-sm-5 col-form-label">Total Simpanan Anggota</label>
                            <div class="col-sm-7">
                                <input type="text" name="total_simpanan_anggota" id="total_simpanan_anggota" class="form-control" readonly required>
                            </div>
                        </div>

                        <!-- <div class="form-group row">
                            <label for="jasa_modal" class="col-sm-5 col-form-label">Total Jasa Modal</label>
                            <div class="col-sm-7">
                                <input type="text" name="jasa_modal" id="jasa_modal" class="form-control" readonly required>
                            </div>
                        </div>
                        <span style="color: red; margin-bottom:10px;">*nilai desimal akan dibulatkan pada saat disimpan.</span> -->
                    </div>

                    <!-- kanan -->
                    <div class="col-sm-6">
                        <h5>Jasa Anggota</h5>
                        <hr>
                        <div class="form-group row">
                            <label for="jasa_anggota" class="col-sm-5 col-form-label">Pembagian Jasa Anggota</label>
                            <div class="col-sm-7">
                                <input type="text" name="jasa_anggota" id="jasa_anggota" class="form-control" readonly>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="total_penjualan" class="col-sm-5 col-form-label">Total Penjualan</label>
                            <div class="col-sm-7">
                                <input type="text" name="total_penjualan" id="total_penjualan" class="form-control" readonly>
                            </div>
                        </div>
    
    
                        <div class="form-group row">
                            <label for="total_trans_susu" class="col-sm-5 col-form-label">Total Transaksi Susu</label>
                            <div class="col-sm-7">
                                <input type="text" name="total_trans_susu" id="total_trans_susu" class="form-control" readonly required>
                            </div>
                        </div>

                        <!-- <div class="form-group row">
                            <label for="total_jasa_anggota" class="col-sm-5 col-form-label">Total Jasa Anggota</label>
                            <div class="col-sm-7">
                                <input type="text" name="total_jasa_anggota" id="total_jasa_anggota" class="form-control" readonly required>
                            </div>
                        </div> -->
                    </div>
                </div>
                <div class="row show-div">
                    <hr>
                    <div class="col-sm-6">
                        <div class="form-group row">
                                <label for="jasa_modal" class="col-sm-5 col-form-label">Total Jasa Modal</label>
                                <div class="col-sm-7">
                                    <input type="text" name="jasa_modal" id="jasa_modal" class="form-control" readonly required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="total_jasa_anggota" class="col-sm-5 col-form-label">Total Jasa Anggota</label>
                                <div class="col-sm-7">
                                    <input type="text" name="total_jasa_anggota" id="total_jasa_anggota" class="form-control" readonly required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="sisa_hasil_usaha" class="col-sm-5 col-form-label">Sisa Hasil Usaha</label>
                                <div class="col-sm-7">
                                    <input type="text" name="sisa_hasil_usaha" id="sisa_hasil_usaha" class="form-control" readonly>
                                </div>
                            </div>
                            <span style="color: red; margin-bottom:10px;">*nilai desimal akan dibulatkan pada saat disimpan.</span>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" id="btn_simpan">Simpan</button>
            </div>
        </form>
        </div>
    </div>
</div>