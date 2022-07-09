<div class="row">
    <div class="col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <div class="row">
                    <div class="col-sm-10 col-12">
                        <h3 id="quote">Laporan Penjualan SHU</h3>
                    </div>
                    <div class="col-sm-2 col-12">
                        <h3 id="quote">

                        </h3>
                    </div>
                </div>
            </div>
            <div class="x_content">
                <div id="notif">
                    <?php echo $this->session->flashdata('notif_ubah'); ?>
                </div>

                <div class="" role="tabpanel" data-example-id="togglable-tabs">
                    <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                        <li role="presentation" class="active">
                            <a href="#penjualan-susu" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Laporan Penjualan Susu</a>
                        </li>
                        <li role="presentation" class=""><a href="#penjualan-pakan-konsentrat" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Laporan Penjualan Pakan Konsentrat</a>
                        </li>
                        <li role="presentation" class=""><a href="#pengolahan-susu" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Laporan Pengolahan Susu</a>
                        </li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <div role="tabpanel" class="tab-pane fade active in" id="penjualan-susu" aria-labelledby="home-tab">
                            <?php $this->load->view('shu/laporan_penjualan_shu/susu_murni');?>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="penjualan-pakan-konsentrat" aria-labelledby="profile-tab">
                            <?php $this->load->view('shu/laporan_penjualan_shu/pakan_konsentrat');?>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="pengolahan-susu" aria-labelledby="profile-tab">
                            <?php $this->load->view('shu/laporan_penjualan_shu/susu_olahan');?>
                        </div>
                    </div>
                </div>

                <div class="total-pnj">
                    <h5 style="color: black;" class="text-right">Total Penjualan &nbsp; : <?= format_rp($total) ?></h5>
                </div>
            </div>
        </div>
    </div>
</div>