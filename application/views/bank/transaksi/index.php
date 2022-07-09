<div class="x_panel">
    <div class="x_title">
        <h3>Kas & Bank</h3>
    </div>
    <div class="x_content">
        <div class="form-group">
            <form class="form-inline" method="get">
               <label>Bulan Tahun</label>
               <input name="bulantahun" class="form-control" value="<?= $bulantahun ?>" type="month">
               <button class="btn btn-primary">Filter</button>
           </form>
        </div>
        <div class="row">
            <a href="add_transaksi_bank" class="btn btn-primary pull-right">Tambah Transaksi</a>
        </div>
        
        <table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
            <thead>
                <tr>
                    <th class="text-center">No</th>
                    <th class="text-center">Tanggal</th>
                    <th class="text-center">Uraian</th>
                    <th class="text-center">Bukti Transaksi</th>
                    <th class="text-center">Nominal</th>
                    <th class="text-center">Bunga Bank</th>
                    <th class="text-center">Pajak</th>
                    <th class="text-center">Biaya Admin</th>
                    <th class="text-center">Jenis Transaksi</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($transaksi as $k=>$d) { ?>
                    <tr>
                        <td><?=$k+1?></td>
                        <td><?=$d->tanggal?></td>
                        <td><?=$d->keterangan?></td>
                        <td><a href="<?= base_url('uploads/'.$d->bukti_transaksi) ?>" target="_blank"><?=$d->bukti_transaksi?></a></td>
                        <td class="text-right"><?= format_rp($d->nominal)?></td>
                        <td class="text-right"><?= format_rp($d->bunga)?></td>
                        <td class="text-right"><?= format_rp($d->pajak)?></td>
                        <td class="text-right"><?= format_rp($d->biaya_admin)?></td>
                        <td><?= $d->posisi_dr_cr == "d" ? "Penerimaan":"Pengeluaran" ?></td>
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