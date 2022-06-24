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
                <select name="bulan" class="form-control" id="bulan" <?= ($dateApplied) ? "disabled":"" ?> required>
                    <?php if ($dateApplied) :?>
                    <option value="<?= substr($dateApplied->tanggal,5,2) ?>" selected><?= $namabulan[substr($dateApplied->tanggal,5,2)] ?></option>
                    <?php endif ?>
                    <option value="">-</option>
                    <option value="01">Januari</option>
                    <option value="02">Februari</option>
                    <option value="03">Maret</option>
                    <option value="04">April</option>
                    <option value="05">Mei</option>
                    <option value="06">Juni</option>
                    <option value="07">Juli</option>
                    <option value="08">Agustus</option>
                    <option value="09">September</option>
                    <option value="10">Oktober</option>
                    <option value="11">November</option>
                    <option value="12">Desember</option>
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
                                    <td><?= $v->nama?></td>
                                    <td class="text-right">
                                        <?= format_rp($thr["$v->nip"]) ?>
                                    </td>
                                </tr>
                                <?php endforeach ?>
                        </tbody>
                    </table>
                </div>
                <button class='btn btn-primary'>Simpan</button>
            </div>
        </form>
    </div>
</div>