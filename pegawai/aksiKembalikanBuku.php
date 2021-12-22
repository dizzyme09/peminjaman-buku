<?php
session_start();
if(!isset($_SESSION['login'])){
    header('location:../index.php');
    exit;
}
require 'functionsPegawai.php';

$id_peminjaman = (int)$_GET['id_peminjaman'];
$pengembalian_buku = "UPDATE tb_peminjaman SET tgl_kembali=NOW() WHERE id_peminjaman=$id_peminjaman";
mysqli_query($conn, $pengembalian_buku);
echo " 
    <script>
        alert('buku berhasil dikembalikan');
        document.location.href = 'index.php';
    </script>";
?>