<!DOCTYPE html>
<html lang="en">

<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <!-- Meta, title, CSS, favicons, etc. -->
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="icon" href="<?php echo base_url(); ?>assets/images/brandlogo.jpg" type="image/ico" />
   <?php
   date_default_timezone_set('Asia/Jakarta');
   ?>
   <title>KPSBU</title>
   <!-- <title>Test</title> -->
   <!-- Bootstrap -->
   <link href="<?php echo base_url(); ?>assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
   <!-- Font Awesome -->
   <link href="<?php echo base_url(); ?>assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
   <!-- NProgress -->
   <link href="<?php echo base_url(); ?>assets/vendors/nprogress/nprogress.css" rel="stylesheet">
   <!-- iCheck -->
   <link href="<?php echo base_url(); ?>assets/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
   <!-- bootstrap-progressbar -->
   <link href="<?php echo base_url(); ?>assets/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
   <!-- JQVMap -->
   <link href="<?php echo base_url(); ?>assets/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />
   <!-- bootstrap-daterangepicker -->
   <!-- <link href="<?php echo base_url(); ?>assets/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet"> -->
   <!-- Custom Theme Style -->
   <link href="<?php echo base_url(); ?>assets/build/css/custom.min.css" rel="stylesheet">
   <!-- Datatables -->
   <link href="<?php echo base_url(); ?>assets/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
   <link href="<?php echo base_url(); ?>assets/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
   <link href="<?php echo base_url(); ?>assets/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
   <link href="<?php echo base_url(); ?>assets/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
   <link href="<?php echo base_url(); ?>assets/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

   <!-- bootstrap-daterangepicker -->
   <link href="<?php echo base_url(); ?>assets/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
   <!-- bootstrap-datetimepicker -->
   <link href="<?php echo base_url(); ?>assets/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" rel="stylesheet">
   <!-- Ion.RangeSlider -->
   <link href="<?php echo base_url(); ?>assets/vendors/normalize-css/normalize.css" rel="stylesheet">
   <link href="<?php echo base_url(); ?>assets/vendors/ion.rangeSlider/css/ion.rangeSlider.css" rel="stylesheet">
   <link href="<?php echo base_url(); ?>assets/vendors/ion.rangeSlider/css/ion.rangeSlider.skinFlat.css" rel="stylesheet">
   <!-- Bootstrap Colorpicker -->
   <link href="<?php echo base_url(); ?>assets/vendors/mjolnic-bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css" rel="stylesheet">

   <link href="<?php echo base_url(); ?>assets/vendors/cropper/dist/cropper.min.css" rel="stylesheet">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">

   <script src="<?php echo base_url(); ?>assets/vendors/jquery/dist/jquery.min.js"></script>
   <!-- <script src="<?php echo base_url(); ?>assets/vendors/bootstrap/dist/js/bootstrap.min.js"></script> -->
   <!-- <script src="<?php echo base_url(); ?>assets/build/js/custom.min.js"></script> -->
   <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />


   <!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
   <!-- <script src="https://code.jquery.com/jquery-2.2.4.js"></script> -->



</head>

