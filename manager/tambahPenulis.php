<?php 
session_start();
if(!isset($_SESSION['login'])){
    header('location:../index.php');
    exit;
}
require 'functionsManager.php';

$buku = query("SELECT * FROM tb_buku");

if( isset($_POST['btnSimpan'])){
    if(tambahPenulis($_POST) > 0){
        echo "
            <script>
                alert('data penulis ditambahkan');
                document.location.href = 'tambahBuku.php';
            </script>";
    }else{
        echo "
            <script>
                alert('data penulis gagal ditambahkan');
                document.location.href = 'tambahBuku.php';
            </script>";
    }
}
?>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://unpkg.com/react@16/umd/react.production.min.js"></script>
        <script src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"></script>
        <script src="https://unpkg.com/babel-standalone@6.15.0/babel.min.js"></script>

        <link rel="stylesheet" href="boots/css/bootstrap.css">
        <link rel="stylesheet" href="content/tambahPenulis.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

    </head>
    <body>
        <div id="header">
            
        </div>
        <div id="article">
            <div id="head">
                <div id="judulHead"></div>
                <div id="exit"></div>
            </div>
            <div id="dataBuku">
                <form id="formPenulis" name="formPenulis" action="" method="POST">
                    <div id="lbl">
                        <div id="lblNama"></div>
                        <div id="lblJK"></div>
                        <div id="lblTL"></div>
                    </div>
                    <div id="txt">
                        <input id="txtNama" name="nama" type="text" autocomplete="off" required>
                        <select id="txtJK" name="jenis_kelamin" autocomplete="off" required>
                            <option value="" selected disabled hidden>Pilih Jenis Kelamin</option>
                            <option value="Laki-Laki">Laki-Laki</option>
                            <option value="Perempuan">Perempuan</option>
                        </select>
                        <input id="txtTL" name="tanggal_lahir" type="date" autocomplete="off">
                    </div>
                    <button id="btnSimpan" name="btnSimpan" type="submit" value="Simpan">Simpan</button>
                </form>
            </div>
        </div>
        <div id="footer">

        </div>


        <script type="text/babel">
            let judulHead = (
                <p>Tambah Penulis</p>
            );
            ReactDOM.render(judulHead, document.getElementById("judulHead"));
        </script>
        <script type="text/babel">
            let lblNama = (
                <p>Nama</p>
            );
            ReactDOM.render(lblNama, document.getElementById("lblNama"));
        </script>
        <script type="text/babel">
            let lblJK = (
                <p>Jenis Kelamin</p>
            );
            ReactDOM.render(lblJK, document.getElementById("lblJK"));
        </script>
        <script type="text/babel">
            let lblTL = (
                <p>Tanggal Lahir</p>
            );
            ReactDOM.render(lblTL, document.getElementById("lblTL"));
        </script>
        <script type="text/babel">
            let lblIdBuku = (
                <p>ID Buku</p>
            );
            ReactDOM.render(lblIdBuku, document.getElementById("lblIdBuku"));
        </script>
        <script type="text/babel">
            let exit = (
                <a href="tambahBuku.php">
                    <button className="exit">
                        Back
                    </button>
                </a>
            )
            ReactDOM.render(exit,document.getElementById("exit"));
        </script>
        

        <script src="boots/js/jquery.js"></script> 
        <script src="boots/js/popper.js"></script> 
        <script src="boots/js/bootstrap.js"></script>
    </body>
</html>