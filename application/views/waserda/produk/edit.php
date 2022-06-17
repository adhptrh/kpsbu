<?php foreach ($produk as $item) { ?>
    <div class="modal fade" id="edit_<?= $item->id ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h5 class="modal-title" id="exampleModalLabel">Edit Produk</h5>
            </div>
            <form action="<?= base_url('Produk/edit_produk')?>" method="POST">
                <div class="modal-body">

                    <input type="hidden" name="id" value="<?= $item->id ?>">

                    <div class="form-group row">
                        <label for="kode" class="col-sm-3 col-form-label">Kode Produk</label>
                        <div class="col-sm-9">
                        <input type="text" class="form-control" id="kode" value="<?= $item->kode ?>" name="kode" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="barcode" class="col-sm-3 col-form-label">No. Barcode</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="barcode" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" name="barcode" placeholder="No. Barcode" value="<?= $item->barcode_id?>" required>
                        </div>
                    </div>
                    <hr>
                    
                    <div class="form-group row">
                        <label for="produk" class="col-sm-3 col-form-label">Nama Produk</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="produk" placeholder="Nama Produk" name="produk" value="<?= $item->nama_produk?>" required>
                        </div>
                        <!-- <div class="col-sm-3">
                            <select name="satuan" id="satuan" class="form-control" required>
                                <option value="">Satuan</option>
                                <option value="pcs">pcs</option>
                                <option value="kilo">kilo</option>
                                <option value="gram">gram</option>
                                <option value="pasang">pasang</option>
                            </select>
                        </div> -->
                    </div>

                    <div class="form-group row">
                        <label for="harga" class="col-sm-3 col-form-label">Harga Satuan</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="desc" placeholder="Harga Satuan" name="harga" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" value="<?= $item->harga_satuan?>" required>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="harga_jual" class="col-sm-3 col-form-label">Harga Jual</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="harga_jual" placeholder="Harga Jual" name="harga_jual" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" value="<?= $item->harga_jual?>" required>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
            </div>
        </div>
    </div>
<?php } ?>