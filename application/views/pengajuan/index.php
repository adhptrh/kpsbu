<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h4 id="quote">Pengajuan Barang</h4>
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
                                <th>Tanggal Pengajuan</th>
                                <th>Nama Barang</th>
                                <th>Jumlah Pengajuan</th>
                                <th>Sisa Stok</th>
                                <th style="width: 12%;" class="text-center">Status</th>
                                <th style="width: 7%;" class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            $no = 1;
                            foreach ($list as $key => $value) { 
                                $sisastok = 0;
                                for ($i=0;$i<count($barang);$i++) {
                                    if ($barang[$i]->nama_produk == $value->nama_barang) {
                                        $sisastok = $barang[$i]->jml;
                                    }
                                }
                                ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $value->tanggal_pengajuan?></td>
                                <td><?= $value->nama_barang?></td>
                                <td><?= $value->jumlah?></td>
                                <td><?= $sisastok?></td>
                                <td class="text-center">
                                    <?php if ($value->status == 'Approved') { ?>
                                        <button class="btn btn-xs btn-success"><?= ucwords($value->status)?></button>
                                    <?php } else if ($value->status == 'Refused') { ?>
                                        <button class="btn btn-xs btn-danger"><?= ucwords($value->status)?></button>
                                    <?php } else { ?>
                                        <button class="btn btn-xs btn-warning"><?= ucwords($value->status)?></button>
                                    <?php } ?>
                                </td>
                                <td class="text-center">
                                    <?php if ($value->status == 'Approved') { ?>
                                        <button style="width: 30px;" class="btn btn-xs btn-success"><i class="fa fa-check"></i></button>
                                    <?php } else if ($value->status == 'Refused') { ?>
                                        <button style="width: 30px;" class="btn btn-xs btn-danger"><i class="fa fa-times"></i></button>
                                    <?php } else { ?>
                                        <button style="width: 30px;" value="acc" data-id="<?= $value->id?>" class="btn btn-xs btn-success btn-terima"><i class="fa fa-check"></i></button>
                                        <button style="width: 30px;" value="dec" data-id="<?= $value->id?>" class="btn btn-xs btn-danger btn-tolak"><i class="fa fa-times"></i></button>
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
<?php $this->load->view('pengajuan/add'); ?>
<script>
    $(document).on("click", ".btn-terima", function () {
        var val = $(this).val()
        var id = $(this).data('id');
        // alert(val)
        $.ajax({
            "url" : "<?= base_url('Pengajuan/action/') ?>"+val+"/"+id, 
            "data" : {
                val : val,
                id : id,
            }, 
            "type" : "POST", 
            success: function(e) {
                var obj = JSON.parse(e)
                alert('Berhasil')
                location.reload();
            }, 
            error: function(jqXHR, textStatus, errorThrown) {
                console.log(textStatus, errorThrown);
            }
        })
    });
    $(document).on("click", ".btn-tolak", function () {
        var val = $(this).val()
        var id = $(this).data('id');
        // alert("tolak" + id)
        $.ajax({
            "url" : "<?= base_url('Pengajuan/action/') ?>"+val+"/"+id, 
            "data" : {
                val : val,
                id : id,
            }, 
            "type" : "POST", 
            success: function(e) {
                var obj = JSON.parse(e)
                alert('Berhasil')
                location.reload();
            }
        })
    });
</script>
