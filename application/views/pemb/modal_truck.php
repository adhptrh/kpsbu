<!-- <?php foreach ($result as $key => $d) { ?>
    <div class="modal fade" id="truck_<?= $d['no_trans']?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Detail</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="<?= base_url('c_transaksi/save_truck_information')?>" method="post">
                    <div class="modal-body">
                        <input type="text" value="<?= $d['no_trans']?>" name="id_pembelian">
                        <input type="text" class="nama_aset" name="nama_aset">
                        <input type="text" class="id_detail_pembelian" name="id_detail_pembelian">
                        <div class="form-group">
                            <label for="">Aset</label>
                            <div class="">
                                <select name="id_aset" class="form-control id_aset" id="id_aset" required>
                                <option value="">Pilih Aset</option>
                                <?php foreach ($truck as $t) { ?>
                                <option value="<?= $t->id?>"><?= $t->aset?> - <?= $t->id_detail_aset?></option>
                                <?php } ?>
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php } ?>
<script>
    $(document).ready(function () {
        $('#id_aset').on('change', function () {
            // alert('click')
            let id = $('#id_aset').val()
            console.log(id)
        })
    })
</script> -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Detail</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= base_url('c_transaksi/save_truck_information')?>" method="post">
                <div class="modal-body">
                    <input type="hidden" id="no_trans" name="id_pembelian">
                    <input type="hidden" class="nama_aset" name="nama_aset">
                    <input type="hidden" class="id_detail_pembelian" name="id_detail_pembelian">
                    <div class="form-group">
                        <label for="">Aset</label>
                        <div class="">
                            <select name="id_aset" class="form-control id_aset" id="id_aset" required>
                            <option value="">Pilih Aset</option>
                            <?php foreach ($truck as $t) { ?>
                            <option value="<?= $t->id?>"><?= $t->aset?> - <?= $t->id_detail_aset?></option>
                            <?php } ?>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $(document).on('click', '#modal_menu', function() {
        var no_trans = $(this).data("trans")
        $('#no_trans').val(no_trans)

        $('#id_aset').change(function() {
            var id_aset = $('#id_aset').val()
            // console.log(id_aset)
            $.ajax({
                url: "<?= base_url('c_transaksi/getDetailAset')?> ", 
                method: "POST",
                data : {
                    id_aset : id_aset
                },
                success:function(data) {
                    obj = JSON.parse(data)
                    
                    var id = obj[0].id
                    var id_detail_aset = obj[0].id_detail_aset
                    var aset = obj[0].aset + ' - ' + id_detail_aset 

                    $('.nama_aset').val(aset)
                    $('.id_detail_pembelian').val(id_detail_aset)
                    
                    console.log(obj)
                }
            })
        })
    })
</script>