<html>
	<body>
		<div class="x_panel">
            <div class="x_title">
                <h3 class="panel-title"><b>Daftar Revaluasi</b></h3>
            </div>

            <div class="x_content">

                <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        
                    <div id="myTabContent" class="tab-content">
                        <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                            <a href = "<?php echo site_url()."c_transaksi/form_revaluasi"?>" class="btn btn-info btn-sm" role="button"><span class="glyphicon glyphicon-plus"></span> Tambah Data</a>
                            <table id="datatable" class="table table-striped table-bordered table-hover jambo_table">
                                <thead>
                                    <tr class="headings">
                                        <th style="width: 2px;">No</th>
                                        <th>ID Revaluasi</th>
                                        <th>Bulan Revaluasi</th>
                                        <th>Tarif Revaluasi</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php
                                $no = 1;
                                foreach ($list as $key => $value) { ?>
                                    <tr>
                                        <td><?= $no++ ?></td>
                                        <td><?= $value->id_revaluasi?></td>
                                        <td><?= $value->bulan_revaluasi?></td>
                                        <td class="text-right"><?= penyusutan($value->tarif_revaluasi)?></td>
                                        <td class="text-center">
                                            <a href="<?= base_url('c_transaksi/detail/'.$value->id_revaluasi)?>" class="btn btn-primary btn-sm">Detail Revaluasi</a>
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
	</body>
</html>