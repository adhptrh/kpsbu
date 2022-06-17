<div class="x_panel">
    <div class="x_title">
        <h3 class="panel-title"><b>Daftar Buku Besar</b></h3>
    </div>
    <div class="x_content">

        <body>
            <div class="row">
                <div class="col-sm">
                    <form class='form-inline' method="post" class="form-inline" action="<?= base_url('c_keuangan/bukubesar')?>">
                        <label>Nama Akun </label>
                        <select name="no_coa" class="form-control select2" required>
                            <option item="">Pilih Akun</option>
                            <?php foreach ($coa as $key => $item) { ?>
                                <option value="<?= $item->no_coa ?>"><?= $item->nama_coa ?></option>
                            <?php } ?>
                        </select>
                        &nbsp&nbsp&nbsp&nbsp
                        <label>Pilih Tahun :</label>
                        <input type="month" class="form-control" name="bulan" required>
                        &nbsp&nbsp&nbsp&nbsp
                        <button class="btn btn-info btn-md" type="submit">Filter</button>
                    </form>
                </div>
                <hr>

                <p>
                    <center>
                        <b>
                            <div style="font-size: 25px">KPSBU</div>
                            <div style="font-size: 20px">Buku Besar </div>
                            <div style="font-size: 15px">Periode </div>
                        </b>
                    </center>
                </p>

                <hr>
                <table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
                    <thead>
                        <tr>
                            <th rowspan="2">Tanggal</th>
                            <th rowspan="2">Nama Akun</th>
                            <th rowspan="2">Reff</th>
                            <th rowspan="2" class="text-center">Debet</th>
                            <th rowspan="2" class="text-center">Kredit</th>
                            <th rowspan="2" class="text-center">Saldo </th>
                        </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>0000-00-00</td>
                        <td>Saldo Awal</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="text-right"><?= format_rp($saldo_awal) ?></td>
                    </tr>
                    <?php foreach ($list as $item) { ?>
                        <tr>
                            <td><?= $item->tgl_jurnal ?></td>
                            <td><?= $item->nama_coa ?></td>
                            <td><?= $item->no_coa ?></td>
                            <?php if ($item->posisi_dr_cr =='d') { ?>
								<?php if ($item->header == 1 OR $item->header == 5 OR $item->header == 6 ) { ?>
									<?php $saldo_awal = $saldo_awal + $item->nominal; ?>
								<?php } else { ?>
									<?php $saldo_awal = $saldo_awal - $item->nominal; ?>
								<?php } ?>
								<td class="text-right"><?= format_rp($item->nominal)?></td>
								<td></td>
							<?php } else { ?>
								<?php if ($item->header == 1 OR $item->header == 5 OR $item->header == 6 ) { ?>
									<?php $saldo_awal = $saldo_awal - $item->nominal; ?>
								<?php } else { ?>
									<?php $saldo_awal = $saldo_awal + $item->nominal; ?>
							<?php } ?>
							<td></td>
							<td class="text-right"><?= format_rp($item->nominal)?></td>
							<?php }?>
							<td class="text-right"><?= format_rp($saldo_awal)?></td>
                        </tr>
                    <?php } ?>
                    <!-- <tr>
						<td colspan="5"><b>Saldo Akhir</b></td>
						<td class="text-right">123123</td>
					</tr> -->
                    </tbody>
                </table>
        </body>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('.select2').select2();
    })
</script>