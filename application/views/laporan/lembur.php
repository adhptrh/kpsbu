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
            <label>Tgl Awal</label>
            <input type="month" style="margin-right:10px;" class="form-control" name="tgl_awal" value="<?= $tgl_awal  ?>">
            <label>Tgl Akhir</label>
            <input type="month" style="margin-right:10px;" class="form-control" name="tgl_akhir" value="<?= $tgl_akhir  ?>">
            <button class="btn btn-primary">Filter</button>
        </form>
        <br>
        <center>
				<b>
					<div style="font-size: 25px">KPSBU Lembang</div>
					<div style="font-size: 20px">Lembur</div>
					<?php if (isset($tgl_awal, $tgl_akhir)) { ?>
						<div style="font-size: 15px">
							Periode <?php echo $tgl_awal ?> s/d <?php echo $tgl_akhir;
															?>
						</div><?php
							} ?>
				</b>
			</center>
            <br><br>
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
                $total_jam = 0;
                $total_nominal_lembur = 0;
                foreach ($data_lembur as $k=>$lembur) {
                    $total_nominal_lembur += $lembur->total_nominal_lembur;
                    $total_jam += $lembur->total_jam;
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
            <tfoot>
                <tr>
                    <td colspan="3" class="text-right">Total</td>
                    <td class="text-right"><?= $total_jam ?></td>
                    <td class="text-right"><?= format_rp($total_nominal_lembur) ?></td>
                </tr>
            </tfoot>
        </table>
    </div>
</div>