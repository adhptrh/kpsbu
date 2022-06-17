<div class="row">
    <div class="col-sm-7">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Supplier Produk</h3>
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
                                <th>Kode</th>
                                <th>Nama</th>
                                <th>Alamat</th>
                                <th>No Telp</th>
                                <!-- <th>Status</th> -->
                                <th class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1;
                            foreach ($supplier as $key => $value) { ?>
                            <tr>
                                <td><?= $no++?></td>
                                <td><?= $value->kode?></td>
                                <td><?= $value->nama?></td>
                                <td><?= $value->alamat?></td>
                                <td><?= $value->no_telp?></td>
                                <!-- <td class="text-center">
                                    <?php if ($value->status == 1) { ?>
                                        <button style="width: 80%;" class="btn btn-round btn-sm btn-success">Aktif</button>
                                    <?php } else { ?>
                                        '<button style="width: 80%;" class="btn btn-round btn-sm btn-warning">Tidak Aktif</button>
                                    <?php } ?>
                                </td> -->
                                <td style="width: 13%;" class="text-center">
                                   <div class="btn-group">
                                    <!-- <button class="btn btn-sm btn-default" onclick="alert('Under Maintenance')">Detail</button> -->
                                    <button class="btn btn-sm btn-warning btn-edit" 
                                    data-toggle="modal" 
                                    data-target="#edit"
                                    data-id="<?= $value->kode?>"
                                    data-supplier="<?= $value->nama?>"
                                    data-alamat="<?= $value->alamat?>"
                                    data-no_telp="<?= $value->no_telp?>"
                                    >Edit</button>
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
                        <h3>Tambah Supplier Produk</h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif'); ?>
                </div>
                <form action="<?= base_url('Supplier_produk/save')?>" method="POST">
                    <div class="form-group row">
                        <label for="kode" class="col-sm-3 col-form-label">Kode</label>
                        <div class="col-sm-9">
                        <input type="text" name="kode" class="form-control" id="kode" value="<?= $kode ?>" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="supplier" class="col-sm-3 col-form-label">Nama Supplier</label>
                        <div class="col-sm-9">
                        <input type="text" name="supplier" class="form-control" id="supplier" placeholder="Nama Supplier" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="alamat" class="col-sm-3 col-form-label">Alamat</label>
                        <div class="col-sm-9">
                            <textarea name="alamat" class="form-control" id="alamat" cols="10" rows="5" placeholder="Alamat" required></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="no_telp" class="col-sm-3 col-form-label">No Telp</label>
                        <div class="col-sm-9">
                        <input type="text" name="no_telp" class="form-control" id="no_telp" placeholder="No Telp" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" required>
                        </div>
                    </div>
                    <div class="ln_solid"></div>
                    <div class="group-btn">
                        <button type="submit" class="btn btn-primary">Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php $this->load->view('waserda/supplier/edit');?>
<?php $this->load->view('script');?>
<script>
    $('.btn-edit').on('click', function() {
        var id = $(this).data('id')
        var supplier = $(this).data('supplier')
        var alamat = $(this).data('alamat')
        var no_telp = $(this).data('no_telp')

        $('.modal-body #kode').val(id)
        $('.modal-body #supplier').val(supplier)
        $('.modal-body #alamat').val(alamat)
        $('.modal-body #no_telp').val(no_telp)
    })
</script>
