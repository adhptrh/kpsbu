<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_content">
                <form action="<?= base_url('Laporan/laporan_pmb_waserda')?>" method="post">
                    <div class="form-group row">
                        <label for="periode" class="col-sm-1">Periode</label>
                        <div class="col-sm-2">
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
                        <div class="col-sm-1">
                            <select name="tahun" id="tahun" class="form-control" required>
                                <option value="">-</option>
                                <?php for ($i=2020; $i <= 2025; $i++) { ?>
                                    <option value="<?= $i ?>"><?= $i ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="col-sm-2">
                            <button class="btn btn-primary" type="submit">Filter</button>
                            <!-- <input type="button" class="btn btn-default" name="show_all" value="Show"> -->
                        </div>
                    </div>
                </form>
                <!-- <a href="<?= base_url('Laporan/laporan_penjualan_waserda') ?>" class="btn btn-default" value="show_all">Show All</a> -->
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-12 col-12">
                        <h4 id="quote">Laporan Pembelian Waserda</h4>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <!-- <a href="#add" data-toggle="modal" class="btn pull-right btn-primary">Tambah</a> -->
                        </h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>
                
                <br>
			<center>
				<b>
					<div style="font-size: 25px">KPSBU Lembang</div>
					<div style="font-size: 20px">Pembelian Waserda</div>
					<?php if (isset($bulan)) { ?>
						<div style="font-size: 15px">
							Periode <?= $tahun."-".$bulan ?>
						</div><?php
							} ?>
				</b>
			</center>
            <br>
                <div class="table-responsive">
                    <table class="table table-bordered" id="datatable-buttons">
                        <thead>
                            <tr>
                                <th style="width: 5%;">#</th>
                                <th>Invoice</th>
                                <th>Tgl. Transaksi</th>
                                <th>Total Pembelian</th>
                                <th>PPN</th>
                                <th>Grandtotal</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php 
                        $no = 1;
                        foreach ($list as $item) { ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $item->invoice ?></td>
                                <td><?= $item->tanggal ?></td>
                                <td class="text-right"><?= format_rp($item->total) ?></td>
                                <td class="text-right"><?= format_rp($item->ppn) ?></td>
                                <td class="text-right"><?= format_rp($item->grandtotal) ?></td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>