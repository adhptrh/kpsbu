<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <h5 class="modal-title" id="exampleModalLabel">Tambah Produk</h5>
        </div>
        <form action="<?= base_url('Produk/save')?>" method="POST">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="kode" class="col-sm-3 col-form-label">Kode Produk</label>
                    <div class="col-sm-9">
                    <input type="text" class="form-control" id="kode" value="<?= $kode ?>" name="kode" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="barcode" class="col-sm-3 col-form-label">No. Barcode</label>
                    <div class="col-sm-9">
                    <input type="text" class="form-control" id="barcode" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" name="barcode" placeholder="No. Barcode" required>
                    </div>
                </div>
                <hr>
                <div class="form-group row">
                    <label for="supplier" class="col-sm-3 col-form-label">Supplier</label>
                    <div class="col-sm-9">
                        <select name="supplier" id="supplier" class="form-control" required>
                            <option value="">Pilih Supplier</option>
                            <?php foreach ($supplier as $key => $value) { ?>
                            <option value="<?= $value->kode?>"><?= $value->nama?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="kategori" class="col-sm-3 col-form-label">Kategori</label>
                    <div class="col-sm-9">
                        <select name="kategori" id="kategori" class="form-control" required>
                            <option value="">Pilih Kategori</option>
                            <?php foreach ($kategori as $key => $value) { ?>
                                <option value="<?= $value->kode?>"><?= $value->deskripsi?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                
                <div class="form-group row">
                    <label for="produk" class="col-sm-3 col-form-label">Nama Produk</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="produk" placeholder="Nama Produk" name="produk" required>
                    </div>
                    <div class="col-sm-3">
                        <select name="satuan" id="satuan" class="form-control" required>
                            <option value="">Satuan</option>
                            <option value="pcs">pcs</option>
                            <option value="kilo">kilo</option>
                            <option value="gram">gram</option>
                            <option value="pasang">pasang</option>
                        </select>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="harga" class="col-sm-3 col-form-label">Harga Satuan</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="desc2" placeholder="Harga Satuan" required>
                        <input type="hidden" class="form-control" id="desc" placeholder="Harga Satuan" name="harga"  required>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="harga_jual" class="col-sm-3 col-form-label">Harga Jual</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="harga_jual2" placeholder="Harga Jual" required>
                        <input type="hidden" class="form-control" id="harga_jual" placeholder="Harga Jual" name="harga_jual"  required>
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
<script>
    function formatRupiah(angka, prefix){
			var number_string = angka.replace(/[^,\d]/g, '').toString(),
			split   		= number_string.split(','),
			sisa     		= split[0].length % 3,
			rupiah     		= split[0].substr(0, sisa),
			ribuan     		= split[0].substr(sisa).match(/\d{3}/gi);
 
			// tambahkan titik jika yang di input sudah menjadi angka ribuan
			if(ribuan){
				separator = sisa ? '.' : '';
				rupiah += separator + ribuan.join('.');
			}
 
			rupiah = split[1] != undefined ? rupiah + ',' + split[1] : rupiah;
			return prefix == undefined ? rupiah : (rupiah ? 'Rp. ' + rupiah : '');
		}
    $("#desc2").on("input",()=>{
        $("#desc2").val(formatRupiah($("#desc2").val()))
        $("#desc").val($("#desc2").val().replaceAll(".",""))
    })
    $("#harga_jual2").on("input",()=>{
        $("#harga_jual2").val(formatRupiah($("#harga_jual2").val()))
        $("#harga_jual").val($("#harga_jual2").val().replaceAll(".",""))
    })
</script>