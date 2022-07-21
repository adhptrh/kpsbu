<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Laporan Pembagian SHU</h3>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">
                        </h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <form method="get" class="form-inline form-group">
                    <label for="periode">Anggota</label>
                    <select name="no_anggota" required class="form-control">
                        <option selected disabled value>Pilih anggota</option>
                        <?php foreach ($anggotas as $anggota) { ?>
                            <option value="<?= $anggota->no_peternak ?>" <?= ($anggota->no_peternak == $no_anggota) ? "selected":"" ?>><?= $anggota->nama_peternak ?></option>
                        <?php } ?>
                    </select>
                    <button class="btn btn-primary">Filter</button>
                </form>
                <form action="<?= base_url("Shu/simpan_pengajuan_jurnal_jasa_anggota") ?>" method="post">
                    <div id="notif">
                        <?php echo $this->session->flashdata('notif_ubah'); ?>
                    </div>
                    <div class="table-responsive">
                        <?php
                        echo '<input type="hidden" name="id_trans_total" value="' . $kode_total . '">';
                        foreach ($list as $k => $v) {
                            echo '<input type="hidden" name="id_trans[]" value="' . $v->id_trans . '">';
                        }
                        ?>
                        <table class="table table-bordered" id="datatable">
                            <thead>
                                <tr>
                                    <th style="width: 5%;">No</th>
                                    <th>Kode</th>
                                    <th>Tanggal</th>
                                    <th>Anggota</th>
                                    <th>Jasa Modal</th>
                                    <th>Jasa Anggota</th>
                                    <th>Sisa Hasil Usaha</th>
                                    <th>Pendekatan Kontribusi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $no = 1;
                                $tot_shu = 0;
                                $persen = 0;
                                $sum_shu = $total_shu;
                                foreach ($list as $item) { ?>
                                    <?php
                                    $tot_shu += $item->sisa_hasil_usaha;
                                    $persen += number_format(($item->sisa_hasil_usaha / $sum_shu * 100), 2);
                                    ?>
                                    <tr>
                                        <td><?= $no++ ?></td>
                                        <td><?= $item->id_trans ?></td>
                                        <td><?= $item->tanggal ?></td>
                                        <td><b><?= $item->id_anggota ?></b> - <?= $item->nama_peternak ?></td>
                                        <td class="text-right"><?= format_rp($item->jasa_modal) ?></td>
                                        <td class="text-right"><?= format_rp($item->jasa_anggota) ?></td>
                                        <td class="text-right"><?= format_rp($item->sisa_hasil_usaha) ?></td>
                                        <td><?= number_format(($item->sisa_hasil_usaha / $sum_shu * 100), 2) . "%" ?></td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="6" class="text-center">Total SHU</th>
                                    <th class="text-right"><?= format_rp($tot_shu) ?></th>
                                    <th><?= $persen . "%" ?></th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php $this->load->view('shu/jasa_anggota/add') ?>
<script>
    $(document).ready(function() {
        $(".show-div").hide()
        $("#btn_simpan").prop('disabled', true)
        $("#anggota").on('change', function() {
            var val = $(this).val()
            if (val) {
                $(".show-div").show()
                $("#btn_simpan").prop('disabled', false)

                $.ajax({
                    url: "<?= base_url('shu/get_data_jasa_anggota') ?>",
                    method: "post",
                    data: {
                        id: val
                    },
                    success: function(e) {
                        var obj = JSON.parse(e)
                        console.log(obj)
                        var jasa_anggota = Math.ceil((obj.total_penjualan / obj.jasa_anggota) * obj.total_transaksi)
                        $("#total_penjualan").val(obj.total_penjualan)
                        $("#jasa_anggota").val(obj.jasa_anggota)
                        var total_trans_susu = obj.total_transaksi
                        if (total_trans_susu) {
                            $("#total_trans_susu").val(total_trans_susu)
                        } else {
                            $("#total_trans_susu").val(0)
                        }
                        $("#total_jasa_anggota").val(jasa_anggota)

                        // modal
                        var jasa_modal = Math.ceil(((obj.jasa_modal / obj.total_simpanan) * obj.total_simpanan_peranggota))
                        $("#total_modal").val(obj.jasa_modal)
                        $("#total_simpanan").val(obj.total_simpanan)
                        var cek_simpanan_anggota = obj.total_simpanan_peranggota
                        if (cek_simpanan_anggota) {
                            $("#total_simpanan_anggota").val(cek_simpanan_anggota)
                        } else {
                            $("#total_simpanan_anggota").val(0)
                        }
                        $("#jasa_modal").val(jasa_modal)

                        // shu 
                        var shu = jasa_modal + jasa_anggota
                        $("#sisa_hasil_usaha").val(shu)

                        if (shu == 0) {
                            $("#btn_simpan").prop('disabled', true)
                        }
                    }
                })
            } else {
                $(".show-div").hide()
                $("#btn_simpan").prop('disabled', true)
            }
            console.log(val)
        })
    })
</script>