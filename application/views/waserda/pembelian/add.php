<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Tambah Pembelian</h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <form action="<?= base_url('Pembelian/add_to_detail')?>" method="POST">
                    <div class="modal-body">
                        <div class="form-group row">
                            <label for="kode" class="col-sm-3 col-form-label">No Nota</label>
                            <div class="col-sm-9">
                            <input type="text" class="form-control" id="kode" name="kode" value="<?= $kode ?>" readonly>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="tanggal" class="col-sm-3 col-form-label">Tanggal</label>
                            <div class="col-sm-9">
                            <input type="date" class="form-control" id="tanggal" value="<?= date('Y-m-d')?>" name="tanggal" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="supplier" class="col-sm-3 col-form-label">Supplier</label>
                            <div class="col-sm-9">
                                <select name="supplier" id="supplier" class="form-control" required>
                                    <option value="">-</option>
                                    <?php foreach ($supplier as $key => $value) { ?>
                                    <option value="<?= $value->kode ?>"><?= $value->nama?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="tanggal_kadaluwarsa" class="col-sm-3 col-form-label">Tanggal Kadaluwarsa</label>
                            <div class="col-sm-9">
                            <input type="date" class="form-control" id="tanggal_kadaluwarsa" value="<?= date('Y-m-d')?>" name="tanggal_kadaluwarsa" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="produk" class="col-sm-3 col-form-label">Produk</label>
                            <div class="col-sm-9">
                                <select name="produk" id="produk" class="form-control" required>
                                    <option value="">-</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="harga" class="col-sm-3 col-form-label">Harga Satuan</label>
                            <div class="col-sm-7">
                                <input type="text" name="harga" id="harga" class="form-control" value="0" readonly>
                            </div>
                            <div class="col-sm-2">
                                <input type="number" value="1" min="1" class="form-control" name="jml" required>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-sm pull-right">Tambah Produk</button>
                    </div>
                </form>
                <hr>
                <h5><b>Detail Pembelian</b></h5>
                <!-- <div class="table-responsive"> -->
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Supplier</th>
                                <th>Nama Produk</th>
                                <th>Jumlah</th>
                                <th>Harga Satuan</th>
                                <th>Tanggal Kadaluwarsa</th>
                                <th class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                                $no = 1;
                                foreach ($detail as $key => $value) { ?>
                                <tr>
                                    <td><?= $no++ ?></td>
                                    <td>
                                        <?= $value->id_supplier?> - <b><?= $value->nama?></b>
                                    </td>
                                    <td>
                                        <?= $value->id_produk?> - <b><?= $value->nama_produk?></b>
                                    </td>
                                    <td><?= $value->jml?></td>
                                    <td><?= format_rp($value->harga_satuan)?></td>
                                    <td><?= $value->tanggal_kadaluwarsa ?></td>
                                    <td class="text-center">
                                        <button class="btn btn-xs btn-danger" onclick="hapus(<?= $value->id?>)"><i class="fa fa-trash"></i></button>
                                    </td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-sm-2">
                            <h5>Total Pembelian</h5>
                        </div>
                        <div class="col-sm-5">
                            <h5>
                                <b><?= format_rp($total) ?></b>
                            </h5>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <h5>PPN 11%</h5>
                        </div>
                        <div class="col-sm-5">
                            <h5>
                                <?php $rumus = $total * 0.11 ?>
                                <b><?= format_rp($rumus)?></b>
                            </h5>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <h5>Grand Total</h5>
                        </div>
                        <div class="col-sm-5">
                            <h5>
                                <b><?= format_rp($total + $rumus) ?></b>
                            </h5>
                        </div>
                    </div>

                    <form action="<?= base_url('Pembelian/simpan_produk')?>" method="post">
                    <input type="hidden" name="id" value="<?= $kode ?>">
                    <input type="hidden" name="total" value="<?= $total ?>">
                    <input type="hidden" name="ppn" value="<?= $ppn ?>">
                    <input type="hidden" name="grandtotal" value="<?= $grandtotal ?>">
                    <?php foreach ($id_bb as $key => $value) { ?>
                        <input type="hidden" name="id_bb[]" value="<?= $value->id_produk?>">
                    <?php } ?>
                    <br>

                    <?php if (count($detail) > 0) { ?>
                        <button type="submit" class="btn btn-sm btn-primary">Simpan</button>
                    <?php } ?>
                    <a href="<?= base_url('Pembelian')?>" class="btn btn-sm btn-default">Kembali</a>
                    </form>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        $('#supplier').on('change', function() {
            var supplier = $(this).val()
            // console.log(supplier)
            if (supplier != '') {
				$.ajax({
                    url:"<?php echo base_url("Pembelian/supplier")?>",
                    method:"POST",
                    data:{ supplier : supplier},
                    success:function(data) {
                        $("#produk").html(data);
                    }
				});
			}
        })

        $('#produk').on('change', function() {
            var produk = $(this).val()
            console.log(produk)
            $("#harga").val(0)
            $.ajax({
                url : "<?= base_url('Pembelian/produk/')?>"+produk,
                method : "POST",
                success:function(e){
                    var obj = JSON.parse(e)
                    $("#harga").val(obj.harga_satuan)
                }
            })
        })
    })
</script>
<script>
    function hapus(id) {
        // alert(id)
        $.ajax({
            url : "<?= base_url('Pembelian/hapus_detail/')?>"+id, 
            method : "POST", 
            success:function(e){
                var obj = JSON.parse(e)
                location.reload()
            }
        })
    }
</script>
