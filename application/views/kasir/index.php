<div class="row">
    <div class="col-sm-5">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3>POS Penjualan</h3>
                    </div>
                    <div class="col-sm-2">
                        <h5 class=""></h5>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif'); ?>
                </div>
                <form action="<?= base_url('Kasir/add_detail') ?>" method="POST">
                    <div class="form-group row">
                        <label for="invoice" class="col-sm-2 col-form">Inovice</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control" id="invoice" name="invoice" value="<?= $kode ?>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="kasir" class="col-sm-2 col-form">Kasir</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control" id="kasir" value="<?= $user ?>">
                        </div>
                    </div>
                    <hr>
                    <div class="form-group row">
                        <label for="barang" class="col-sm-2 col-form">Product</label>
                        <div class="col-sm-8">
                            <div class="input-group">
                                <input type="text" name="barang" class="form-control scan_barcode" id="barang" placeholder="scan product here" autofocus required>
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-default" id="btn-search" data-target="#show" data-toggle="modal"><i class="fa fa-search"></i></button>
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <input type="number" class="form-control" name="qty" id="qty" value="1" min="1">
                        </div>
                    </div>
                    <hr>
                    <div class="text-right">
                        <button type="submit" class="btn btn-sm btn-secondary">Lanjutkan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="col-sm-7">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3>Detail Penjualan</h3>
                    </div>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Kode Produk</th>
                            <th>Nama Produk</th>
                            <th>Harga</th>
                            <th class="text-center">Qty</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        foreach ($detail as $key => $value) { ?>
                            <tr>
                                <td><?= $value->kode ?></td>
                                <td><?= $value->nama_produk ?></td>
                                <td class="text-right"><?= format_rp($value->harga) ?></td>
                                <td style="width:50px;">
                                    <input style="width:50px;" id="qty_update_<?= $value->kode ?>" type="number" value="<?= $value->jml ?>" min="0">
                                </td>
                                <td class="text-center" style="width: 15%;">
                                    <button class="btn btn-xs btn-warning btn-update" data-kode="<?= $value->kode ?>" data-invoice="<?= $value->invoice ?>">Update</button>
                                    <button class="btn btn-xs btn-danger" onclick="hapus(<?= $value->id ?>)">Hapus</button>
                                </td>
                            </tr>
                        <?php } ?>
                    </tbody>
                    <input type="hidden" value="<?= $total ?>" name="total">
                </table>
                <hr>
                <?php
                // rumus
                $ppn = $total * 0.11;
                $gtot = $ppn + $total;
                ?>
                <h5>Total : <?= $total = (empty($total)) ? '-' : format_rp($total) ?></h5>
                <h5>PPN (11%) : <?= $ppn = (empty($ppn)) ? '-' : format_rp($ppn) ?></h5>
                <h5>Grand Total : <?= $gtot = (empty($gtot)) ? '-' : format_rp($gtot) ?></h5>
                <hr>
                <div class="text-left">
                    <!-- <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#bayar">Bayar</button> -->
                    <?php
                    // print_r(count($detail));
                    $cek_detail = count($detail);
                    if ($cek_detail > 0) { ?>
                        <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#bayar">Bayar</button>

                    <?php } else { ?>
                        <button class="btn btn-sm btn-danger">Bayar</button>
                    <?php }
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>

<?php $this->load->view('script'); ?>
<?php $this->load->view("Kasir/struk"); ?>
<?php $this->load->view('Kasir/show'); ?>
<?php $this->load->view('Kasir/bayar'); ?>
<script>
    function hapus(id) {
        // alert(id)
        $.ajax({
            url: "<?= base_url('Kasir/hapus_detail/') ?>" + id,
            method: "POST",
            success: function(e) {
                var obj = JSON.parse(e)
                location.reload()
            }
        })
    }
/* 
    function print_checkout() {
        var win = window.open('http://localhost/kpsbu/Kasir', '_blank');
        if (win) {
            //Browser has allowed it to be opened
            win.focus();
        } else {
            //Browser has blocked it
            alert('Please allow popups for this website');
        }
    } */

    // function print() {
    //     var w = window.open()

    // }
