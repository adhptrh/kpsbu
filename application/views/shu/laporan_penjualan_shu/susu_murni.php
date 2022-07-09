<div class="table-responsive">
    <table class="table table-bordered ">
        <thead>
            <tr>
                <th style="width: 5%;">No</th>
                <th>Tgl. Penjualan</th>
                <th>Nama Pelanggan</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
        <?php 
        $no = 1;
        $total = 0;
        foreach ($susu_murni as $item) { ?>
            <?php $total += $item->total ?>
            <tr>
                <td style="width: 5%;"><?= $no++ ?></td>
                <td><?= $item->tanggal ?></td>
                <td><?= $item->nm_pelanggan ?></td>
                <td><?= format_rp($item->total) ?></td>
            </tr>
        <?php } ?>
        </tbody>
        <tfoot>
            <tr>
                <th colspan="3" class="text-center">Grandtotal</th>
                <th><?= format_rp($total) ?></th>
            </tr>
        </tfoot>
    </table>
</div>