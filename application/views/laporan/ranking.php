<div class="x_panel">
    <div class="x_title">
        <h3>Ranking</h3>
    </div>

    <div class="x_content">

        <div class="form-inline" style="margin-bottom:10px;">
            <label style="margin-right:10px;">Pilih Rank</label>
            <select name="" class="form-control" style="width:200px;margin-right:10px;" required>
                <option value="penjualan_waserda">Penjualan Waserda</option>
                <option value="jumlah_setoran_susu">Jumlah Setoran Susu</option>
            </select>
            <button class="btn btn-primary">Filter</button>
        </div>
        <table id="datatable" class="table table-striped table-bordered table-hover jambo-table dataTable no-footer">
            <thead>
                <tr class="headings">
                    <th>No</th>
                    <th>Nama Pembeli</th>
                    <th>Jumlah Transaksi</th>
                    <th>Total Pembelian</th>
                </tr>
            </thead>
            <tbody>
                <?php
                foreach ($ranking as $k=>$v) {
                    ?>
                    <tr>
                        <td><?= $k+1 ?></td>
                        <td><?= $v->nama_pembeli ?></td>
                        <td><?= $v->jumlah_transaksi ?></td>
                        <td><?= $v->total_pembelian ?></td>
                    </tr>
                    <?php
                }
                ?>
            </tbody>
        </table>
    </div>
</div>