<div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
    <div class="form-group row">
        <label for="pegawai" class="col-sm-1 col-form-label">Periode</label>
        <div class="col-sm-2">
            <select name="bulan" id="bulan" class="form-control">
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
        <div class="col-sm-2">
            <select name="tahun" id="tahun" class="form-control">
                <option value="">-</option>
                <?php for ($i=2019; $i <= date('Y-m-d'); $i++) { ?>
                    <option value="<?= $i ?>"><?= $i ?></option>
                <?php } ?>
            </select>
        </div>
        <div class="col-sm-2">
            <button type="button" class="btn btn-primary" id="filer">Filter</button>
        </div>
    </div>
    <hr>
    <table class="data table table-striped no-margin" id="myTable">
        <thead>
        <tr>
            <th>#</th>
            <th>ID Penggajian</th>
            <th>Periode</th>
            <th>Aksi</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>