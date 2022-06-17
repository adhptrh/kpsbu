<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<div class="x_panel">
    <div class="x_title">
        <h3 class="panel-title"><b>Perbaikan Aset</b></h3>
    </div>
    
    <div class="x_content">
    
        <body>
            <form method = "POST" action = "<?php echo site_url('c_transaksi/simpan_perbaikan');?>">

                <input type="hidden" id="ue" name="ue">
                <!-- <input type="text" id="revaluasi"> -->
                <div class="form-group row">
                    <label class="col-sm-2" for="id_perbaikan">ID Perbaikan</label>	
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="id_perbaikan" name="id_perbaikan" value="<?= $kode ?>" readonly>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2" for="date">Tanggal Perbaikan</label>	
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="date" name="date" placeholder="Tanggal Perbaikan" required>
                    </div>
                </div>


                <div class="form-group row">
                    <label class="col-sm-2" for="aset">Aset</label>	
                    <div class="col-sm-3">
                        <select name="aset" id="aset" class="form-control">
                            <option value="">Pilih Aset</option>
                            <?php foreach ($aset as $key => $value) { ?>
                            <option value="<?= $value->id_detail_aset?>"><?= $value->aset?> - <b><?= $value->id_detail_aset?></b></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <!-- <input type="text" id="detail_aset"> -->
                <div class="form-group row">
                    <label class="col-sm-2" for="nilai_perbaikan">Nilai Perbaikan</label>	
                    <div class="col-sm-3">
                        <input type="text" name="nilai_perbaikan" class="form-control" id="nilai_perbaikan" placeholder="Nilai perbaikan" autocomplete="off">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2" for="keterangan">Keterangan</label>	
                    <div class="col-sm-3">
                        <textarea name="keterangan" id="keterangan" cols="10" rows="5" class="form-control" placeholder="Keterangan"></textarea>
                    </div>
                </div>
                <hr>
                <a href="<?= base_url('c_transaksi/perbaikan')?>" class="btn btn-default">Kembali</a>
                <button type="submit" class="btn btn-primary">Simpan</button>
            </form>
        </body>
    </div>
</div>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    var rupiah = document.getElementById("nilai_perbaikan");
    rupiah.addEventListener("keyup", function(e) {
    rupiah.value = formatRupiah(this.value);
    });

    function formatRupiah(angka, prefix) {
    var number_string = angka.replace(/[^,\d]/g, "").toString(),
        split = number_string.split(","),
        sisa = split[0].length % 3,
        rupiah = split[0].substr(0, sisa),
        ribuan = split[0].substr(sisa).match(/\d{3}/gi);

    if (ribuan) {
        separator = sisa ? "." : "";
        rupiah += separator + ribuan.join(".");
    }

    rupiah = split[1] != undefined ? rupiah + "," + split[1] : rupiah;
    return prefix == undefined ? rupiah : rupiah ? "Rp. " + rupiah : "";
    }
</script>
<script>
    $(document).ready(function() {
        $('#date').datepicker({
            minDate: 0, 
            dateFormat: 'dd/mm/yy'
        })
        $('#aset').on('change', function() {
            var id_detail = $('#aset').val()
            // alert(id_detail)
            $.ajax({
                url : '<?= base_url('c_transaksi/list_aset')?>', 
                data : {
                    id_detail : id_detail
                },
                type: "POST",
                success : function(data) {
                    var obj = JSON.parse(data)
                    // $("#detail_aset").val(obj.id_detail_aset)
                    if (obj !== null) {
                        var ue = obj.sisa_umur
                        $('#ue').val(ue)
                    } else {
                        $('#ue').val('')
                    }

                }
            })
        })
    })
</script>