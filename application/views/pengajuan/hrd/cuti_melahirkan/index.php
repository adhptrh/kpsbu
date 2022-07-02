<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h4 id="quote">Pengajuan Cuti Melahirkan</h4>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <?php if ($role == "pegawai") { ?> 
                                
                                <a href="#add" data-toggle="modal" class="btn pull-right btn-primary">Tambah</a>
                            <?php } ?>
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
                                <th>ID Pengajuan</th>
                                <th>Tgl. Pengajuan</th>
                                <th>Nama Pegawai</th>
                                <th>Jumlah Hari</th>
                                <th>Tgl. Mulai Cuti</th>
                                <th>Tgl. Selesai Cuti</th>
                                <th>Alasan Cuti</th>
                                <th style="width: 12%;" class="text-center">Status</th>
                                <?php if ($role != 'pegawai') { ?>
                                <th class="text-center">Aksi</th>
                                <?php } ?>
                            </tr>
                        </thead>
                        <tbody>
                        <?php
                        $no = 1; 
                        foreach ($list as $item) { ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $item->id_pengajuan?></td>
                                <td><?= $item->tgl_pengajuan?></td>
                                <td><?= $item->nama?></td>
                                <td><?= $item->jumlah_hari?></td>
                                <td><?= $item->tgl_mulai?></td>
                                <td><?= $item->tgl_selesai?></td>
                                <td><?= $item->alasan_cuti?></td>
                                <td class="text-center">
                                    <?= $item->status == 0 ? '<span class="label label-warning">Menunggu persetujuan</span>' : (($item->status == 1) ? '<span class="label label-success">Sudah disetujui</span>' : '<span class="label label-danger">Ditolak</span>'); ?>
                                </td>
                                <?php if ($role != 'pegawai') { ?>
                                <td class="text-center">
                                    <?php if ($item->status == 0) { ?>
                                        <button type="button" class="btn btn-default btn-xs setuju" data-id="<?= $item->id_pengajuan?>" onclick="confirm('Anda yakin?')"><i class="fa fa-check"></i></button>
                                        <button type="button" class="btn btn-default btn-xs tolak" data-id="<?= $item->id_pengajuan?>" onclick="confirm('Data yang ditolak tidak dapat dikembalikan, anda yakin?')"><i class="fa fa-times"></i></button>
                                    <?php } ?>
                                </td>
                                <?php } ?>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $this->load->view('pengajuan/hrd/cuti_melahirkan/add'); ?>
<script>
    $(document).ready(function() {
        $("#info").hide()
        var todaydt = new Date();
        $("#start").datepicker({
            autoclose: true,
            dateFormat: "yy-mm-dd",
            endDate: todaydt,
            minDate: 0,
            onSelect: function (date) {
                var date2 = $('#start').datepicker('getDate');
                $('#end').datepicker('option', 'minDate', date2);
                $("#end").datepicker('setDate',new Date(new Date(date2).setDate(new Date(date2).getDate()+(30*3))))
                diff()
            }
        });
        $('#end').datepicker({
            dateFormat: "yy-mm-dd", 
        });
        function diff() {
            const startDate  = $("#start").val();
            const endDate    = $("#end").val();

            const diffInMs   = new Date(endDate) - new Date(startDate)
            const diffInDays = diffInMs / (1000 * 60 * 60 * 24);
            $("#jml_hari_cuti").val(diffInDays);
            /* if (diffInDays <= 12) {
                $("#jml_hari_cuti").val(diffInDays);
                $("#info").hide();
            } else {

                var info = `<p style="margin-top: 2%;">Jumlah Maksimal Cuti = 12 Hari/Tahun.</p>`;
                // console.log(info)
                $("#info").html(info);
                $("#info").show();
            } */
        }
        $("#start, #end").on("change", diff);

        $(".setuju").on('click', function() {
            var id_pengajuan = $(this).data("id");
            $.ajax({
                url : "<?= base_url('Cuti/accept_melahirkan')?>", 
                method : "post", 
                data : {
                    id_pengajuan : id_pengajuan,
                },
                success:function(response) {
                    location.reload();
                }
            });
        });

        $(".tolak").on('click', function() {
            var id_pengajuan = $(this).data("id");
            $.ajax({
                url : "<?= base_url('Cuti/reject_melahirkan')?>", 
                method : "post", 
                data : {
                    id_pengajuan : id_pengajuan,
                },
                success:function(response) {
                    location.reload();
                    // console.log(response)
                }
            });
        });

    })
</script>