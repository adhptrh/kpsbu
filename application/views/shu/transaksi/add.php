<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <h3 class="modal-title" id="exampleModalLabel">Tambah SHU</h3>
        </div>
        <form action="<?= base_url('shu/save_transaksi_shu')?>" method="POST">
            <input name="p35" type="hidden" value="<?= $nominal_shu*0.35 ?>">
            <div class="modal-body">
                <h6>Kode SHU : <?= $kode ?></h6>
                <h6>Nominal SHU : <?= format_rp($nominal_shu) ?></h6>
                <h6>65% dibagikan ke anggota: <?= format_rp($nominal_shu*0.65) ?></h6>
                <h6>35% untuk tahun selanjutnya: <?= format_rp($nominal_shu*0.35) ?></h6>
                <!-- <div class="form-group">
                    <p>Pembagian SHU</p>
                    <select name="opsi_pembagian_shu" id="pembagian_shu" class="form-control" required>
                        <option selected disabled value>Pilih</option>
                        <option value="anggota70">SHU dibagikan ke anggota 65%</option>
                        <option value="shuthnselanjutnya30">SHU untuk tahun selanjutnya 35%</option>
                    </select>
                </div> -->
                <div id="inp">
                    <?php 
                    $total1 = 0;
                    foreach ($shu as $key => $value) { ?>
                    <?php
                        $persentase1 = ($value->persentase/100);
                        $total1 = $persentase1 * $nominal_shu;
                    ?>
                    <input type="hidden" value="<?= $value->deskripsi ?>" name="uraian[]">
                    <input type="hidden" value="<?= round($total1) ?>" name="total[]">
                    <?php } ?>
                </div>
                <input type="hidden" value="<?= $kode ?>" name="kode_shu">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Uraian</th>
                            <th>Persentase</th>
                            <th>Nominal</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody id="detail_pembagian">
                        <?php 
                        $no = 1;
                        $total = 0;
                        foreach ($shu as $item) { ?>
                        <?php
                        $persentase = ($item->persentase/100);
                        $total = $persentase * $nominal_shu;
                        // print_r($total);
                        ?>
                        <tr>
                            <td><?= $no++ ?></td>
                            <td><?= $item->deskripsi?></td>
                            <td><?= $item->persentase?></td>
                            <td><?= format_rp($nominal_shu) ?></td>
                            <td><?= format_rp($total)?></td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table> 

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Simpan</button>
            </div>
        </form>
        </div>
    </div>
</div>

<script>
    let nominal_shu = <?= $nominal_shu ?>;
    $(document).ready(()=>{
        console.log($("#pembagian_shu"));
        $("#inp").html(`
                <?php 
                    $total1 = 0;
                    foreach ($shu as $key => $value) { ?>
                    <?php
                        $persentase1 = ($value->persentase/100);
                        $total1 = $persentase1 * $nominal_shu*0.65;
                    ?>
                    <input type="hidden" value="<?= $value->deskripsi ?>" name="uraian[]">
                    <input type="hidden" value="<?= round($total1) ?>" name="total[]">
                    <?php } ?>
                `);

                $("#detail_pembagian").html(`
                    <?php 
                    $total = 0;
                    foreach ($shu as $key => $item) { 
                        $persentase = ($item->persentase/100);
                        $total = $persentase * ($nominal_shu*0.65);
                        ?>
                        <tr>
                            <td><?= $key+1 ?></td>
                            <td><?= $item->deskripsi?></td>
                            <td><?= $item->persentase?></td>
                            <td><?= format_rp($nominal_shu*0.65) ?></td>
                            <td><?= format_rp($total)?></td>
                        </tr>
                    <?php } ?>
                `);
        $("#pembagian_shu").on("change",()=>{
            let pembagian_shu = $("#pembagian_shu").val();
            if(pembagian_shu == "anggota70"){
                $("#inp").html(`
                <?php 
                    $total1 = 0;
                    foreach ($shu as $key => $value) { ?>
                    <?php
                        $persentase1 = ($value->persentase/100);
                        $total1 = $persentase1 * $nominal_shu*0.65;
                    ?>
                    <input type="hidden" value="<?= $value->deskripsi ?>" name="uraian[]">
                    <input type="hidden" value="<?= round($total1) ?>" name="total[]">
                    <?php } ?>
                `);

                $("#detail_pembagian").html(`
                    <?php 
                    $total = 0;
                    foreach ($shu as $key => $item) { 
                        $persentase = ($item->persentase/100);
                        $total = $persentase * ($nominal_shu*0.65);
                        ?>
                        <tr>
                            <td><?= $key+1 ?></td>
                            <td><?= $item->deskripsi?></td>
                            <td><?= $item->persentase?></td>
                            <td><?= format_rp($nominal_shu*0.65) ?></td>
                            <td><?= format_rp($total)?></td>
                        </tr>
                    <?php } ?>
                `);
            }else{
                $("#inp").html(`
                <?php 
                    $total1 = 0;
                    foreach ($shu as $key => $value) { ?>
                    <?php
                        $persentase1 = ($value->persentase/100);
                        $total1 = $persentase1 * $nominal_shu*0.35;
                    ?>
                    <input type="hidden" value="<?= $value->deskripsi ?>" name="uraian[]">
                    <input type="hidden" value="<?= round($total1) ?>" name="total[]">
                    <?php } ?>
                `);
                $("#detail_pembagian").html(`
                    <?php 
                    $total = 0;
                    foreach ($shu as $key => $item) { 
                        $persentase = ($item->persentase/100);
                        $total = $persentase * ($nominal_shu*0.35);
                        ?>
                        <tr>
                            <td><?= $key+1 ?></td>
                            <td><?= $item->deskripsi?></td>
                            <td><?= $item->persentase?></td>
                            <td><?= format_rp($nominal_shu*0.35) ?></td>
                            <td><?= format_rp($total)?></td>
                        </tr>
                    <?php } ?>
                `);
            }
        });
    })
</script>