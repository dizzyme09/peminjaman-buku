<?php 
session_start();
if(!isset($_SESSION['login'])){
    header('location:../index.php');
    exit;
}
require 'functionsPegawai.php';

$id_member = $_GET['id_member'];

if(hapusMember($id_member) > 0){
    echo "
    <script>
        alert('data berhasil dihapus');
        document.location.href = 'lihatAkun.php';
    </script>";
}else{
    echo "
    <script>
        alert('data gagal dihapus');
        document.location.href = 'lihatAkun.php';
    </script>";
}
?>