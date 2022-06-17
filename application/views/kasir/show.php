<div class="modal fade bd-example-modal-lg" id="show" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title" id="exampleModalLabel">List Produk</h3>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form action="#">
            <div class="x_content">
                <table class="table table-bordered" id="datatable">
                    <thead>
                        <tr>
                            <th>Kode Produk</th>
                            <th>Nama Produk</th>
                            <th>Stok</th>
                            <th>Harga Jual</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($produk as $value) { ?>
                            <tr>
                                <td><?= $value->kode?></td>
                                <td><?= $value->nama_produk?></td>
                                <td><?= $value->jml?></td>
                                <td><?= format_rp($value->harga_jual) ?></td>
                                <td class="text-center">
                                    <button class="btn btn-primary btn-xs btn-select" style="width: 50%;">Select</button>
                                </td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </form>
        </div>
    </div>
</div>