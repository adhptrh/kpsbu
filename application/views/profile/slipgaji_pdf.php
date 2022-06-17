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
    </style>
</head>
<body>
    <p style="text-align: center; font-size:30px;">SLIP GAJI KPSBU</p>
    <br><br>
    <table>
        <tr>
            <td>Periode</td>
            <td>:</td>
            <td><?= date('F Y', strtotime($pegawai->tanggal))?></td>
        </tr>
        <tr>
            <td>ID Penggajian</td>
            <td>:</td>
            <td><?= $pegawai->id_penggajian?></td>
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
            <td>&nbsp;&nbsp;&nbsp;&nbsp; Bonus Kerja</td>
            <td></td>
            <td style="text-align:right"><?= format_rp($pegawai->bonus_kerja)?></td>
        </tr>
        <tr>
            <td>Total Pendapatan</td>
            <td></td>
            <td style="text-align:right"><?= format_rp($pegawai->tot_penghasilan)?></td>
        </tr>
        <tr>
            <td>Pengurang</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp; Pajak PPH 21</td>
            <td style="text-align:right"><?= format_rp($pegawai->ptkp)?></td>
            <td></td>
        </tr>
        <tr>
            <td>Total Pengurang</td>
            <td></td>
            <td style="text-align:right"><?= format_rp($pegawai->tot_pengurang)?></td>
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