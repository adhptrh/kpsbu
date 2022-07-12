<div class="x_panel">
    <div class="x_title">
        <div class="row">
            <div class="col-sm-10 col-12">
                <h4 id="quote">Tunjangan Hari Raya</h4>
            </div>
        </div>
    </div>
    <div class="x_content">
        <form action="<?= base_url("Penggajian/simpan_tunjangan_hari_raya") ?>" method="post">
            <div class="form-group">
                <label>Pilih Bulan</label>
                <select onchange="
                document.location.href = '?bulan='+document.getElementById('bulan').value;
                " name="bulan" class="form-control" id="bulan" <?= ($dateApplied) ? "disabled":"" ?> required>
                    <?php if ($dateApplied) :?>
                    <option value="<?= substr($dateApplied->tanggal,5,2) ?>" selected><?= $namabulan[substr($dateApplied->tanggal,5,2)] ?></option>
                    <?php endif ?>
                    <option value="">-</option>
                    <option value="01" <?= $bulanselect == "01" ? "selected":"" ?>>Januari</option>
                    <option value="02" <?= $bulanselect == "02" ? "selected":"" ?>>Februari</option>
                    <option value="03" <?= $bulanselect == "03" ? "selected":"" ?>>Maret</option>
                    <option value="04" <?= $bulanselect == "04" ? "selected":"" ?>>April</option>
                    <option value="05" <?= $bulanselect == "05" ? "selected":"" ?>>Mei</option>
                    <option value="06" <?= $bulanselect == "06" ? "selected":"" ?>>Juni</option>
                    <option value="07" <?= $bulanselect == "07" ? "selected":"" ?>>Juli</option>
                    <option value="08" <?= $bulanselect == "08" ? "selected":"" ?>>Agustus</option>
                    <option value="09" <?= $bulanselect == "09" ? "selected":"" ?>>September</option>
                    <option value="10" <?= $bulanselect == "10" ? "selected":"" ?>>Oktober</option>
                    <option value="11" <?= $bulanselect == "11" ? "selected":"" ?>>November</option>
                    <option value="12" <?= $bulanselect == "12" ? "selected":"" ?>>Desember</option>
                </select>
            </div>
            <div>
                <?php foreach ($pegawai as $v) :?>
                    <input id="<?=$v->nip?>" name="<?=$v->nip?>" value="<?=$thr["$v->nip"]?>" type="hidden">
                <?php endforeach?>
                <div class="table-responsive">
                    <table id="datatable" class="table table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>NIP</th>
                                <th>Nama Pegawai</th>
                                <th>Nominal THR</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($pegawai as $k=>$v): 
                                ;?>
                                <tr>
                                    <td>
                                        <input onchange="
                                        let ya = document.getElementById('cb_<?=$v->nip?>').checked
                                        if (ya) {
                                            document.getElementById('<?=$v->nip?>').name = '<?= $v->nip ?>';
                                        } else {
                                            document.getElementById('<?=$v->nip?>').name = '';
                                        }
                                        " id="cb_<?= $v->nip ?>" type="checkbox" checked>
                                    </td>
                                    <td><?= $v->nip?></td>
                                    <td><?= $v->nama?></td>
                                    <td class="text-right">
                                        <?= format_rp($thr["$v->nip"]) ?>
                                    </td>
                                </tr>
                                <?php endforeach ?>
                        </tbody>
                    </table>
                </div>
                <?php if (intval($bulanselect) >= date("m")) { ?>
                <button class='btn btn-primary'>Simpan</button>
                <?php } ?>
            </div>
        </form>
    </div>
</div>