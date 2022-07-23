<div class="x_panel">
    <div class="x_title">
        <h3>Laporan Kartu Stock</h3>
    </div>
    <div class="x_content">
        <div class="form-inline" style="margin-bottom:10px;">
        <form action="<?= base_url("/laporan_kartu_stock") ?>">
            <label style="margin-right:10px;">Pilih Produk</label>
            <select name="kode_produk" class="form-control" style="width:200px;margin-right:10px;" required>
            <?php
                foreach ($produk as $key => $value) {
                    echo '<option value="'.$value->kode.'" '.(($kode_produk == $value->kode) ? "selected":"").'>'.$value->nama_produk.'</option>';
                }
            ?>
            </select>
            <label style="margin-right:10px;">Bulan Tahun</label>
            <input value="<?= $bulantahun ?? "" ?>" name="bulantahun" style="margin-right:10px;" type="month" class="form-control" required>
            <button class="btn btn-primary">Filter</button>
        </form>
        </div>
        <br>
			<center>
				<b>
					<div style="font-size: 25px">KPSBU Lembang</div>
					<div style="font-size: 20px">Jurnal</div>
					<?php if (isset($bulantahun)) { ?>
						<div style="font-size: 15px">
							Periode <?php echo $bulantahun;
															?>
						</div><?php
							} ?>
				</b>
			</center>
            <br>
        <table id="datatable" class="table table-striped table-bordered table-hover jambo-table dataTable no-footer">
            <thead>
                <tr class="headings">
                    <th rowspan="2" style="vertical-align:middle;">No</th>
                    <th rowspan="2" style="vertical-align:middle;">Tanggal</th>
                    <th colspan="3">In</th>
                    <th colspan="3">Out</th>
                    <th colspan="3">Saldo</th>
                </tr>
                <tr class="headings">
                    <th>Unit</th>
                    <th>Harga</th>
                    <th>Jumlah</th>
                    <th>Unit</th>
                    <th>Harga</th>
                    <th>Jumlah</th>
                    <th>Unit</th>
                    <th>Harga</th>
                    <th>Jumlah</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                $aaa = 0;
                foreach (array_reverse($lap_ks_in) as $k=>$v) {
                    if ($v->tanggal == "Saldo Awal") { 
                        $aaa = $v->unit;
                        ?>
                    <tr>
                        <td colspan="2">Saldo Awal</td>
                        <td class="text-right"><?= $v->unit ?></td>
                        <td class="text-right"><?= format_rp($v->harga_satuan) ?></td>
                        <td class="text-right"><?= format_rp($v->harga_satuan*$v->unit)?></td>
                        <td class="text-right">-</td>
                        <td class="text-right">-</td>
                        <td class="text-right">-</td>
                        <td class="text-right"><?= $v->unit ?></td>
                        <td class="text-right"><?= format_rp($v->harga_satuan) ?></td>
                        <td class="text-right"><?= format_rp($v->harga_satuan*$v->unit)?></td>
                    </tr>
                <?php } } ?>
                <tr>
                    <td colspan="11">Saldo In</td>
                </tr>
                <?php
                $nos = 0;
                foreach (array_reverse($lap_ks_in) as $k=>$v) {
                    if ($v->tanggal == "Saldo Awal") continue;
                    $unit = $v->unit;
                    $nos++;
                ?>
                    <tr>
                        <td><?= $nos ?></td>
                        <td><?= $v->tanggal ?></td>
                        <td class="text-right"><?= $v->unit ?></td>
                        <td class="text-right"><?= format_rp($v->harga_satuan) ?></td>
                        <td class="text-right"><?= format_rp($v->harga_satuan*$v->unit)?></td>
                        <td class="text-right">-</td>
                        <td class="text-right">-</td>
                        <td class="text-right">-</td>
                        <td class="text-right"><?= $v->unit ?></td>
                        <td class="text-right"><?= format_rp($v->harga_satuan) ?></td>
                        <td class="text-right"><?= format_rp($v->harga_satuan*$v->unit)?></td>
                    </tr>
                <?php
                }
                ?>
                <tr>
                    <td colspan="11">Saldo Out</td>
                </tr>
                <?php
                foreach (array_reverse($lap_ks_out) as $k=>$v) {
                    $decr = $v->unit;
                ?>
                    <tr>
                        <td><?= $k+1 ?></td>
                        <td><?= $v->tanggal ?></td>
                        <td class="text-right">-</td>
                        <td class="text-right">-</td>
                        <td class="text-right">-</td>
                        <td class="text-right"><?= $v->unit ?? ""?></td>
                        <td class="text-right"><?= format_rp($v->harga_satuan) ?></td>
                        <td class="text-right"><?= format_rp($v->unit*$v->harga_satuan) ?></td>
                    <?php
                    foreach (array_reverse($lap_ks_in) as $kk=>$vv) {
                        if ($kk > 0) {
                            ?>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        
                            <?php
                        }
                        ?>
                        <td class="text-right"><?= ($vv->unit - $decr < 0) ? 0:$vv->unit-$decr ?></td>
                        <td class="text-right"><?= format_rp($v->harga_satuan) ?></td>
                        <td class="text-right"><?= format_rp((($vv->unit - $decr < 0) ? 0:$vv->unit - $decr)*$v->harga_satuan) ?></td>
                    </tr>
                        <?php
                        $unitakhir = ($vv->unit - $decr < 0) ? 0:$vv->unit-$decr;
                        $kk = $decr;
                        $decr = ($vv->unit - $decr < 0) ? abs($vv->unit - $decr):0;
                        $vv->unit = ($vv->unit - $kk < 0) ? 0:$vv->unit-$kk;
                    }
                }
                ?>
                <tr>
                    <td colspan="11">Saldo Akhir</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <?php 
                    $unitakhir = 0;
                    foreach (array_reverse($lap_ks_in) as $k=>$v) { 
                        if ($v->mode == "in") {
                            $unitakhir += $v->unit;
                        } else {
                            $unitakhir -= $v->unit;
                        }
                    }

                    if (isset($unitakhir) && $unitakhir > 0) {    
                        ?>
                        <td class="text-right"><?= $unitakhir ?></td>
                        <td class="text-right"><?= format_rp($v->harga_satuan) ?></td>
                        <td class="text-right"><?= format_rp($unitakhir*$v->harga_satuan) ?></td>
                        <?php
                    } else {
                        ?>
                        <td class="text-right">0</td>
                        <td class="text-right">-</td>
                        <td class="text-right">-</td>
                        <?php
                    }
                    ?>
                </tr>
            </tbody>
        </table>
    </div>
</div>