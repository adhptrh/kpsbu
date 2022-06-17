<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h4 id="quote" class="text-center">Penggajian Periode <?= date('F Y')?>
                        </h4>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote"></h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>
                <div class="">
                    <div class="row">
                        <div class="col-sm-6">
                            <table>
                                <div style="padding-bottom:10px">
                                    <h4><b>Data Diri</b></h4>
                                    <tr class="detil">
                                        <td>NIP</td>
                                        <th>&nbsp : &nbsp<?= $peg->nip?></th>
                                    </tr>
                                    <tr class="detil">
                                        <td>NPWP</td>
                                        <th>&nbsp : &nbsp<?= $peg->npwp ? $peg->npwp : '-' ?></th>
                                    </tr>
                                    <tr class="detil">
                                        <td>Nama Lengkap</td>
                                        <th>&nbsp : &nbsp<?= $peg->nama?></th>
                                    </tr>
                                    <tr class="detil">
                                        <td>No RFID</td>
                                        <th>&nbsp : &nbsp<?= $peg->rfid?></th>
                                    </tr>
                                </div>
                            </table>
                        </div>
                        <div class="col-sm-6">
                            <table>
                                <div style="padding-bottom:10px">
                                    <h4><b>Detail Pegawai</b></h4>
                                    <tr class="detil">
                                        <td>Jabatan</td>
                                        <th>&nbsp : &nbsp<?= $peg->id_jabatan?></th>
                                    </tr>
                                    <tr class="detil">
                                        <td>Jenis Pegawai</td>
                                        <th>&nbsp : &nbsp<?= $peg->id_jenis_pegawai?></th>
                                    </tr>
                                    <tr class="detil">
                                        <td>Pendidikan</td>
                                        <th>&nbsp : &nbsp<?= $peg->pendidikan ?? '-' ?></th>
                                    </tr>
                                    <tr class="detil">
                                        <td>Total Presensi</td>
                                        <th>&nbsp : &nbsp<?= $detil->total ?? 0 ?></th>
                                    </tr>
                                    <tr class="detil">
                                        <td>Ket. PTKP</td>
                                        <th>&nbsp : &nbsp<?= ($peg->id_ptkp == "") ? 'Tidak kena pajak' : $peg->id_ptkp ?></th>
                                    </tr>
                                </div>
                            </table>
                        </div>
                    </div>
                    <hr>
                    <table class="table table-bordered">
                        <?php 
                        $gapok = $detail2[0]->gaji_pokok;
                        $tunjangan_jabatan = $detail2[0]->tunjangan_jabatan;
                        $tunjangan_kesehatan = $detail2[0]->tunjangan_kesehatan;
                        $bonus_kerja = $bonus;
                        $tot_penghasilan = $gapok + $tunjangan_jabatan + $tunjangan_kesehatan + $bonus + $lembur;
                        $tot_pengurang = $ptkp;
                        ?>
                        <tr>
                            <th colspan="2">Penghasilan</th>
                            <th colspan="2" style="width: 50%;">Potongan</th>
                        </tr>
                        <tr>
                            <th>Gaji Pokok</th>
                            <td class="text-right"><?= format_rp($gapok)?></td>
                            <th>Pph pasal 21 atas penghasilan kena pajak sebulan</th>
                            <td class="text-right"><?= format_rp($ptkp)?></td>
                        </tr>
                        <tr>
                            <th>Tunjangan Jabatan</th>
                            <td class="text-right"><?= format_rp($tunjangan_jabatan)?></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>Tunjangan Kesehatan</th>
                            <td class="text-right"><?= format_rp($tunjangan_kesehatan)?></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>Bonus Kerja</th>
                            <td class="text-right"><?= format_rp($bonus_kerja)?></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>Total Penghasilan</th>
                            <td class="text-right"><?= format_rp($tot_penghasilan)?></td>
                            <th>Total Potongan</th>
                            <td class="text-right"><?= format_rp($tot_pengurang)?></td>
                        </tr>
                        <tr>
                            <th colspan="2" class="text-center">Pendapatan Bersih</th>
                            <th colspan="2" class="text-center"><?= format_rp($total)?></th>
                        </tr>
                    </table>
                    <p style="color:red">
                        <strong>Note : Pegawai kontrak tidak dikenakan PPH 21 PTKP.</strong>
                    </p>
                    <hr>
                    <form action="<?= base_url('Penggajian/bayar_gaji')?>" method="post">
                        <input type="hidden" id="nip" name="nip" value="<?= $peg->nip?>">
                        <input type="hidden" id="gaji_pokok" name="gaji_pokok" value="<?= $gapok?>">
                        <input type="hidden" id="tunjangan_jabatan" name="tunjangan_jabatan" value="<?= $tunjangan_jabatan?>">
                        <input type="hidden" id="tunjangan_kesehatan" name="tunjangan_kesehatan" value="<?= $tunjangan_kesehatan?>">
                        <input type="hidden" id="bonus_kerja" name="bonus_kerja" value="<?= $bonus_kerja?>">
                        <input type="hidden" id="ptkp" name="ptkp" value="<?= $ptkp?>">
                        <input type="hidden" id="tot_penghasilan" name="tot_penghasilan" value="<?= $tot_penghasilan?>">
                        <input type="hidden" id="tot_pengurang" name="tot_pengurang" value="<?= $tot_pengurang?>">
                        <input type="hidden" id="total" name="total" value="<?= $total?>">
                        <div class="text-right">
                            <a href="<?= base_url('Penggajian') ?>" class="btn btn-default btn-md">Kembali</a>
                            <button type="submit" class="btn btn-primary" id="bayar"
                            data-nip="<?= $peg->nip?>"
                            >Bayar Gaji</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- <script>
    $(document).ready(function() {

        $(document).on("click", "#bayar", function() {
            let params = {
                nip : $(this).data("nip"),
                gaji_pokok : $("#gaji_pokok").val() ,
                tunjangan_jabatan : $("#tunjangan_jabatan").val() ,
                tunjangan_kesehatan : $("#tunjangan_kesehatan").val() ,
                bonus_kerja : $("#bonus_kerja").val() ,
                ptkp : $("#ptkp").val() ,
                tot_penghasilan : $("#tot_penghasilan").val() ,
                tot_pengurang : $("#tot_pengurang").val() ,
                total : $("#total").val() ,
            };
            $.ajax({
                url : "<?= base_url('Penggajian/bayar_gaji')?>",
                type : "post", 
                data : params, 
                dataType : "json",
                success : function(e) {
                    // window.location.href = "<?= base_url('Penggajian')?>";
                    console.log(e)
                }
            });
        });
    });
</script> -->
