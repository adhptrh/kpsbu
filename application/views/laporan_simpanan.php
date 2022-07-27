<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Laporan Simpanan</h3>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <!-- <button class="btn pull-right btn-primary" data-target="#add" data-toggle="modal">Tambah Jadwal Shift</button> -->
                        </h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>
                <?php if ($this->session->userdata("level") != "anggota") { ?>
                <div class="row">
                    <div class="col-sm-7">
                        <form method="get" class="form-inline">
                            <span>Periode</span>
                            <input type="month" name="bulantahun" class="form-control">
                            <input type="submit" value="filter" class="btn btn-info">
                        </form>
                    </div>
                </div>
                <?php } ?>

			<br>
			<center>
				<b>
					<div style="font-size: 25px">KPSBU Lembang</div>
					<div style="font-size: 20px">Laporan Simpanan</div>
					<?php if (isset($bulantahun)) { ?>
						<div style="font-size: 15px">
							Periode <?php echo $bulantahun ?>
						</div><?php
							} ?>
				</b>
			</center>
			<br>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th rowspan="2" class="text-center">Nama anggota</th>
                                <th colspan="3" class="text-center">Laporan Simpanan</th>
                                <th rowspan="2" class="text-center">Total Simpanan</th>
                            </tr>
                            <tr> 
                                <th>Pokok</th>
                                <th>Wajib</th>
                                <th>Masuka</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $subtotal = 0;
                            $total = 0; 
                            foreach ($list as $item) { ?>
                            <?php 
                            $subtotal = ($item->deposit + $item->total_simpanan_wajib + $item->total_masuka);
                            if ( $item->total_simpanan_wajib + $item->total_masuka <= 0) continue;
                            $total += $subtotal;
                            ?>
                            <tr>
                                <td><?= $item->nama_peternak?></td>
                                <td><?= format_rp($item->deposit) ?? 0 ?></td>
                                <td><?= format_rp($item->total_simpanan_wajib) ?? 0?></td>
                                <td><?= format_rp($item->total_masuka) ?? 0?></td>
                                <td><?= format_rp($subtotal)?></td>
                            </tr>
                            <?php } ?>
                            <tr>
                                <th colspan="4" class="text-center">Total</th>
                                <th><?= format_rp($total) ?></th>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
