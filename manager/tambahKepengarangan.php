<?php 
session_start();
if(!isset($_SESSION['login'])){
    header('location:../index.php');
    exit;
}
require 'functionsManager.php';

$buku = query("SELECT * FROM tb_buku");
$penulis = query("SELECT * FROM tb_penulis");

if( isset($_POST['btnSimpan'])){
    if(tambahKepengarangan($_POST) > 0){
        echo "
            <script>
                alert('data kepengarangan ditambahkan');
                document.location.href = 'index.php';
            </script>";
    }else{
        echo "
            <script>
                alert('data kepengarangan gagal ditambahkan');
                document.location.href = 'index.php';
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
        <link rel="stylesheet" href="content/tambahKepengarangan.css">

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
            <div id="dataKepengarangan">
                <form id="formKepengarangan" name="formPenulis" action="" method="POST">
                    <div id="lbl">
                        <div id="lblIdPenulis"></div>
                        <div id="lblIdBuku"></div>
                    </div>
                    <div id="txt">
                        <select id="txtIdPenulis" name="id_penulis" autocomplete="off" required>
                        <option value="" selected disabled hidden>Pilih ID Penulis</option>
                            <?php foreach($penulis as $pilihan): ?>
                            <option value="<?= $pilihan['id_penulis']; ?>"><?php echo $pilihan['nama']," | PS-", $pilihan['id_penulis']; ?></option>
                            <?php endforeach ?>
                        </select>
                        <select id="txtIdBuku" name="id_buku" autocomplete="off" required>
                            <option value="" selected disabled hidden>Pilih ID Buku</option>
                            <?php foreach($buku as $pilihan): ?>
                            <option value="<?= $pilihan['id_buku']; ?>"><?php echo $pilihan['judul_buku']," | BK-", $pilihan['id_buku']; ?></option>
                            <?php endforeach ?>
                        </select>
                    </div>
                    <button id="btnSimpan" name="btnSimpan" type="submit" value="Simpan">Simpan</button>
                </form>
            </div>
        </div>
        <div id="footer">

        </div>


        <script type="text/babel">
            let judulHead = (
                <p>Tambah Kepengarangan</p>
            );
            ReactDOM.render(judulHead, document.getElementById("judulHead"));
        </script>
        <script type="text/babel">
            let lblIdPenulis = (
                <p>ID Penulis</p>
            );
            ReactDOM.render(lblIdPenulis, document.getElementById("lblIdPenulis"));
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