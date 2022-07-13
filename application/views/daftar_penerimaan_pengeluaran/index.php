<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_content">
                <form action="<?= base_url('DaftarPenerimaanPengeluaranKas')?>" method="post">
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
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h4 id="quote">Penerimaan Pengeluaran Kas</h4>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <a href="<?= base_url('DaftarPenerimaanPengeluaranKas/tambah')?>" data-toggle="modal" class="btn pull-right btn-primary">Tambah</a>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover jambo_table dataTable no-footer" id="datatable">
                        <thead>
                            <tr>
                                <th style="width: 5%;">#</th>
                                <th class="text-center">Periode</th>
                                <th class="text-center">Tanggal Transaksi</th>
                                <th class="text-center">No. Dokumen</th>
                                <th class="text-center">Jenis Transaksi</th>
                                <th class="text-center">Tipe Pembayaran</th>
                                <th class="text-center">Deskripsi</th>
                                <th class="text-center">Bukti Upload</th>
                                <th class="text-center">Detail</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            $no = 1;
                            foreach ($list as $item) { ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $item->periode ?></td>
                                <td><?= $item->tanggal ?></td>
                                <td><?= $item->no_dokumen ?></td>
                                <td><?= $item->jenis_transaksi ?></td>
                                <td><?= $item->tipe_pembayaran ?></td>
                                <td><?= $item->deskripsi == '' ? '-' : $item->deskripsi?></td>
                                <td><a href="<?= base_url("uploads/".$item->file) ?>" target="_blank"><?= $item->file == '' ? '-' : $item->file ?></a></td>
                                <td>
                                    <button onclick="
                                    $('#mdl_<?= md5($item->no_dokumen) ?>').modal('show');
                                    " class="btn btn-default"><i class="fa fa-clipboard"></i></button>
                                </td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $this->load->view('daftar_penerimaan_pengeluaran/modal'); ?>
