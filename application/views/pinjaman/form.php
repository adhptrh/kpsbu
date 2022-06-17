<html>
	<head>
		<title>Master Data Pinjaman</title>
	</head>
	<!-- <center><h3><b>Master Data Produk</h3></b></center>
	<hr> -->
	<div class="x_panel">
 		<div class="x_title">
    	<h3 class="panel-title"><b>Form Pinjaman</b></h3>
  	</div>
  	 
  	<div class="x_content">
		<body>
			<form method = "POST" action = "<?php echo site_url('c_transaksi/simpan_pinjaman');?>">

				<div class="form-group">
				  <label>Kode Pinjaman</label>
				  <input type = "text" name = "kode_simpanan" class = "form-control" value="<?php echo $id?>" readonly>
				</div>

				<div class="form-group">
				  <label>Anggota</label>
				  <select name="peternak" class="form-control" id="anggota" required="">
				  	<option value="" >Pilih Anggota</option>
				  	<?php foreach ($anggota as $data) { ?>
				  		<option value="<?= $data->no_peternak?>"><?= $data->nama_peternak?></option>
				  	<?php }?>
				  </select>
				  <?php echo form_error('simpanan'); ?>
				</div>

				<div class="form-group">
				  <label>Nominal pinjaman</label>
				  <input type = "number" min="0" name ="biaya" class = "form-control" id="biaya" placeholder="Isi pinjaman" required="" autocomplete="off">
				  <?php echo form_error('biaya'); ?>
				</div>

				<div id="info"></div>
				
				<hr>
				<a href = "<?php echo site_url()."/c_transaksi/pinjaman"?>" type="button" class="btn btn-default">Kembali</a>
				<button type="submit" id="btn-simpan" class="btn btn-default btn-primary">Simpan</button>
			</form>
		</body>
	</div>
</html>

<script type="text/javascript">
	$("#biaya").prop("readonly", true);
	$("#btn-simpan").prop("disabled", true);

	$("#anggota").change(function () {

		var id_peternak = $("#anggota").val()
		var info = '';

		$.ajax({
            url : "<?php echo site_url('c_transaksi/syarat');?>",
            method : "POST",
            data : {id_peternak: id_peternak},
            async : true,
            dataType : 'json',
            success: function(data){
            	$("#info").hide();
				// data real 
				// var total = data.total
				// var pinjaman = 0
				
				// console.log(data)
				if (data) {
					// alert('ada datanya')
					var pinjaman = data.sisa_pinjaman
					// var pinjaman = 100
					console.log(pinjaman)
					// var pinjaman = 0
					// hardcode
					// var total = 16
					var total = data.total
	
					var total_bayar = data.total_bayar
					var min_pinjam = (3 * 0.75 * total_bayar)
					$("input[name='biaya']").keyup(function() {
						console.log($(this).val());
					})
	
					$("input[name='biaya']").focusout(function(){
						if($(this).val() > min_pinjam) {
							$("#info").show();
							var info = 'Pinjaman tidak bisa lebih dari <strong> ' + min_pinjam + '</strong>'
							$("#info").html(info);
							$("#btn-simpan").prop("disabled", true)
						} else {
							$("#info").hide(info);
							$("#btn-simpan").prop("disabled", false)
						}
					});
	
					// console.log()
					$("#btn-simpan").prop("disabled", true)
					// if (total >= 16 && pinjaman == null) {
					// 	// kalo bener
					// 	$("#info").hide();
					// 	// alert('done')
					// 	$('#biaya').prop('readonly', false)
					// 	$("#btn-simpan").prop("disabled", false)
					// } else if (total >= 16 && pinjaman != 0) {
					// 	// pembayaran lulus, tapi punya utang
					// 	$("#info").show();
					// 	var info = 'Mon maap, anda <strong>punya utang !</strong>'
					// 	$("#info").html(info);
	
					// 	$('#biaya').prop('readonly', true)
					// 	$("#btn-simpan").prop("disabled", true)
					// } else if (total < 16) {
					// 	$("#info").show();
					// 	var info = 'Mon maap, anda tidak memenuhi <strong>SYARAT !</strong>'
					// 	$("#info").html(info);
	
					// 	$('#biaya').prop('readonly', true)
					// 	$("#btn-simpan").prop("disabled", true)
					// }

					// nyobain
					if (pinjaman === null && total >= 16) {
						console.log('pinjaman null, total leih dari 16')
						// kalo bener
						$("#info").hide();
						// alert('done')
						$('#biaya').prop('readonly', false)
						$("#btn-simpan").prop("disabled", false)
					} else if (pinjaman != 0) {
						console.log('masih ada pinjaman')
						$("#info").show();
						var info = 'Maaf, anda <strong>masih mempunyai pinjaman !</strong>'
						$("#info").html(info);
	
						$('#biaya').prop('readonly', true)
						$("#btn-simpan").prop("disabled", true)
					} else if (pinjaman == 0) {
						console.log('pinjaman sudah 0')
						$('#biaya').prop('readonly', false)
						$("#btn-simpan").prop("disabled", false)
					} else if (total < 16) {
						console.log('total kurang dari 16')
						$("#info").show();
						var info = 'Mon maap, anda tidak memenuhi <strong>SYARAT !</strong>'
						$("#info").html(info);

						$('#biaya').prop('readonly', true)
						$("#btn-simpan").prop("disabled", true)
					}

				} else {
					// alert('data kosong')
					$("#info").show();
					var info = '<strong>Tidak ada data tersimpan.</strong>'
					$("#info").html(info);

					$('#biaya').prop('readonly', true)
					$("#btn-simpan").prop("disabled", true)	
				}
				
            }
        });
        return false;
	});
</script>