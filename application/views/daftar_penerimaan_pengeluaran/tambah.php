<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Penerimaan & Pengeluaran Kas</h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <form action="<?= base_url('DaftarPenerimaanPengeluaranKas/simpan')?>" method="POST" enctype="multipart/form-data">
                    <div class="modal-body">
                        <div class="form-group row">
                            <label for="periode" class="col-sm-2 col-form-label">Periode</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="periode" name="periode" value="<?= date('Ym')?>" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="tanggal" class="col-sm-2 col-form-label">Tanggal</label>
                            <div class="col-sm-5">
                                <input type="date" class="form-control" id="tanggal" name="tanggal" value="<?= date('Y-m-d') ?>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="no_dokumen" class="col-sm-2 col-form-label">No. Dokumen</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="no_dokumen" name="no_dokumen" readonly value="<?= $kode ?>" placeholder="No. Dokumen" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="jenis_transaksi" class="col-sm-2 col-form-label">Jenis Transaksi</label>
                            <div class="col-sm-5">
                                <select name="jenis_transaksi" id="jenis_transaksi" class="form-control">
                                    <option value="penerimaan kas">Penerimaan Kas</option>
                                    <option value="pengeluaran kas">Pengeluaran Kas</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="tipe_pembayaran" class="col-sm-2 col-form-label">Tipe Pembayaran</label>
                            <div class="col-sm-5">
                                <select name="tipe_pembayaran" id="tipe_pembayaran" class="form-control">
                                    <option value="tunai">Tunai</option>
                                    <option value="non tunai">Non Tunai</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="deskripsi" class="col-sm-2 col-form-label">Deskripsi</label>
                            <div class="col-sm-5">
                                <textarea name="deskripsi" id="deskripsi" cols="10" rows="5" class="form-control" placeholder="Deskripsi" required></textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="upload_file" class="col-sm-2 col-form-label">Upload File</label>
                            <div class="col-sm-5">
                                <input type="file" class="form-control" id="upload_file" name="upload_file">
                            </div>
                        </div>
                        <hr>
                        <button style="margin-bottom: 1rem" type="button" class="btn btn-default add-row">Tambah Baris</button>
                        <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover jambo_table dataTable no-footer" style="overflow: scroll;" id="mytable">
                            <thead>
                                <tr>
                                    <th class="text-center">No. Akun</th>
                                    <th class="text-center">Nama Akun</th>
                                    <th class="text-center">Aktivitas</th>
                                    <th class="text-center">Nominal</th>
                                    <th class="text-center">Posisi Debit/Kredit</th>
                                    <th>#</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <select name="no_coa[]" id="no_coa1" onchange="getCoa(1)" class="form-control" required>
                                            <option value="">-</option>
                                            <?php foreach ($coa as $item) { ?>
                                            <option value="<?= $item->no_coa?>"><?= $item->no_coa?> - <?= $item->nama_coa?></option>
                                            <?php } ?>
                                        </select>
                                    </td>
                                    <td><input type="text" class="form-control" id="nama_coa1" name="nama_coa[]" readonly></td>
                                    <td>
                                        <select name="nama_aktivitas[]" id="nama_aktivitas1" class="form-control">
                                        <option disabled selected value>-</option>     
                                        <?php foreach ($aktivitas as $item) { ?>
                                            <option value="<?= $item->nama_aktivitas?>"><?= $item->nama_aktivitas?></option>
                                            <?php } ?>
                                        </select>
                                    </td>
                                    <td>
                                        <input class="form-control inputtitik" type="text" min="0" name="nominal[]" id="nominal1"  required>
                                    </td>
                                    <td>
                                        <select name="posisi_dc[]" id="posisi_dc1" class="form-control">
                                            <option value="d">D</option>
                                            <option value="k">K</option>
                                        </select>
                                    </td>
                                    <td>
                                        <!-- <button type="button" class="">Hapus Baris</button> -->
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <a href="<?= base_url('DaftarPenerimaanPengeluaranKas') ?>" class="btn btn-default">Kembali</a>
                        <button class="btn btn-primary">Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function getCoa(id) {
        var value = $('#no_coa'+id).val();
        console.log(value)
        $.ajax({
            url: "<?= base_url('DaftarPenerimaanPengeluaranKas/getCoa')?>",
            type: "post", 
            data: {
                no_coa : value,
            },
            success:function(response) {
                var obj = JSON.parse(response);
                console.log(obj)
                $("#nama_coa"+id).val(obj.nama_coa);
            }
        });
    }
    function formatRupiah(angka, prefix) {
      var number_string = angka.replace(/[^,\d]/g, "").toString(),
        split = number_string.split(","),
        sisa = split[0].length % 3,
        rupiah = split[0].substr(0, sisa),
        ribuan = split[0].substr(sisa).match(/\d{3}/gi);
        console.log(number_string)

      // tambahkan titik jika yang di input sudah menjadi angka ribuan
      if (ribuan) {
        separator = sisa ? "." : "";
        rupiah += separator + ribuan.join(".");
      }

      rupiah = split[1] != undefined ? rupiah + "," + split[1] : rupiah;
      return prefix == undefined ? rupiah : rupiah ? rupiah : "";
    }
    $(document).ready(function() {
        var i = 2;
        $(".inputtitik").keyup((e)=>{
            $(".inputtitik").val(formatRupiah($(".inputtitik").val()))
            //$(".inputtitik").val($(".inputtitik_v").val().replaceAll(".",""))
        })
        $(".add-row").click(function() {
            console.log("add")
            var data = `<tr>
                            <td>
                                <select name="no_coa[]" onchange="getCoa('${i}')" id="no_coa${i}" class="form-control" required>
                                    <option value="">-</option>
                                    <?php foreach ($coa as $item) { ?>
                                    <option value="<?= $item->no_coa?>"><?= $item->no_coa?> - <?= $item->nama_coa?></option>
                                    <?php } ?>
                                </select>
                            </td>
                            <td><input type="text" class="form-control" id="nama_coa${i}" name="nama_coa[]" readonly></td>
                            <td>
                                <select name="nama_aktivitas[]" id="nama_aktivitas${i}" class="form-control" required>
                                <option disabled selected value>-</option>    
                                <?php foreach ($aktivitas as $item) { ?>
                                    <option value="<?= $item->nama_aktivitas?>"><?= $item->nama_aktivitas?></option>
                                    <?php } ?>
                                </select>
                            </td>
                            <td>
                            <input class="form-control inputtitik${i}" type="text" name="nominal[]" id="nominal${i}">
                            </td>
                            <td>
                                <select name="posisi_dc[]" id="posisi_dc${i}" class="form-control">
                                    <option value="d">D</option>
                                    <option value="k">K</option>
                                </select>
                            </td>
                            <td>
                                <button type="button" class="btn btn-danger remove-row">Hapus Baris</button>
                            </td>
                        </tr>
                        
                        \<script\>
                        $(".inputtitik${i}").keyup((e)=>{
                            $(".inputtitik${i}").val(formatRupiah($(".inputtitik${i}").val()))
                        })
                        \<\/script\>
                        `;
            $('table').append(data);
            i++;
        });

        $("#mytable").on('click', '.remove-row', function () {
            $(this).closest('tr').remove();
        });
    });
</script>