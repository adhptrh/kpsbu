<div class="x_panel">
    <div class="x_title">
        <h3>Laporan Lembur</h3>
    </div>

    <div class="x_content">

        <form class="form-inline" style="margin-bottom:10px;">
            
            <label >Pilih Pegawai</label>
            <select name="id_pegawai" required class="form-control" style="width:200px;margin-right:10px;" required>
                <option value="semua">Tampil Semua</option>    
            <?php foreach ($parapegawai as $pegawai) { ?>
                    <option value="<?= $pegawai->nip ?>"><?= $pegawai->nama ?></option>
                <?php } ?>
            </select>
            <label>Periode</label>
            <input type="month" style="margin-right:10px;" class="form-control" name="periode" value="<?= $periode ?? date("Y-m") ?>">
            <button class="btn btn-primary">Filter</button>
        </form>
        <table id="datatable-buttons" class="table table-striped table-bordered table-hover jambo-table dataTable no-footer">
            <thead>
                <tr class="headings">
                    <th>No</th>
                    <th>Nama Pegawai</th>
                    <th>Tanggal Pengajuan</th>
                    <th>Total Jam</th>
                    <th>Nominal</th>
                </tr>
            </thead>
            <tbody>
                <?php
                foreach ($data_lembur as $k=>$lembur) {
                    ?>
                    <tr>
                        <td><?= $k+1 ?></td>
                        <td><?= $lembur->nama ?></td>
                        <td><?= $lembur->tgl_pengajuan ?></td>
                        <td class="text-right"><?= $lembur->total_jam ?></td>
                        <td class="text-right"><?= format_rp($lembur->total_nominal_lembur) ?></td>
                    </tr>
                    <?php
                }
                ?>
            </tbody>
        </table>
    </div>
</div>