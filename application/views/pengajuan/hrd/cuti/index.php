<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h4 id="quote">Pengajuan Cuti</h4>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <?= ($role == 'pegawai' && (12-$total_cuti_tahun_ini) > 0) ? '<a href="#add" data-toggle="modal" class="btn pull-right btn-primary">Tambah</a>' : '' ?>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>
                <?php
                if ($role == "pegawai") { ?>
                <p class="badge">Sisa Cuti: <?= 12-$total_cuti_tahun_ini ?></p>
                <?php } ?>
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
<?php $this->load->view('pengajuan/hrd/cuti/add'); ?>
<script>
    let cuti_tahun_ini = <?= $total_cuti_tahun_ini ?? 0 ?>
    
    let sundayCount = 0
    $(document).ready(function() {
        $("#info").hide()
        var todaydt = new Date();
        $("#start").datepicker({
            
            beforeShowDay: function(date) {
                var day = date.getDay();
                return [(day != 0), ''];
            },
            autoclose: true,
            dateFormat: "yy-mm-dd",
            endDate: todaydt,
            minDate: new Date(),
            onSelect: function (date) {
                adddays = 0
                var date2 = $('#start').datepicker('getDate');
                $('#end').datepicker('option', 'minDate', new Date(new Date(date2).setDate(new Date(date2).getDate())));
                let dateend = new Date(new Date(date2).setDate(new Date(date2).getDate()+12-cuti_tahun_ini))
                let cutileft = 12-cuti_tahun_ini
                //loop date to dateend check if sunday
                while (date2 <= dateend) {
                    var day = date2.getDay();
                    if (day == 0) {
                        adddays++
                    }
                    date2.setDate(date2.getDate() + 1);
                }
                $('#end').datepicker('option', 'maxDate', date2);
                
            }
        });
        $('#end').datepicker({
            beforeShowDay: function(date) {
                var day = date.getDay();
                return [(day != 0), ''];
            },
            dateFormat: "yy-mm-dd", 
        });
        
        $("#start, #end").on("change", function() {
            const startDate  = $("#start").val();
            const endDate    = $("#end").val();
            //get sunday count between startdate and enddate
            sundayCount = 0;
            var date1 = new Date(startDate);
            var date2 = new Date(endDate);
            while (date1 <= date2) {
                var day = date1.getDay();
                if (day == 0) {
                    sundayCount++;
                }
                date1.setDate(date1.getDate() + 1);
            }
            console.log(sundayCount)

            const diffInMs   = new Date(endDate) - new Date(startDate)
            const diffInDays = (diffInMs / (1000 * 60 * 60 * 24))-sundayCount+1;
            if (diffInDays <= 12) {
                $("#jml_hari_cuti").val(diffInDays);
                $("#info").hide();
            } else {
                $("#jml_hari_cuti").val(12);

                var info = `<p style="margin-top: 2%;">Jumlah Maksimal Cuti = 12 Hari/Tahun.</p>`;
                // console.log(info)
                $("#info").html(info);
                $("#info").show();
            }
        });

        $(".setuju").on('click', function() {
            var id_pengajuan = $(this).data("id");
            $.ajax({
                url : "<?= base_url('Cuti/accept')?>", 
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
                url : "<?= base_url('Cuti/reject')?>", 
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