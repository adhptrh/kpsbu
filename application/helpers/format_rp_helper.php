<?php
function format_rp($a)
{
	if (!is_numeric($a)) return null;
	$jumlah_desimal = "0";
	$pemisah_desimal = ",";
	$pemisah_ribuan = ".";
	$angka = "Rp " . number_format($a, $jumlah_desimal, $pemisah_desimal, $pemisah_ribuan);
	return $angka;
}

function number($a)
{
	if (!is_numeric($a)) return null;
	$jumlah_desimal = "0";
	$pemisah_desimal = ",";
	$pemisah_ribuan = "";
	$angka = number_format($a, $jumlah_desimal, $pemisah_desimal, $pemisah_ribuan);
	return $angka;
}

function penyusutan($a)
{
	if (!is_numeric($a)) return null;
	$jumlah_desimal = "2";
	$pemisah_desimal = ",";
	$pemisah_ribuan = ".";
	$angka = "Rp." . number_format($a, $jumlah_desimal, $pemisah_desimal, $pemisah_ribuan);
	return $angka;
}

function rev($a)
{
	if (!is_numeric($a)) return null;
	$jumlah_desimal = "2";
	$pemisah_desimal = ",";
	$pemisah_ribuan = ".";
	$angka = number_format($a, $jumlah_desimal, $pemisah_desimal, $pemisah_ribuan);
	return $angka;
}

if (!function_exists('bulan')) {
	function bulan($bulan)
	{
		switch ($bulan) {
			case 'January':
				return "Januari";
				break;
			case 'February':
				return "Februari";
				break;
			case 'March':
				return "Maret";
				break;
			case 'April':
				return "April";
				break;
			case 'May':
				return "Mei";
				break;
			case "June":
				return "Juni";
				break;
			case 'July':
				return "Juli";
				break;
			case 'August':
				return "Agustus";
				break;
			case 'September':
				return "September";
				break;
			case 'October':
				return "Oktober";
				break;
			case 'November':
				return "November";
				break;
			case 'December':
				return "Desember";
				break;
		}
	}
}
