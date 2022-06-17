<div class="row">
    <div class="col-sm-7">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote"><?= $this->uri->segment(1);?></h3>
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
                                <th style="width: 5%;">No</th>
                                <th>Kode</th>
                                <th>Deskripsi</th>
                                <th class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            $no = 1;
                            foreach ($list as $key => $value) { ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $value->kode?></td>
                                <td><?= $value->deskripsi?></td>
                                <td class="text-center" style="width: 15%;">
                                    <div class="btn-group">
                                        <!-- <button class="btn btn-sm btn-default">Detail</button> -->
                                        <button class="btn btn-sm btn-warning btn-edit" data-target="#edit" data-toggle="modal" data-id="<?= $value->kode?>" data-desc="<?= $value->deskripsi?>">Edit</button>
                                    </div>
                                </td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="col-sm-5">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3>Tambah Kategori</h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif'); ?>
                </div>
                <form action="<?= base_url('Kategori/save')?>" method="POST">
                    <div class="form-group row">
                        <label for="kode" class="col-sm-3 col-form-label">Kode Kategori</label>
                        <div class="col-sm-9">
                        <input type="text" class="form-control" id="kode" value="<?= $kode ?>" name="kode" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="desc" class="col-sm-3 col-form-label">Deskripsi</label>
                        <div class="col-sm-9">
                        <input type="text" class="form-control" id="desc" placeholder="Deskripsi" name="desc">
                        </div>
                    </div>
                    <div class="ln_solid"></div>
                    <div class="group-btn">
                        <button type="submit" class="btn btn-primary">Simpan</button>
                        <button type="button" class="btn btn-default">Reset</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php $this->load->view('script');?>
<?php $this->load->view('waserda/kategori/edit')?>
<script>
    $('.btn-edit').on('click', function() {
        var id = $(this).data('id')
        var desc = $(this).data('desc')

        $('.modal-body #kode').val(id)
        $('.modal-body #desc').val(desc)
    })
</script>
