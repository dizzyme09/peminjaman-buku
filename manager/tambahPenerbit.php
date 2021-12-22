<?php 
session_start();
if(!isset($_SESSION['login'])){
    header('location:../index.php');
    exit;
}
require 'functionsManager.php';

$penerbit = query("SELECT * FROM tb_penerbit");

if( isset($_POST['btnSimpan'])){
    if(tambahPenerbit($_POST) > 0){
        echo "
            <script>
                alert('data penerbit ditambahkan');
                document.location.href = 'tambahBuku.php';
            </script>";
    }else{
        echo "
            <script>
                alert('data penerbit gagal ditambahkan');
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
        <link rel="stylesheet" href="content/tambahPenerbit.css">

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
                <form id="formPenerbit" name="formPenerbit" action="" method="POST">
                    <div id="lbl">
                        <div id="lblNama"></div>
                    </div>
                    <div id="txt">
                        <input id="txtNama" name="nama_penerbit" type="text" autocomplete="off" required>
                    </div>
                    <button id="btnSimpan" name="btnSimpan" type="submit" value="Simpan">Simpan</button>
                </form>
            </div>
        </div>
        <div id="footer">

        </div>


        <script type="text/babel">
            let judulHead = (
                <p>Tambah Penerbit</p>
            );
            ReactDOM.render(judulHead, document.getElementById("judulHead"));
        </script>
        <script type="text/babel">
            let lblNama = (
                <p>Nama Penerbit</p>
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