</script>
<script type="text/javascript">
    $(document).ready(function() {
        time()
        show()
        autocomplete()
        $("#struks").modal("show")
        $('#umum').hide()
        $('#selain-umum').hide()
        $('.info').hide()
        $('.anggota').hide()
        // $('.pembeli').hide()


        $("#prnt").click(()=>{
            window.open("<?= base_url('Kasir/pdf/'.$this->session->flashdata("invoice"))?>",'_blank')
        })
        $("#myForm").submit(function(e) {
            e.preventDefault();
            var barcode = $("#barang").val();
            var invoice = $("#invoice").val();
            var qty = $("#qty").val();
            // console.log(barcode)
            $.ajax({
                url: "<?= base_url('Kasir/detail_barcode/') ?>" + qty + "/" + invoice + "/" + barcode,
                success: function(response) {
                    data = JSON.parse(response);
                    console.log(data)
                }
            });
        });

        $('.btn-update').on('click', function() {
            var kode = $(this).data('kode')
            var invoice = $(this).data('invoice')
            var qty = $('#qty_update_' + kode).val()
            $.ajax({
                method: 'POST',
                url: "<?= base_url('Kasir/update_qty/') ?>" + kode + "/" + invoice + "/" + qty,
                success: function(e) {
                    data = JSON.parse(e);
                    console.log(data)
                    location.reload();
                }
            })
        })

        $('#jenis').on('change', function() {
            var jenis = $('#jenis').val()
            $('.btn-checkout').prop('disabled', true)
            $('.btn-checkout-print').prop('disabled', true)
            $("#kembalian").val(0)
            // alert(this.value)
            if (!this.value) {
                // alert('value kosong')
                $('#umum').hide()
                $('#selain-umum').hide()
            } else {
                if (jenis === '2') {
                    // non anggota
                    $('#umum').show()
                    // $('.pembeli').show()
                    $('#selain-umum').hide()
                    $('.anggota').hide()
                    var coba = '<input type="text" class="form-control" name="pembeli" value="Guest">';
                    $('#pembeli').html(coba)
                } else {
                    // anggota
                    $('#umum').hide()
                    $('#selain-umum').show()
                    $('.anggota').show()
                    var coba = '<select name="pembeli" class="form-control pilih_pembeli">' +
                        '</select>';
                    $('#pembeli').html(coba)
                }
            }
        })


        $('#anggota').on('change', function() {
            var val = $(this).val()

            if (val != '') {
                $.ajax({
                    url: "<?= base_url('Kasir/jenis/') ?>" + val,
                    method: "post",
                    data: {
                        val: val
                    },
                    success: function(e) {
                        // var obj = JSON.parse(e)
                        // console.log(obj)
                        $('.pilih_pembeli').html(e)
                    }
                })
            }
        })


        $("#tipe").on('change', function() {
            var tipe = $('#tipe').val()
            console.log(tipe)
            $('#umum').show()
            if (tipe === 'kredit') {
                $(".form-kembalian").hide()
                $("#input_pembayaran").val($("#total").val()).prop('readonly', true);
                $("input[name='pembayaran']").keyup(function() {
                    var typing = $(this).val()
                    console.log(typing)
                })

                var total = $("#total").data('total')

                $("input[name='pembayaran']").focusout(function() {
                    var typing = $(this).val()
                    var total = $("#total").val()
                    if (total !== typing) {
                        alert('Input pembayaran harus sama dengan total')
                        $('.btn-checkout').prop('disabled', true)
                        $('.btn-checkout-print').prop('disabled', true)
                    } else {
                        $('.btn-checkout').prop('disabled', false)
                        $('.btn-checkout-print').prop('disabled', false)
                    }
                })
            } else {
                $(".form-kembalian").show()
                $("#input_pembayaran").val(0).prop('readonly', false)
                $("input[name='pembayaran']").keyup(function() {
                    var typing = $(this).val()
                    console.log(typing)
                })

                var total = $("#total").data('total')
                $('.btn-checkout').prop('disabled', true)
                $('.btn-checkout-print').prop('disabled', true)

                $("input[name='pembayaran']").focusout(function() {
                    var typing = $(this).val()
                    var total = $("#total").val()
                    var kembalian = typing - total
                    console.log(typing)

                    if (typing) {
                        if (kembalian >= 0) {
                            // console.log("lunas atau ada kembalian")
                            $("#kembalian").val(kembalian)
                            $(".info").hide()
                            $('.btn-checkout').prop('disabled', false)
                            $('.btn-checkout-print').prop('disabled', false)

                        } else {
                            // console.log("minus")
                            $("#kembalian").val(kembalian)
                            $(".info").show()
                            $('.btn-checkout').prop('disabled', true)
                            $('.btn-checkout-print').prop('disabled', true)

                        }
                    }
                })
            }

        })

        $("input[name='pembayaran']").keyup(function() {
            var typing = $(this).val()
            console.log(typing)
        })

        var total = $("#total").data('total')
        $('.btn-checkout').prop('disabled', true)
        $('.btn-checkout-print').prop('disabled', true)

        $("input[name='pembayaran']").focusout(function() {
            var typing = $(this).val()
            var total = $("#total").val()
            var kembalian = typing - total
            console.log(typing)

            if (typing) {
                if (kembalian >= 0) {
                    // console.log("lunas atau ada kembalian")
                    $("#kembalian").val(kembalian)
                    $(".info").hide()
                    $('.btn-checkout').prop('disabled', false)
                    $('.btn-checkout-print').prop('disabled', false)

                } else {
                    // console.log("minus")
                    $("#kembalian").val(kembalian)
                    $(".info").show()
                    $('.btn-checkout').prop('disabled', true)
                    $('.btn-checkout-print').prop('disabled', true)

                }
            }
        })
    })
</script>
<script>
    function time() {
        // 24 hour clock  
        setInterval(function() {

            var currentTime = new Date();
            var hours = currentTime.getHours();
            var minutes = currentTime.getMinutes();
            var seconds = currentTime.getSeconds();

            // Add leading zeros
            hours = (hours < 10 ? "0" : "") + hours;
            minutes = (minutes < 10 ? "0" : "") + minutes;
            seconds = (seconds < 10 ? "0" : "") + seconds;

            // Compose the string for display
            var currentTimeString = hours + ":" + minutes + ":" + seconds;
            $(".clock").html(currentTimeString);

        }, 1000);
    }

    function show() {
        // $('#btn-search').on('click', function() {
        //     alert('clicked')
        // })
    }

    function autocomplete() {
        $(function() {
            // var availableTags = '<?php echo base_url('Kasir/list') ?>';
            // console.log(availableTags)
            $("#barang").autocomplete({
                // source: availableTags, 
                // minLength: 2
                source: function(request, response) {
                    $.ajax({
                        url: '<?= base_url('Kasir/list') ?>',
                        type: 'post',
                        dataType: 'json',
                        data: {
                            search: request.term
                        },
                        success: function(data) {
                            response(data)
                        }
                    })
                },
                select: function(event, ui) {
                    $('#barang').val(ui.item.label)
                    return false;
                },
                minLength: 3
            });
        });
    }

    $(function() {
        $('.btn-select').on('click', function() {
            // INSERT DATA DISINI

            alert('asdasdasASDASD')
        })
    })
</script>