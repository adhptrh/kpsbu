<div class="x_panel">
    <div class="x_title">
        <h3>Laporan Cuti</h3>
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
					<div style="font-size: 20px">Cuti</div>
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
                    <th>Jumlah Hari</th>
                    <th>Alasan Cuti</th>
                    <th>Tanggal Mulai Cuti</th>
                    <th>Tanggal Selesai Cuti</th>
                </tr>
            </thead>
            <tbody>
                <?php
                foreach ($data_cuti as $k=>$cuti) {
                    ?>
                    <tr>
                        <td><?= $k+1 ?></td>
                        <td><?= $cuti->nama ?></td>
                        <td class="text-right"><?= $cuti->jumlah_hari ?></td>
                        <td><?= $cuti->alasan_cuti ?></td>
                        <td><?= $cuti->tgl_mulai ?></td>
                        <td><?= $cuti->tgl_selesai ?></td>
                    </tr>
                    <?php
                }
                ?>
            </tbody>
        </table>
    </div>
</div>