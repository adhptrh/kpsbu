<html>
	<body>
		<div class="x_panel">
            <div class="x_title">
                <h3 class="panel-title"><b>Daftar Perbaikan</b></h3>
            </div>

            <div class="x_content">

                <div class="" role="tabpanel" data-example-id="togglable-tabs">
                    <div id="myTabContent" class="tab-content">
                        <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                            <a href = "<?php echo site_url()."c_transaksi/form_perbaikan"?>" class="btn btn-info btn-sm" role="button"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>
                            
                            <table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
                                <thead>
                                    <tr class="headings">
                                        <th style="width: 2px;">No</th>
                                        <th>ID Perbaikan</th>
                                        <th>Nama Aset</th>
                                        <th>Bulan Perbaikan</th>
                                        <th>Kategori</th>
                                        <th>Nilai Perbaikan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $no = 1; 
                                    foreach ($list as $key => $value) { ?>
                                    <tr>
                                        <td><?= $no++?></td>
                                        <td><?= $value->id_perbaikan?></td>
                                        <td><?= $value->aset?> - <b><?= $value->id_detail_aset?></b></td>
                                        <td><?= date('F Y', strtotime($value->tgl_perbaikan))?></td>
                                        <td><?= $value->ket_perbaikan?></td>
                                        <td class="text-right"><?= penyusutan($value->nilai_perbaikan)?></td>
                                        <!-- <td class="text-center">
                                            <a href="<?= base_url('c_transaksi/detail/'.$value->id_perbaikan)?>" class="btn btn-primary">Detail</a>
                                        </td> -->
                                    </tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</body>
</html>