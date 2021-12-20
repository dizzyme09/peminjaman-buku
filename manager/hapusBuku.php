<?php 
session_start();
if(!isset($_SESSION['login'])){
    header('location:../index.php');
    exit;
}
require 'functionsManager.php';

$id_buku = $_GET['id_buku'];

if(hapusBuku($id_buku) > 0){
    echo "
    <script>
        alert('data berhasil dihapus');
        document.location.href = 'lihatBuku.php';
    </script>";
}else{
    echo "
    <script>
        alert('data gagal dihapus');
        document.location.href = 'lihatBuku.php';
    </script>";
}
?>