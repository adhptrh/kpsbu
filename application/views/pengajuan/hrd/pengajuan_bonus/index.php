<style>
    th {
        text-align: center;
    }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h4 id="quote">Pengajuan Bonus</h4>
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
                                <th>ID Pengajuan</th>
                                <th>Tanggal Pengajuan</th>
                                <th>Keterangan</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            $no = 1;
                            foreach ($list as $item) { ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $item->id_pengajuan?></td>
                                <td><?= $item->periode?></td>
                                <td><?= $item->keterangan?></td>
                                <td class="text-center">
                                    <button type="button" data-toggle="modal" data-target="detail" class="btn btn-default btn-xs detailtransaksi" data-id="<?= $item->id_pengajuan?>">Detail Transaksi</button>
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
<?php $this->load->view('pengajuan/hrd/pengajuan_bonus/add'); ?>
<?php $this->load->view('pengajuan/hrd/pengajuan_bonus/detail'); ?>
<script>
    function rupiah(input) {
        return (input/1000).toFixed(3);
    }
    $(document).ready(function() {
        $('.js-example-basic-multiple').select2();
    });
    $(document).on("click", ".detailtransaksi", function() {
        var id = $(this).data('id');
        $.ajax({
            url : "<?= base_url('Pengajuan/detail_bonus')?>",
            data : {
                id_pengajuan : id
            }, 
            type : "post",
            success :function(response) {
                $(".modal-body #id").val( id );
                $('#detail').modal('show');
                var obj = JSON.parse(response);
                var tableRow = '';
                obj.forEach(element => {
                    tableRow += `<tr>
                            <td>${element.id_pengajuan}</td>
                            <td>${element.nama}</td>
                            <td>${'Rp. ' + rupiah(element.nominal)}</td>
                        </tr>`;
                });
                $("#myTable tbody").html(tableRow);
            }
        });
    })
</script>