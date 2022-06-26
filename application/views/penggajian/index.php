<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
            <form class="form-inline" style="margin-bottom:20px;" method="GET">
                    <div class="form-group">
                        <label>Bulan Tahun</label>
                        <input name="bulantahun" class="form-control" type="month" value="<?= $bulantahun ?? "" ?>">
                        <button class="btn btn-primary">Filter</button>
                    </div>
                </form>
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Penggajian</h3>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <!-- <button class="btn pull-right btn-primary" data-target="#add" data-toggle="modal">Tambah data</button> -->
                            <!-- <a href="<?= base_url('penjualan/form_penjualan_susu')?>" class="btn pull-right btn-primary">Tambah data</a> -->
                        </h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>
                <form action="<?= base_url("Penggajian/bayar_semua_gaji")?>" method="post">
                <div class="table-responsive">
                        <table class="table table-bordered" id="datatable">
                            <thead>
                                <tr>
                                    <th style="width: 4%;">#</th>
                                    <th>NIP</th>
                                    <th>NPWP</th>
                                    <th>RFID</th>
                                    <th>Nama Pegawai</th>
                                    <!-- <th>Jumlah Presensi</th> -->
                                    <th>Gaji</th>
                                    <th>PPH21</th>
                                    <th>Tunjangan Kesehatan</th>
                                    <th>Tunjangan Jabatan</th>
                                    <th>Tunjangan Hari Raya</th>
                                    <th>Bonus</th>
                                    <th>PTKP</th>
                                    <th style="width: 15%;" class="text-center">Status</th>
                                    <!-- <th style="width: 15%;" class="text-center">Action</th> -->
                                </tr>
                            </thead>
                            <tbody>
                            <?php 
                            $no = 1;    
                            foreach ($pegawai as $key => $value) { ?>
                            <?php 
                            $this->db->where('nm_pegawai', $value->nama);
                            $detail = $this->db->get('tb_penggajian')->result();
                            // print_r($detail);exit;
                            ?>
                                
                                <tr>
                                    <td><?= $no++ ?>
                                    <?php if (is_null($value->tgl_gaji)) : ?>
                                        <input type="hidden" name="nip[]" value="<?=$value->nip?>">
                                    <?php endif ?>
                                </td>
                                    <td style="text-align:right;"><?= $value->nip ?></td>
                                    <td style="text-align:right;"><?= $value->npwp ?></td>
                                    <td style="text-align:right;"><?= $value->rfid ?></td>
                                    <td><?= $value->nama ?></td>
                                    <!-- <td><?= $value->total ?? '0' ?></td> -->
                                    <td class="text-right"><?= format_rp($pegawaidetail[$value->nip]["gajipokok"]) ?></td>
                                    <td class="text-right"><?= format_rp($pegawaidetail[$value->nip]["pph21"]) ?></td>
                                    <td class="text-right"><?= format_rp($pegawaidetail[$value->nip]["tunjangankesehatan"]) ?></td>
                                    <td class="text-right"><?= format_rp($pegawaidetail[$value->nip]["tunjanganjabatan"]) ?></td>
                                    <td class="text-right"><?= format_rp($pegawaidetail[$value->nip]["tunjanganhariraya"]) ?></td>
                                    <td class="text-right"><?= format_rp($pegawaidetail[$value->nip]["bonus"]) ?></td>
                                    <td class="text-right"><?= format_rp($pegawaidetail[$value->nip]["ptkp"]) ?></td>
                                    <td class="text-center">
                                        <?php if (!is_null($value->tgl_gaji)) { ?>
                                            <a href="#" class="btn btn-xs btn-success">Sudah melakukan penggajian</a>
                                        <?php } else { ?>
                                            <a href="#" class="btn btn-xs btn-warning">Belum melakukan penggajian</a>
                                        <?php } ?>
                                    </td>
                                </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                        <?php 
                            $check = date('d') >= 26 && date("Y-m") == $bulantahun; 
                            if ($check){ ?>
                                    <button class="btn btn-primary">Pembayaran Gaji</button>
                                <!-- <?php if ($value->total >= 0 AND is_null($value->tgl_gaji)) { ?> -->
                                   <!--  <?php } ?> -->
                            <?php } ?>
                        </div>
                    </form>
            </div>
        </div>
    </div>
</div>