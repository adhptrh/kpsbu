<?php
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
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <title>Document</title>
    <style>
    * {
        font-size: 14px;
    }
    .table {
    font-family: Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
    }

    .table td, .table th {
    border: 1px solid #ddd;
    padding: 8px;
    }

    .table tr:nth-child(even){background-color: #E8E8E8;}

    .table tr:hover {background-color: #ddd;}

    .table th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #787878;
    color: white;
    }
    #img {
        background-image: url('<?php echo base_url(); ?>/assets/images/brandlogo.jpg');
        height:35px;
        width:150px;
    }
    </style>
</head>
<body>
<img height="<?php echo 35/2 ?>px" width="<?php echo 150/2 ?>px" src="<?php echo encode_img_base64("assets/images/brandlogo.jpg"); ?>">"
    <p style="text-align: center; font-size:30px;">SLIP GAJI KPSBU</p>
    <br><br>
    <table>
        <tr>
            <td>Periode</td>
            <td>:</td>
            <td><?= date('F Y', strtotime($pegawai->tanggal))?></td>
        </tr>
        <tr>
            <td>Nama Pegawai</td>
            <td>:</td>
            <td><?= $pegawai->nm_pegawai?></td>
        </tr>
        <tr>
            <td>NIP</td>
            <td>:</td>
            <td><?= $pegawai->nip?></td>
        </tr>
        <tr>
            <td>NPWP</td>
            <td>:</td>
            <td><?= $pegawai->npwp?></td>
        </tr>
    </table>
    <br><br>
    <table class="table">
        <tr>
            <td>Pendapatan</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp; Gaji Pokok</td>
            <td></td>
            <td style="text-align:right"><?= format_rp($pegawai->gaji_pokok)?></td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp; Tunjangan Jabatan</td>
            <td></td>
            <td style="text-align:right"><?= format_rp($pegawai->tunjangan_jabatan)?></td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp; Tunjangan Kesehatan</td>
            <td></td>
            <td style="text-align:right"><?= format_rp($pegawai->tunjangan_kesehatan)?></td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp; Tunjangan Hari Raya</td>
            <td></td>
            <td style="text-align:right"><?= format_rp($pegawai->tunjangan_hari_raya)?></td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp; Bonus Kerja</td>
            <td></td>
            <td style="text-align:right"><?= format_rp($pegawai->bonus_kerja)?></td>
        </tr>
        <tr>
            <td>Pengurang</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp; Pajak PPH 21</td>
            <td style="text-align:right"><?= format_rp($pegawai->pph21)?></td>
            <td></td>
        </tr>
        <tr>
            <td>Total Pendapatan Bersih</td>
            <td></td>
            <td style="text-align:right"><?= format_rp($pegawai->total)?></td>
        </tr>
    </table>
    <br><br>
    <p style="font-size: 15px;">
        <strong>
            <i>
                <?= 'Telah dibayarkan sejumlah ' . number_to_words($pegawai->total) . ', dan telah dibayarkan kebank yang terdaftar.' ?></strong>
            </i>
    </p>
    <p style="font-size: 12px;">
        Tanggal tercetak <?= date('d F Y H:i:s')?>
    </p>
</body>
</html>