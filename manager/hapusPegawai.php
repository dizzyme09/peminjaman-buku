<?php 
session_start();
if(!isset($_SESSION['login'])){
    header('location:../index.php');
    exit;
}
require 'functionsManager.php';

$id_pegawai = $_GET['id_pegawai'];

if(hapusPegawai($id_pegawai) > 0){
    echo "
    <script>
        alert('data berhasil dihapus');
        document.location.href = 'lihatPegawai.php';
    </script>";
}else{
    echo "
    <script>
        alert('data gagal dihapus');
        document.location.href = 'lihatPegawai.php';
    </script>";
}
?>