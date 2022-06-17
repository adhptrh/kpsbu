<html>
	<head>
		<title>Pembayaran Susu</title>
	</head>
	
	<div class="x_panel">
 		<div class="x_title">
    		<h3 class="panel-title"><b>Form Pembayaran Susu</b></h3>
  		</div>
  	 	
  	 	<div class="x_content">
  	 	
			<body>
				<form method = "POST" action = "<?php echo site_url('c_transaksi/bayar_susu');?>">
					
					<input type="hidden" name="kode_pembayaran" value="<?= $kode_pembayaran ?>">
					<!-- <input type="hidden" name="is_paid" id="is_paid"> -->

					<div class="form-group row">
						<label class="col-sm-1">Anggota</label>	
						<div class="col-sm-3">
					  		<select name="id_peternak" id="id_peternak" class="form-control">
					  			<option value="">Pilih anggota</option>
					  			<?php
					  			foreach ($anggota as $data) { ?>
					  			<option value="<?= $data['no_peternak']?>"><?= $data['nama_peternak']?></option>
					  			<?php } ?>
					  		</select>
						</div>
					</div>

					<div class="form-group row" id="jml_susu">
						<label class="col-sm-1">Jumlah liter susu</label>	
						<div class="col-sm-1">
					  		<input type="text" name="jumlah_liter" id="susu" class="form-control" readonly="">
						</div>
						<div style="color: red">*jumlah selama 2 minggu terakhir</div>
					</div>

					<div class="form-group row" id="simpanan_manasuka">
						<label class="col-sm-1">Simpanan Masuka</label>	
						<div class="col-sm-3">
							<input type="text" name="manasuka" class="form-control" value="<?= $manasuka ?>" id="manasuka" readonly>
						</div>
					</div>

					<div class="form-group row" id="jumlah_pembayaran">
						<label class="col-sm-1">Simpanan Wajib</label>	
						<div class="col-sm-3">
					  		<input type="text" name="jumlah_pembayaran" id="hasil_pembayaran" class="form-control" readonly="">
						<div id="info" style="color: red"><strong>jumlah pembayaran didapatkan dari (Rp. 20 x Jumlah liter susu)</strong></div>
						</div>
					</div>

					<input type="hidden" name="jumlah_harga_susu" id="tot_sus" class="form-control" readonly="">

					<div class="form-group row" id="kalo_ngutang">
						<label class="col-sm-1">Pinjaman Anggota</label>	
						<div class="col-sm-3">
							<input type="text" name="pinjaman" class="form-control" id="pinjaman" readonly>
						</div>

						<input type="text" id="sp" name="sp">
						<input type="text" id="sisa_pinjaman" name="sisa_pinjaman">

						<div id="byr_tunai">
							<label class="col-sm-1">Bayar Tunai</label>	
							<div class="col-sm-3">
								<input type="text" name="bayar_tunai" class="form-control" id="piutang" readonly="">
							</div>
						</div>
					</div>

					<div class="form-group row" id="total_bayar">
						<label class="col-sm-1">Total bayar</label>	
						<div class="col-sm-3">
					  		<input type="text" name="total_trans_susu" id="total_trans_susu" class="form-control" readonly="">
						</div>
					</div>

					<div id="notif"></div>

					<hr>
					<a href="<?= base_url('c_transaksi/pembayaran_susu')?>" style="background-color: #e5ede4 !important" class="btn btn-secondary">Kembali</a>
					<input type="submit" name="" value="Bayar" class="btn btn-success" id="btn-simpan">
				</form>
			</body>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function () {
			$("#jml_susu").hide();
			$("#simpanan_manasuka").hide();
			$("#jumlah_pembayaran").hide();
			$("#total_bayar").hide();
			$("#btn-simpan").hide();

			$("#kalo_ngutang").hide();

			// coba ulang 
			$("#id_peternak").change(function() {
				var id_peternak = $("#id_peternak").val()
				var notif = '';

				$.ajax({
					url : "<?php echo site_url('c_transaksi/coba');?>",
	                method : "POST",
	                data : {id_peternak: id_peternak},
	                async : true,
	                dataType : 'json',
	                success: function(data){
						console.log(data)
	                	$("#jml_susu").show();
						$("#simpanan_manasuka").show();
						$("#jumlah_pembayaran").show();
						$("#total_bayar").show();
						$("#kalo_ngutang").hide();
						$("#btn-simpan").show();

						$("#notif").hide();

                        if (data == null ) {
							$("#susu").val(0);
							$("#manasuka").val(0);
							$("#hasil_pembayaran").val(0);
							$("#total_trans_susu").val(0);
							$("#tot_sus").val(0);
							$("#sisa_pinjaman").val(0)
							$("#pinjaman").val(0);
							$("#piutang").val(0);

							$("#btn-simpan").prop("disabled", true);

							$("#notif").show();
							var notif = '<strong>Belum melakukan pembelian</strong>'
							$("#notif").html(notif)
                        } else {
                        	var total = data.total_jumlah;
	                        var manasuka = $("#manasuka").val() ? 10000 : 0 ;

	                        var simpanan_wajib = ( 20 * total ) ;
	                        var total_trans_susu =  data.total_trans_susu;

	                        var rumus = total_trans_susu - simpanan_wajib - manasuka
	                        // var rumus = 500000

	                        var pinjaman = data.pinjaman
	                        var pinjaman_1 = data.pinjaman/5

							var sisa_pinjaman = data.sisa_pinjaman

							// var cek_pinjaman = 

	                        if (pinjaman_1 <  rumus) {
	                        	var kurang_bayar = rumus - pinjaman_1

	                        } else if (pinjaman_1 > rumus) {
	                        	var kurang_bayar = pinjaman_1 - rumus
	                        }

	                        var kurang_bayar = pinjaman_1 - rumus

	                        var total_bayar_lebih_besar = rumus - pinjaman_1

	                        // js hari
	                        var today = new Date();
		     				var dd = today.getDate();
							var mm = today.getMonth()+1; 
							var yyyy = today.getFullYear();
							if(dd<10) 
							{
							    dd='0'+dd;
							} 

							if(mm<10) 
							{
							    mm='0'+mm;
							}

							// main disini tgl nya
							var hari_ini = yyyy+'-'+mm+'-'+dd;
							
							$("#notif").hide();

							// ubah hardcode disini 
							// var hari_ini = '2021-07-15'

                        	if (total == null) {
								$("#susu").val(0);
								$("#manasuka").val(0);
								$("#hasil_pembayaran").val(0);
								$("#total_trans_susu").val(0);
								$("#tot_sus").val(0);
								$("#sisa_pinjaman").val(0)
								$("#pinjaman").val(0);
								$("#piutang").val(0);

								$("#btn-simpan").prop("disabled", true);

								$("#notif").show();
								var notif = '<strong>Belum melakukan pembelian</strong>'
								$("#notif").html(notif)

	                        } else {
								// var rumus = 500000
	                        	$("#susu").val(total);
								$("#manasuka").val(manasuka);
								$("#hasil_pembayaran").val(simpanan_wajib);
								$("#total_trans_susu").val(rumus);
								$("#tot_sus").val(total_trans_susu);
								
								if (!sisa_pinjaman) {
									$("#kalo_ngutang").hide();
									$("#pinjaman").val(0);
									$("#piutang").val(0);
								} else if (pinjaman != 0 && sisa_pinjaman != 0) {
									$("#kalo_ngutang").show();
									$("#sp").val(sisa_pinjaman)
									$("#sisa_pinjaman").val(sisa_pinjaman - pinjaman_1)
									$("#pinjaman").val(pinjaman_1);
									
									console.log(rumus)

									if (rumus > pinjaman_1) {
										// alert('lebih')
			                        	$("#byr_tunai").hide();
										// kalo total bayar > pinjaman
										$("#total_trans_susu").val(rumus - pinjaman_1);
									} else if (rumus < pinjaman_1) {
										// $("#btn-simpan").prop("disabled", true)
										// $("#total_trans_susu").val(rumus);
										// alert('kurang')
			                        	$("#byr_tunai").show();
										$("#piutang").val(kurang_bayar);
									}
								} else {
									$("#kalo_ngutang").hide();
									$("#pinjaman").val(0);
									$("#piutang").val(0);
								}
								
								var next_trans = data.nextPayment
								if (hari_ini == next_trans) {
									// alert('hari nya udah sama')
									$("#btn-simpan").prop("disabled", false)

								} else {
									// alert("hari nya belum sama")
									$("#btn-simpan").prop("disabled", true)
								}
								// $("#btn-simpan").prop("disabled", false);

	                        }
                        }
	                	// console.log(data)
	                }
				})
			})
		});
	</script>