<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h4 id="quote">Pengajuan Jurnal</h4>
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
                <form action="<?= base_url("c_transaksi/multiple_status_pengajuan") ?>" method="post" enctype="multipart/form-data">
                <div class="table-responsive">
                        <?php
                        foreach ($list as $k => $v) {
                            if ($v->status == "pending") {
                        ?>
                                <input type="hidden" id="kode_<?= $k ?>" name="kode[]" value="<?= $v->kode ?>">
                                <input type="hidden" id="tanggal_<?= $k ?>" name="tanggal[]" value="<?= $v->tanggal ?>">
                                <input type="hidden" id="nominal_<?= $k ?>" name="nominal[]" value="<?= $v->nominal ?>">
                        <?php
                            }
                        }
                        ?>
                        <table class="table table-striped table-bordered table-hover jambo_table" id="datatable">
                            <thead>
                                <tr>
                                    <th style="width:2%"></th>
                                    <th style="width: 5%;" class="text-center">#</th>
                                    <th class="text-center">Kode</th>
                                    <th class="text-center">Tanggal</th>
                                    <th class="text-center">Nominal</th>
                                    <th class="text-center">Bukti Pembayaran</th>
                                    <th class="text-center">Status</th>
                                    <th class="text-center">Aksi</th>
                                
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $no = 1;
                                foreach ($list as $key => $value) { ?>
                                    <tr>
                                        <td>
                                            <?php
                                            if ($value->status == "pending") {
                                            ?>
                                                <input type="checkbox" id="kode_k_<?= $key ?>" onchange="if (document.getElementById('kode_k_<?= $key ?>').checked) {document.getElementById('kode_<?= $key ?>').name = 'kode[]';document.getElementById('tanggal_<?= $key ?>').name = 'tanggal[]';document.getElementById('nominal_<?= $key ?>').name = 'nominal[]';return} document.getElementById('kode_<?= $key ?>').name = ''; document.getElementById('tanggal_<?= $key ?>').name = ''; document.getElementById('nominal_<?= $key ?>').name = '' " <?= ($value->bukti_pembayaran) ? "checked":"" ?>>
                                                <script>
                                                </script>
                                            <?php
                                            } else {
                                               ?>
                                               <input type="checkbox" disabled>
                                               <?php
                                            }
                                            ?>
                                        </td>
                                        <td><?= $no++ ?></td>
                                        <td><?= $value->kode ?></td>
                                        <td><?= $value->tanggal ?></td>
                                        <td style="text-align:right;"><?= format_rp($value->nominal) ?></td>
                                       
                                        <td>
                                            <?php if ($value->bukti_pembayaran) : ?>
                                                <a target=???_blank??? href="<?= base_url("uploads/".$value->bukti_pembayaran) ?>">
                                                <i class="fa fa-link"></i>
                                                <?= (strlen($value->bukti_pembayaran) > 10) ? substr($value->bukti_pembayaran,0,10)."...":$value->bukti_pembayaran ?>
                                            </a>
                                            <?php else : ?>
                                                <span class="text-muted">Tidak ada bukti pembayaran</span>
                                            <?php endif ?>
                                        </td>
                                        <td class="text-center">
                                            <?php if ($value->status == 'pending') { ?>
                                                <p><?= $value->status ?></p>
                                                <?php } else { ?>
                                                    <p><?= $value->status ?></p>
                                                    <?php } ?>
                                        </td>
                                        <td class="text-center">
                                            <?php if ($value->status == 'pending') { ?>
                                                <a class="btn btn-xs btn-primary" href="<?= base_url("c_transaksi/input_bukti_pembayaran/".$value->kode) ?>">
                                                    Input/Ubah Bukti Pembayaran
                                                </a>
                                            <?php } ?>
                                            
                                            <?php if ($this->session->userdata("level") != "keuangan_waserda") { ?>
                                                <?php if ($value->status == 'pending') { ?>
                                                    <a href="<?= base_url('c_transaksi/status_pengajuan_subm/' . $value->kode . '/' . $value->tanggal . '/' . $value->nominal.'/true') ?>" onclick="return confirm('Anda yakin?')" class="btn btn-xs btn-primary">Approve Jurnal</a>
                                                    <?php } else { ?>
                                                        <?php } ?>
                                            <?php } ?>
                                        </td>
                                    </tr>
                                    
                                <?php } ?>
                            </tbody>
                        </table>
                        <?php if ($this->session->userdata("level") != "keuangan_waserda") { ?>
                            <button class="btn btn-primary">Approve Jurnal</button>
                        <?php } ?>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>