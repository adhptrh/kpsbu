<div class="x_panel">
    <div class="x_title">
        <h3>Transaksi Bank</h3>
    </div>
    <div class="x_content">
        <form>
            <div class="form-group">
                <label>Tanggal</label>
                <input class="form-control" type="month" name="tanggal" value="<?= date('Y-m')?>" required>
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
                <label>No rekening</label>
                <input class="form-control" type="text" name="no_rek" required>
            </div>
            <div class="form-group">
                <label>Uraian</label>
                <input class="form-control" type="text" name="uraian" required>
            </div>
            <div class="form-group">
                <label>Tanggal</label>
                <input class="form-control" type="date" name="uraian" value="<?= date("Y-m-d") ?>" required>
            </div>
            <div class="form-group">
                <label>Bukti Transaksi</label>
                <input class="form-control" type="text" name="bukti_transaksi" required>
            </div>
            <div class="form-group">
                <label>Pemasukan</label>
                <input class="form-control" type="text" name="bukti_transaksi" required>
            </div>
        </form>
            <div class="form-group">
                <label>Pengeluaran</label>
                <input class="form-control" type="text" name="bukti_transaksi" required>
            </div>
        </form>
            <div class="form-group">
                <label>Input Salo</label>
                <input class="form-control" type="text" name="bukti_transaksi" required>
            </div>
        </form>
        </form>
    </div>
</div>