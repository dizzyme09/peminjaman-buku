<?php 
session_start();
if(!isset($_SESSION['login'])){
    header('location:../index.php');
    exit;
}
require 'functionsManager.php';

$penerbit = query("SELECT * FROM tb_penerbit");

if( isset($_POST['btnSimpan'])){
    if(tambahBuku($_POST) > 0){
        echo "
            <script>
                alert('data buku ditambahkan');
                document.location.href = 'index.php';
            </script>";
    }else{
        echo "
            <script>
                alert('data buku gagal ditambahkan');
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
        <link rel="stylesheet" href="content/tambahBuku.css">

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
                <form id="formBuku" name="formBuku" action="" method="POST">
                    <div id="judulInfo" style="font-weight: 500; text-align: center; font-size: 20px; text-decoration: underline;"></div>
                    <div id="lbl">
                        <div id="lblJudul"></div>
                        <div id="lblGenre"></div>
                        <div id="lblIdPenerbit"></div>
                        <div id="lblTahunTerbit"></div>
                        <div id="lblJumlahBuku"></div>
                    </div>
                    <div id="txt">
                        <input id="txtJudul" name="judul_buku" type="text" autocomplete="off" required>
                        <select id="txtGenre" name="genre" autocomplete="off" required>
                            <option value="" selected disabled hidden>Pilih Genre Buku</option>
                            <option value="Fiksi">Fiksi</option>
                            <option value="Non Fiksi">Non Fiksi</option>
                        </select>
                        <select id="txtIdPenerbit" name="id_penerbit" autocomplete="off" required>
                            <option value="" selected disabled hidden>Pilih ID Penerbit</option>
                            <?php foreach($penerbit as $pilihan): ?>
                            <option value="<?= $pilihan['id_penerbit']; ?>"><?php echo $pilihan['nama_penerbit']," | PNB-", $pilihan['id_penerbit']; ?></option>
                            <?php endforeach ?>
                        </select>
                        <input id="txtTahunTerbit" name="tahun_terbit" type="number" autocomplete="off" min="0" required>
                        <input id="txtJumlahBuku" name="jumlah" type="number" autocomplete="off" min="0" required>
                    </div>
                    <button id="btnSimpan" name="btnSimpan" type="submit" value="Simpan">Simpan</button>
                </form>
                <div id="btnTPenulis"></div>
                <div id="btnTPenerbit"></div>
                <center><div id="btnTKepengarangan"></div></center>
            </div>
        </div>
        <div id="footer">

        </div>


        <script type="text/babel">
            let judulHead = (
                <p>Tambah Buku</p>
            );
            ReactDOM.render(judulHead, document.getElementById("judulHead"));
        </script>
        <script type="text/babel">
            let judulInfo = (
                <p>Informasi Buku</p>
            );
            ReactDOM.render(judulInfo, document.getElementById("judulInfo"));
        </script>
        <script type="text/babel">
            let lblJudul = (
                <p>Judul</p>
            );
            ReactDOM.render(lblJudul, document.getElementById("lblJudul"));
        </script>
        <script type="text/babel">
            let lblGenre = (
                <p>Genre</p>
            );
            ReactDOM.render(lblGenre, document.getElementById("lblGenre"));
        </script>
        <script type="text/babel">
            let lblTahunTerbit = (
                <p>Tahun Terbit</p>
            );
            ReactDOM.render(lblTahunTerbit, document.getElementById("lblTahunTerbit"));
        </script>
        <script type="text/babel">
            let lblJumlahBuku = (
                <p>Jumlah Buku</p>
            );
            ReactDOM.render(lblJumlahBuku, document.getElementById("lblJumlahBuku"));
        </script>
        <script type="text/babel">
            let lblIdPenerbit = (
                <p>ID Penerbit</p>
            );
            ReactDOM.render(lblIdPenerbit, document.getElementById("lblIdPenerbit"));
        </script>
        <script type="text/babel">
            let exit = (
                <a href="index.php">
                    <button className="exit">
                        Back
                    </button>
                </a>
            )
            ReactDOM.render(exit,document.getElementById("exit"));
        </script>
        <script type="text/babel">
            let TPenulis = (
                <a href="tambahPenulis.php">
                    <button className="TPenulis">
                        Tambah Penulis
                    </button>
                </a>
            )
            let TKepengarangan = (
                <a href="tambahKepengarangan.php">
                    <button className="TKepengarangan">
                        Tambah Kepengarangan
                    </button>
                </a>
            )
            let TPenerbit = (
                <a href="tambahPenerbit.php">
                    <button className="TPenerbit">
                        Tambah Penerbit
                    </button>
                </a>
            )
            ReactDOM.render(TPenulis,document.getElementById("btnTPenulis"));
            ReactDOM.render(TKepengarangan,document.getElementById("btnTKepengarangan"));
            ReactDOM.render(TPenerbit,document.getElementById("btnTPenerbit"));
        </script>
        

        <script src="boots/js/jquery.js"></script> 
        <script src="boots/js/popper.js"></script> 
        <script src="boots/js/bootstrap.js"></script>
    </body>
</html>