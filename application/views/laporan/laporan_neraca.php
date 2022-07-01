<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>
                <div class="header" style="padding-bottom: 10px;">
                    <h4 class="text-center">Laporan Neraca</h4>
                    <h5 class="text-center">Periode </h5>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <tr>
                            <th colspan="2">Aktiva</th>
                            <th colspan="2">Pasiva</th>
                        </tr>
                        <tr>
                            <th colspan="2">Aktiva Lancar</th>
                            <th colspan="2">Kewajiban Lancar</th>
                        </tr>
                        <tr>
                            <td>Kas</td>
                            <td><?= format_rp($kas) ?></td>
                            <td>Utang</td>
                            <td>123</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>