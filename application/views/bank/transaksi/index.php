<div class="x_panel">
    <div class="x_title">
        <h3>Transaksi Bank</h3>
    </div>
    <div class="x_content">
        <a href="add_transaksi_bank" class="btn btn-primary">Tambah Transaksi</a>
        <table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Tanggal</th>
                    <th>Uraian</th>
                    <th>Bukti Transaksi</th>
                    <th>Nominal</th>
                    <th>Bunga Bank</th>
                    <th>Pajak</th>
                    <th>Biaya Admin</th>
                    <th>Jenis Transaksi</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($transaksi as $k=>$d) { ?>
                    <tr>
                        <td><?=$k+1?></td>
                        <td><?=$d->tanggal?></td>
                        <td><?=$d->keterangan?></td>
                        <td><?=$d->bukti_transaksi?></td>
                        <td class="text-right"><?= format_rp($d->nominal)?></td>
                        <td class="text-right"><?= format_rp($d->bunga)?></td>
                        <td class="text-right"><?= format_rp($d->pajak)?></td>
                        <td class="text-right"><?= format_rp($d->biaya_admin)?></td>
                        <td><?= $d->posisi_dr_cr == "d" ? "Pemasukan":"Pengeluaran" ?></td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
        <script>
            $(document).ready(()=>{
                $("#datatable").DataTable()
            })
            </script>
    </div>
</div>