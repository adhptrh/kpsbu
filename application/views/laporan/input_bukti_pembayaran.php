<div class="x_panel">
    <div class="x_title">
        <h4>Input Bukti Pembayaran</h4>
    </div>
    <div class="x_content">
        <form method="post" enctype="multipart/form-data" action="<?= base_url("c_transaksi/bukti_pembayaran_pengajuan_jurnal") ?>">
            <div class="form-group">
                <label>Kode</label>
                <input name="kode" class="form-control" value="<?= $kode ?>" readonly>
            </div>
            <div class="form-group">
                <label>Upload Bukti Pembayaran</label>
                <input name="buktipem" type="file">
            </div>
            <div class="form-group">
                <button class="btn btn-primary">Simpan</button>
            </div>
        </form>
    </div>
</div>