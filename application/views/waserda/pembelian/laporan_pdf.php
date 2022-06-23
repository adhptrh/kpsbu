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
function penyebut($nilai) {
    $nilai = abs($nilai);
    $huruf = array("", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan", "sembilan", "sepuluh", "sebelas");
    $temp = "";
    if ($nilai < 12) {
        $temp = " ". $huruf[$nilai];
    } else if ($nilai <20) {
        $temp = penyebut($nilai - 10). " belas";
    } else if ($nilai < 100) {
        $temp = penyebut($nilai/10)." puluh". penyebut($nilai % 10);
    } else if ($nilai < 200) {
        $temp = " seratus" . penyebut($nilai - 100);
    } else if ($nilai < 1000) {
        $temp = penyebut($nilai/100) . " ratus" . penyebut($nilai % 100);
    } else if ($nilai < 2000) {
        $temp = " seribu" . penyebut($nilai - 1000);
    } else if ($nilai < 1000000) {
        $temp = penyebut($nilai/1000) . " ribu" . penyebut($nilai % 1000);
    } else if ($nilai < 1000000000) {
        $temp = penyebut($nilai/1000000) . " juta" . penyebut($nilai % 1000000);
    } else if ($nilai < 1000000000000) {
        $temp = penyebut($nilai/1000000000) . " milyar" . penyebut(fmod($nilai,1000000000));
    } else if ($nilai < 1000000000000000) {
        $temp = penyebut($nilai/1000000000000) . " trilyun" . penyebut(fmod($nilai,1000000000000));
    }     
    return $temp;
}

function terbilang($nilai) {
    if($nilai<0) {
        $hasil = "minus ". trim(penyebut($nilai));
    } else {
        $hasil = trim(penyebut($nilai));
    }     		
    return $hasil;
}

?>assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<style>
    * {
        font-size : 5pt;
    }
    .pagebreak { page-break-before: always; }
</style>
<center>
    
<img height="<?php echo 35/2 ?>px" width="<?php echo 150/2 ?>px" src="<?php echo encode_img_base64("assets/images/brandlogo.jpg"); ?>">"

<p>Waserda KPSBU</p>
<p>Jl. Kayu Ambon Dalam No. 5, Lembang. Kec. Lembang. Kab. Bandung Barat.</p>
<br>
<p><strong>Invoice </strong> : <?= $detail[0]->invoice?></p>
<p><strong>Date payment </strong> : <?= $detail[0]->tanggal?></p>
<!-- <?php
    $suppliers = "";
    
    foreach ($detail as $k=>$v) {
        $suppliers .= $v->nama_supplier.", ";
        var_dump(strpos($suppliers,$v->supplier));
        echo "<script>alert('".$suppliers."')</script>";
    }
    
    $suppliers = substr($suppliers, 0, -2);
?> -->
<p><strong>Supplier </strong> : <?= $suppliers?></p>
<br>
<table class="table">
    <tr>
        <th>no</th>
        <th>item</th>
        <th>qty</th>
        <th>subtotal</th>
    </tr>
    <?php 
    $no = 1;
    foreach ($detail as $value) { ?>
    <?php $subtotal = $value->jml * $value->harga_satuan ?>
    <tr>
        <td><?= $no++ ?></td>
        <td><?= $value->nama_produk?></td>
        <td><?= $value->jml.' '.'@'.$value->harga_satuan ?></td>
        <td><?= format_rp($subtotal)?></td>
    </tr>
    <?php } ?>
</table>
======================================
<p><strong>Pembelian</strong> : <?= format_rp($detail[0]->total) ?></p>
<p><strong>PPN (11%)</strong> : <?= format_rp($detail[0]->ppn) ?></p>
<p><strong>Grand Total</strong> : <?= format_rp($detail[0]->grandtotal) ?></p>
======================================
<br>
</center>
<div class="pagebreak">
    <p>Bukti Pembayaran</p>
    <center>
        <p>KWITANSI</p>
        <p>Invoice No: <?= $detail[0]->invoice ?></p>
    </center>
    <p>Telah diterima dari: Waserda KPSBU </p>
    <p>Banyaknya uang: <?= terbilang($detail[0]->grandtotal) ?> rupiah </p>
    <p>Untuk pembayaran: Pembayaran barang ke supplier</p>
    <p>Jumlah <?= format_rp($detail[0]->grandtotal) ?>
    <p align="right"><?= date("Y-m-d") ?></p>
    <center>
    <p>Terimakasih :) </p>
    </center>
</div>
