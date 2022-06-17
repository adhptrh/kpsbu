<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>Profile Pegawai</h2>
        <div class="clearfix"></div>
      </div>
      <div class="x_content">
        <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
            <div class="profile_img">
                <div id="crop-avatar">
                <!-- Current avatar -->
                <img class="img-responsive avatar-view" src="<?= base_url('assets/production/images/user.png')?>" alt="Avatar" title="Change the avatar">
                </div>
            </div>
            <h3><?= ucwords($user->nama) ?></h3>

            <ul class="list-unstyled user_data">
              <li><i class="fa fa-map-marker user-profile-icon"></i> <?= ucwords($user->alamat . ', Indonesia')?></li>
              <li><i class="fa fa-briefcase user-profile-icon"></i> <?= ucwords('Pegawai '.$user->id_jenis_pegawai)?></li>
              <li><?= 'Tgl. Bergabung : ' . $user->created_at ?></li>
            </ul>

            <!-- <a class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>Edit Profile</a> -->
            <br>

        </div>
        <div class="col-md-9 col-sm-9 col-xs-12">
          <div class="" role="tabpanel" data-example-id="togglable-tabs">
            <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
              <li role="presentation" class="active"><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="true">History Lembur</a>
              </li>
              <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Slip Gaji</a>
              </li>
            </ul>
            <div id="myTabContent" class="tab-content">
              <?php $this->load->view('profile/lembur_detail');?>
              <?php $this->load->view('profile/slipgaji');?>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  $(document).on("click", "#filer", function() {
    var bulan = $("#bulan").val();
    var tahun = $("#tahun").val();
    let params = {
      bulan : bulan, 
      tahun : tahun
    };
    $.ajax({
      url : "<?= base_url('Profile/detailSlipGaji')?>",
      method : "post", 
      data : params,
      success : function(response) {
        var obj = JSON.parse(response)
        var tableRow = '';
        obj.forEach(element => {
          var i = 1;
          tableRow += `<tr>
              <td>${i++}</td>
              <td>${element.id_penggajian}</td>
              <td>${element.tanggal}</td>
              <td>
                  <a class="btn btn-default btn-xs slipgaji" data-id="${element.id_penggajian}")>Slip Gaji</a>
              </td>
          </tr>`;
        });
        $("#myTable tbody").html(tableRow);
      }
    });
  });

  $(document).on("click", ".slipgaji", function() {
    var id = $(this).data("id")
    var win = window.open('<?= base_url('Profile/slipgaji/')?>' + id, '_blank');
    if (win) {
        //Browser has allowed it to be opened
        win.focus();
    } else {
        //Browser has blocked it
        alert('Please allow popups for this website');
    }

  })
</script>