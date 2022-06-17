<div class="x_panel">
    <div class="x_title">
        <div class="row">
            <div class="col-sm-10 col-12">
                <h3 id="quote">
                    Produk Waserda
                </h3>
            </div>
            <div class="col-sm-2 col-12">
                <button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#add">Tambah Produk</button>
            </div>
        </div>
    </div>
    <div class="x_content">
        <div id="notif">
            <?php echo $this->session->flashdata('notif'); ?>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered" id="datatable">
                <thead>
                    <tr>
                        <th>Kode</th>
                        <th>No. Barcode</th>
                        <th>Nama Produk</th>
                        <th>Kategori Produk</th>
                        <th>Satuan</th>
                        <th>Stok Akhir</th>
                        <th>Harga Beli</th>
                        <th>Harga Jual</th>
                        <th>Status</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($produk as $value) { ?>
                        <tr>
                            <td><?= $value->kode?></td>
                            <td><?= $value->barcode_id?></td>
                            <td><?= $value->nama_produk?></td>
                            <td><?= $value->deskripsi?></td>
                            <td><?= $value->satuan_produk?></td>
                            <td><?= $value->jml?></td>
                            <td><?= format_rp($value->harga_satuan)?></td>
                            <td><?= format_rp($value->harga_jual)?></td>
                            <td>
                                <?php if ($value->status == 1) { ?>
                                    <button style="width: 100%;" class="btn-sm btn btn-success status" data-id="<?= $value->id?>">Aktif</button>
                                <?php } else { ?>
                                    <button style="width: 100%;" class="btn-sm btn btn-danger">Tidak Aktif</button>
                                <?php } ?>
                            </td>
                            <td class="text-center">
                                <div class="btn-group btn-group-sm">
                                    <?php if ($value->status == 1) { ?>
                                        <a href="#edit_<?= $value->id ?>" data-toggle="modal" class="btn btn-default btn-sm"> <i class="fa fa-pencil"></i></a>
                                    <?php } ?> 
                                </div>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<?php $this->load->view('script');?>
<?php $this->load->view('waserda/produk/add');?>
<?php $this->load->view('waserda/produk/edit');?>
<script>
    $(function(){
        $(".status").click(function (e) {
            var id = $(this).data("id")
            // console.log(id)
            if (confirm('Status yang dirubah tidak dapat dikembalikan, anda yakin?')) {
                $.ajax({
                url: "<?= base_url('Produk/ubah_status')?>",
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