<body class="nav-md">
   <div class="container body" style="position: relative;">
      <div class="main_container">
         <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
               <div class="navbar nav_title" style="border: 0;">
                  <!-- <a href="#" class="site_title" style="padding-top: 10px"><center> KPSBU </center></a> -->
                  <a href="#" class="site_title"><img style="margin-top: 20px; height: 35px; width: 150px; margin-left: 25px" src="<?php echo base_url(); ?>assets/images/brandlogo.jpg" class="profile_pic"><span></span></a>
               </div>
               <div class="clearfix"></div>
               <!-- menu profile quick info -->
               <div class="profile clearfix">
                  <div class="profile_pic">
                     <img src="<?php echo base_url(); ?>assets/images/sapi.png" alt="..." class="img-circle profile_img">
                  </div>
                  <div class="profile_info">
                     <span>Welcome,</span>
                     <h2><?php echo ucwords($this->session->userdata('nama_lengkap')); ?></h2>
                  </div>
               </div>
               <!-- /menu profile quick info -->
               <br />
               <!-- sidebar menu -->
               <?php $this->load->view('sidebar');?>
               <!-- /sidebar menu -->
               <!-- /menu footer buttons -->
               <!-- /menu footer buttons -->
            </div>
         </div>
         <!-- top navigation -->
         <div class="top_nav">
            <div class="nav_menu">
               <nav>
                  <div class="nav toggle">
                     <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                  </div>
                  <ul class="nav navbar-nav navbar-right">
                     <li class="">
                        <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                           <img src="<?php echo base_url(); ?>assets/images/sapi.png" alt=""><?php echo ucwords($this->session->userdata('nama_lengkap')); ?>
                           <span class=" fa fa-angle-down"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-usermenu pull-right">
                           <!--  <li><a href="javascript:;"> Profile</a></li>
                                 <li>
                                   <a href="javascript:;">
                                     <span class="badge bg-red pull-right">50%</span>
                                     <span>Settings</span>
                                   </a>
                                 </li>
                                 <li><a href="javascript:;">Help</a></li>
                                 -->
                           <li><a href="<?php echo site_url(); ?>c_login/logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                        </ul>
                     </li>
                  </ul>
               </nav>
            </div>
         </div>
         <br /><br>
         <div class="right_col" role="main">
            <br>
            <?php echo $contents ?>
         </div>
      </div>
   </div>
   <!-- /page content -->
   <!--  <footer>
         <div class="pull-right">
          © 6703164107 - Zulfikri Fahrudin
         </div>
         <div class="clearfix"></div>
         </footer> -->
   </div>
   </div>

   <!-- js -->
   <!-- jQuery -->
   <!-- <script src="<?php echo base_url(); ?>assets/vendors/jquery/dist/jquery.min.js"></script> -->
   <!-- Bootstrap -->
   <script src="<?php echo base_url(); ?>assets/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
   <!-- FastClick -->
   <script src="<?php echo base_url(); ?>assets/vendors/fastclick/lib/fastclick.js"></script>
   <!-- NProgress -->
   <script src="<?php echo base_url(); ?>assets/vendors/nprogress/nprogress.js"></script>
   <!-- iCheck -->
   <script src="<?php echo base_url(); ?>assets/vendors/iCheck/icheck.min.js"></script>
   <!-- Chart.js -->
   <script src="<?php echo base_url(); ?>assets/vendors/Chart.js/dist/Chart.min.js"></script>
   <!-- gauge.js -->
   <script src="<?php echo base_url(); ?>assets/vendors/gauge.js/dist/gauge.min.js"></script>
   <!-- bootstrap-progressbar -->
   <script src="<?php echo base_url(); ?>assets/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
   <!-- Skycons -->
   <script src="<?php echo base_url(); ?>assets/vendors/skycons/skycons.js"></script>
   <!-- Flot -->
   <script src="<?php echo base_url(); ?>assets/vendors/Flot/jquery.flot.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/Flot/jquery.flot.pie.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/Flot/jquery.flot.time.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/Flot/jquery.flot.stack.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/Flot/jquery.flot.resize.js"></script>
   <!-- Flot plugins -->
   <script src="<?php echo base_url(); ?>assets/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/flot.curvedlines/curvedLines.js"></script>
   <!-- DateJS -->
   <script src="<?php echo base_url(); ?>assets/vendors/DateJS/build/date.js"></script>
   <!-- JQVMap -->
   <script src="<?php echo base_url(); ?>assets/vendors/jqvmap/dist/jquery.vmap.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
   <!-- bootstrap-daterangepicker -->
   <script src="<?php echo base_url(); ?>assets/vendors/moment/min/moment.min.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
   <!-- bootstrap-datetimepicker -->
   <script src="<?php echo base_url(); ?>assets/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
   <!-- Datatables -->
   <script src="<?php echo base_url(); ?>assets/vendors/datatables-net/js/jquery.dataTables.min.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/jszip/dist/jszip.min.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/pdfmake/build/pdfmake.min.js"></script>
   <script src="<?php echo base_url(); ?>assets/vendors/pdfmake/build/vfs_fonts.js"></script>
   <!-- Custom Theme Scripts -->
   <script src="<?php echo base_url(); ?>assets/build/js/custom.min.js"></script>
   <script src="<?= base_url('assets/format.js')?>"></script>
   
   <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
   <script>
      $(function() {
         $('#myDatepicker2').datetimepicker({
            // format: 'DD.MM.YYYY'
            format: 'YYYY-MM-DD'
         });
      })
   </script>
</body>

</html>