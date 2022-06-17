<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="<?php echo base_url(); ?>assets/images/brandlogo.jpg" type="image/ico" />
  <!-- <title>KPSBU</title> -->

  <!-- Bootstrap -->
  <title>KPSBU</title>

  <link href="<?php echo base_url(); ?>assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="<?php echo base_url(); ?>assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <!-- NProgress -->
  <link href="<?php echo base_url(); ?>assets/vendors/nprogress/nprogress.css" rel="stylesheet">
  <!-- Animate.css -->
  <link href="<?php echo base_url(); ?>assets/vendors/animate.css/animate.min.css" rel="stylesheet">

  <!-- Custom Theme Style -->
  <link href="<?php echo base_url(); ?>assets/build/css/custom.min.css" rel="stylesheet">
</head>

<body class="login" style="background-image: url(<?php echo base_url(); ?>assets/images/brandlogo.jpg); height: 0%; background-position: center; background-repeat: no-repeat; margin-top: 20%">

  <body class="login">
    <div>
      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <center>
              <!-- <img src="<?php echo base_url(); ?>assets/images/favicon-32x32.png"> -->
            </center>
            <hr>

            <form method="POST" action="<?php echo site_url('c_login/cek_login'); ?>">
              <h1>Login</h1>
              <?php if (isset($error)) {
                echo "<div class='alert alert-warning'>" . $error . "</div>";
              } ?>

              <div>
                <input type="text" class="form-control" placeholder="Username" required="" name="username" autocomplete="off" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" required="" name="password" autocomplete="off" />
              </div>
              <div>
                <button class="btn btn-default" onclick="location.href='<?= base_url('Absensi') ?>'" type="button">Presensi Kehadiran</button>
                <button type="submit" class="btn btn-default btn-primary">Log in</button>
              </div>

              <div class="clearfix"></div>

              <div class="separator">



                <div>
                  <!-- <h1 style="font-size: 35px"> KPSBU!</h1> -->

                </div>
              </div>
            </form>
          </section>
        </div>

      </div>
    </div>
  </body>

</html>