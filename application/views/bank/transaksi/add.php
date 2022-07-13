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
                <input class="form-control" type="text" name="nominal" required>
            </div>
            <div class="form-group">
                <label>Bunga Bank</label>
                <input class="form-control" type="text" name="bunga" required>
            </div>
            <div class="form-group">
                <label>Pajak</label>
                <input class="form-control" type="text" name="pajak" required>
            </div>
            <div class="form-group">
                <label>Biaya Admin</label>
                <input class="form-control" type="text" name="biaya_admin" required>
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