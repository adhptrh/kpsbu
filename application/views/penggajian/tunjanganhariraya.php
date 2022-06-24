<div class="x_panel">
    <div class="x_title">
        <div class="row">
            <div class="col-sm-10 col-12">
                <h4 id="quote">Tunjangan Hari Raya</h4>
            </div>
        </div>
    </div>
    <div class="x_content">
        <form>
            <div class="form-group">
                <label>Pilih Bulan</label>
                <select class="form-control" id="bulan">
                    <option value="">-</option>
                    <option value="1">Januari</option>
                    <option value="2">Februari</option>
                    <option value="3">Maret</option>
                    <option value="4">April</option>
                    <option value="5">Mei</option>
                    <option value="6">Juni</option>
                    <option value="7">Juli</option>
                    <option value="8">Agustus</option>
                    <option value="9">September</option>
                    <option value="10">Oktober</option>
                    <option value="11">November</option>
                    <option value="12">Desember</option>
                </select>
            </div>
            <div>
                <div class="table-responsive">
                    <table id="datatable" class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Nama Pegawai</th>
                                <th>Gaji Bersih</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($pegawai as $k=>$v): 
                                ;?>
                                <tr>
                                    <td><?= $v["peg"]->nama?></td>
                                    <td class="text-right"><?= format_rp($v["total"])?></td>
                                </tr>
                                <?php endforeach ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </form>
    </div>
</div>