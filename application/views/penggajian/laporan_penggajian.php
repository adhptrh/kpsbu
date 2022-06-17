<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_content">
                <div class="col-sm-4">
                    <form action="<?= base_url("Penggajian/laporan_penggajian")?>" method="post">
                        <div style="margin-bottom: 10px;">
                            Filter Bulan
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-7">
                                    <select name="bulan" id="bulan" class="form-control" required>
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
                                <div class="col-sm-3">
                                    <?php $year_now = date('Y')?>
                                    <select name="tahun" id="tahun" class="form-control" required>
                                        <option value="">-</option>
                                        <?php for ($i=2020; $i <= 2025 ; $i++) { ?>
                                        <option value="<?= $i ?>"<?= $i == $year_now ? 'selected' : '' ?>><?= $i ?></option>
                                        <?php }?>
                                    </select>
                                </div>
                                <div class="col-sm-1">
                                    <button type="submit" class="btn btn-md">Filter</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Laporan Penggajian</h3>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                        </h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered" id="datatable-buttons">
                        <thead>
                            <tr>
                                <th style="width: 4%;">#</th>
                                <th>ID Penggajian</th>
                                <th>Tanggal</th>
                                <th>Nama Pegawai</th>
                                <th>Gaji Pokok</th>
                                <th>Tunjangan Jabatan</th>
                                <th>Tunjangan Kesehatan</th>
                                <th>Bonus Kerja</th>
                                <th>PPH 21</th>
                                <th>Gaji Bersih</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php 
                        $no = 1;
                        foreach ($list as $key => $value) { ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $value->id_penggajian ?></td>
                                <td><?= $value->tanggal ?></td>
                                <td><?= $value->nm_pegawai ?></td>
                                <td class="text-right"><?= format_rp($value->gaji_pokok) ?></td>
                                <td class="text-right"><?= format_rp($value->tunjangan_jabatan) ?></td>
                                <td class="text-right"><?= format_rp($value->tunjangan_kesehatan) ?></td>
                                <td class="text-right"><?= format_rp($value->bonus_kerja) ?></td>
                                <td class="text-right"><?= format_rp($value->ptkp) ?></td>
                                <td class="text-right"><?= format_rp($value->total) ?></td>
                            </tr>
                        <?php }?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
