<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>
                <div class="header" style="padding-bottom: 10px;">
                    <h4 class="text-center">Neraca Saldo</h4>
                    <h5 class="text-center">Periode </h5>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Nomor Akun</th>
                                <th>Nama Akun</th>
                                <th>Debit</th>
                                <th>Kredit</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>