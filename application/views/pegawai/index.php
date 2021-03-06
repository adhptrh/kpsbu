<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Pegawai</h3>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                            <a href="#add" data-toggle="modal" class="btn pull-right btn-primary">Tambah Data</a>
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
                                <th>No</th>
                                <th>NIP</th>
                                <th>NPWP</th>
                                <th>No. RFID</th>
                                <th>No. Anggota Koperasi</th>
                                <th>Pegawai</th>
                                <th>No Telp</th>
                                <th>Alamat</th>
                                <th>TTL</th>
                                <th>Tgl. Terdaftar</th>
                                <th>TMT</th>
                                <th>Status</th>
                                <th class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php
                        $no = 1;
                        foreach ($list as $key => $value) { ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td style="text-align:right;"><?= $value->nip ?></td>
                                <td style="text-align:right;"><?= $value->npwp ?></td>
                                <td style="text-align:right;"><?= $value->rfid ?></td>
                                <td style="text-align:right;"><?= $value->no_anggota ?></td>
                                <td><?= $value->nama ?></td>
                                <td style="text-align:right;"><?= $value->no_telp ?></td>
                                <td><?= $value->alamat ?></td>
                                <td><?= $value->tgl_lahir ?></td>
                                <td><?= $value->created_at ?></td>
                                <td><?= $value->tmt ?></td>
                                <td>
                                    <?php if ($value->status==1) { ?>
                                        <button class="btn btn-xs btn-success status" data-id="<?= $value->id?>">Aktif</button>
                                    <?php } else { ?>
                                        <button class="btn btn-xs btn-danger">Tidak aktif</button>
                                    <?php } ?>
                                </td>
                                <td class="text-center">
                                    <?php if ($value->status==1) { ?>
                                        <a href="#edit_<?= $value->id?>" data-target="#edit_<?= $value->id?>" data-toggle="modal" class="btn btn-sm btn-default">Edit</a>
                                        <a href="#detail_<?= $value->id?>" data-toggle="modal" class="btn btn-sm btn-default">Detail</a>
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
<?php $this->load->view('pegawai/add');?>
<?php $this->load->view('pegawai/edit');?>
<?php $this->load->view('pegawai/detail');?>
<script>
    function calculateAge(birthday) { // birthday is a date
        var ageDifMs = Date.now() - birthday;
        var ageDate = new Date(ageDifMs); // miliseconds from epoch
        return Math.abs(ageDate.getUTCFullYear() - 1970);
    }
    $(document).ready(function() {
        $("#hide_ptkp").hide()
        $("#ttl").on("change",() => {
            let umur = calculateAge(new Date($("#ttl").val()))
            console.log(umur)
            if (umur<17) {
                $("#save_chg").prop("disabled",true)
                $("#info_umur").show()
            }else{
                $("#save_chg").prop("disabled",false)
                $("#info_umur").hide()
            }
        })
        $('#jp').on('change', function () {
            /* $("#hide_ptkp").hide() */
            var val = $(this).val()
            $("#hide_ptkp").show() 
            /* if (val == 'Tetap') {
            } */
            if (val) {
                $.ajax({
                    url : "<?= base_url('c_masterdata/pendidikan')?>", 
                    method : "post",
                    data : {
                        val : val
                    },
                    success : function (e) {
                        // var obj = JSON.parse(e)
                        // console.log(obj)
                        $("#pendidikan").html(e)
                    }
                })
            } else {
                var html = '<option value="">-</option>';
                $("#pendidikan").html(html)
            }
            console.log(val)
        })

        $(".status").click(function (e) {
            var id = $(this).data("id")
            // console.log(id)
            if (confirm('Status yang dirubah tidak dapat dikembalikan, anda yakin?')) {
                $.ajax({
                url: "<?= base_url('c_masterdata/ubah_status_peg')?>",
                type: "POST",
                data: {
                    id : id
                },
                success: function () {
                    alert('Status berhasil diubah')
                    location.reload()
                }
            });
            }
        })
    })
</script>