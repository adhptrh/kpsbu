<div class="x_panel">
    <div class="x_title">
        <h3>Transaksi Bank</h3>
    </div>
    <div class="x_content">
        <form method="post" action="<?= base_url("c_transaksi/transaksi_bank_submit") ?>" enctype="multipart/form-data">
            <div class="form-group">
                <label>Tanggal</label>
                <input class="form-control" type="date" name="tanggal" value="<?= date('Y-m-d')?>" required>
            </div>
            <div class="form-group">
                <label>Nama Bank</label>
                <select name="nama_bank" class="form-control">
                    <?php
                    foreach ($bank as $b) {
                        echo '<option value="'.$b->id_bank.'">'.$b->nama_bank.'</option>';
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label>Uraian</label>
                <input class="form-control" type="text" name="uraian" required>
            </div>
            <div class="form-group">
                <label>Bukti Transaksi</label>
                <input type="file" name="bukti_transaksi" required>
            </div>
            <div class="form-group">
                <label>Nominal</label>
                <input class="form-control inputtitik" type="text" min="0" name="nominal" required>
            </div>
            <div class="form-group">
                <label>Bunga Bank</label>
                <input class="form-control inputtitik" type="text" min="0" name="bunga" required>
            </div>
            <div class="form-group">
                <label>Pajak</label>
                <input class="form-control inputtitik" type="text" min="0" name="pajak" required>
            </div>
            <div class="form-group">
                <label>Biaya Admin</label>
                <input class="form-control inputtitik" type="text" min="0" name="biaya_admin" required>
            </div>
            <div class="form-group">
                <label>Jenis Transaksi</label>
                <select class="form-control" name="jenis_transaksi">
                    <option value="debit">Debit</option>
                    <option value="kredit">Kredit</option>
                </select>
            </div>
            <div class="form-group">
                <button class="btn btn-primary" type="submit">Simpan</button>
            </div>
        </form>
    </div>
</div>

<script>
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
            $(document).ready(()=>{
                $(".inputtitik").keyup((e)=>{
                    var nominal = $(e.target).val()
                    $(e.target).val(formatRupiah(nominal))
                })
            })
            </script>