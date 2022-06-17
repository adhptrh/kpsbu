<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h4 id="quote">Pengeluaran Kas</h4>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <a href="#add" data-toggle="modal" class="btn pull-right btn-primary">Tambah</a>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered" id="datatable">
                        <thead>
                            <tr>
                                <th style="width: 5%;">#</th>
                                <th>ID Pengeluaran</th>
                                <th>Tanggal Transaksi</th>
                                <th>Aktivitas</th>
                                <th>Jenis Pengeluaran</th>
                                <th>Total</th>
                                <th style="width: 10%;">Tipe Pembayaran</th>
                                <th style="width: 10%;" class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php 
                        $no = 1;
                        foreach ($list as $key => $value) { ?>
                            <tr>
                                <td><?= $no++?></td>
                                <td><?= $value->id_pengeluaran?></td>
                                <td><?= $value->tanggal?></td>
                                <td><?= $value->sumber_pengeluaran?></td>
                                <td><?= $value->jenis_pengeluaran?></td>
                                <td class="text-right"><?= format_rp($value->nominal)?></td>
                                <td><?= $value->jenis_pembayaran == 'Tunai' ? '<button class="btn btn-sm btn-success">'.$value->jenis_pembayaran.'</button>' : '<button class="btn btn-sm btn-efault">'.$value->jenis_pembayaran.'</button>' ?></td>
                                <td class="text-center">
                                    <?php if ($value->jenis_pembayaran == 'Tunai') { ?>
                                        <button><i class="fa fa-check"></i> Selesai</button>
                                    <?php } else { ?>
                                        <?php if (!is_null($value->bukti_trf)) { ?>
                                        <!-- <button data-target="#detail" data-id="<?= $value->id?>" data-toggle="modal"><i class="fa fa-camera"></i> Detail</button> -->
                                        <button data-target="#detail_<?= $value->id?>" data-toggle="modal" class="btn btn-default btn-detail"><i class="fa fa-camera"></i> Detail</button>
                                        <?php } else { ?> 
                                            <button data-target="#upload" data-id="<?= $value->id?>" data-toggle="modal" class="upload"><i class="fa fa-cloud-upload"></i> Upload</button>
                                        <?php } ?>
                                    <?php } ?>
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
<?php $this->load->view('pengeluaran_kas/add'); ?>
<?php $this->load->view('pengeluaran_kas/upload'); ?>
<?php $this->load->view('pengeluaran_kas/detail'); ?>
<script>
    $(document).on("click", ".upload", function () {
     var id = $(this).data('id');
     $(".modal-body #id").val( id );
});
</script>
