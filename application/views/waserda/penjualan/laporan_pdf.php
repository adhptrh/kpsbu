<!-- <link href="<?php echo base_url(); 
function encode_img_base64($img_path = false): string
{
    if($img_path){
        $path = $img_path;
        $type = pathinfo($path, PATHINFO_EXTENSION);
        $data = file_get_contents($path);
        return 'data:image/' . $type . ';base64,' . base64_encode($data);
    }
    return '';
}

?>assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<style>
    * {
        font-size : 5pt;
    }

    table {
        margin-left:auto;margin-right:auto;
    }

    #img {
        background-image: url('<?php echo base_url(); ?>/assets/images/brandlogo.jpg');
        height:35px;
        width:150px;
    }
</style>
<center>
<img height="<?php echo 35/2 ?>px" width="<?php echo 150/2 ?>px" src="<?php echo encode_img_base64("assets/images/brandlogo.jpg"); ?>">"
<p>Waserda KPSBU</p>
<p>Jl. Kayu Ambon Dalam No. 5, Lembang. Kec. Lembang. Kab. Bandung Barat.</p>
<br>
<p><strong>Invoice </strong> : <?= $detail[0]->invoice?></p>
<p><strong>Date payment </strong> : <?= $penjualan->date_payment?></p>
<p><strong>Pembeli </strong> : <?= $penjualan->nama_pembeli?></p>
<br>
</center>
<table class="table" style="width:100%">
    <tr>
        <th style="text-align:left;">no</th>
        <th style="text-align:left;">item</th>
        <th style="text-align:left;">qty</th>
        <th style="text-align:left;">subtotal</th>
    </tr>
    <?php 
    $no =1;
    $subtotal = 0;
    foreach ($detail as $value) { ?>
    <?php $subtotal = $value->jml * $value->harga ?> 
    <tr>
        <td><?= $no++ ?></td>
        <td><?= $value->nama_produk ?></td>
        <td><?= $value->jml.' '.'@'.$value->harga ?></td>
        <td><?= format_rp($subtotal) ?></td>
    </tr>
    <?php } ?>
</table>
<div style="text-align:right">
<hr>
<p><strong>Penjualan</strong> : <?= format_rp($penjualan->total_trans) ?></p>
<p><strong>PPN (<?= $penjualan->persen ?>%)</strong> : <?= format_rp($penjualan->ppn) ?></p>
<hr>
<p><strong>Pembayaran</strong> : <?= format_rp($penjualan->pembayaran) ?></p>
<p><strong>Total</strong> : <?= format_rp($penjualan->total) ?></p>
<p><strong>Kembalian</strong> : <?= format_rp($penjualan->kembalian) ?></p>
<br>
<p>Terimakasih :) </p>
</div>
