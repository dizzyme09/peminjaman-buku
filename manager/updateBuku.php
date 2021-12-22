<?php
session_start();
if(!isset($_SESSION['login'])){
    header('location:../index.php');
    exit;
}
require 'functionsManager.php';

$id_buku = $_GET['id_buku'];


$buku = query("SELECT * FROM tb_buku WHERE id_buku=$id_buku")[0];
$id_penerbit_buku = $buku['id_penerbit'];
$penerbit_terpilih = query("SELECT nama_penerbit FROM tb_penerbit WHERE id_penerbit=$id_penerbit_buku")[0];
$penerbit = query("SELECT * FROM tb_penerbit");

if( isset($_POST['btnSimpan'])){
    if(ubahBuku($_POST) > 0){
        echo "
            <script>
                alert('data buku berhasil diubah');
                document.location.href = 'lihatBuku.php';
            </script>";
    }else{
        echo "
            <script>
                alert('data buku gagal diubah');
                document.location.href = 'lihatBuku.php';
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
        <link rel="stylesheet" href="content/updateBuku.css">

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
                <input type="hidden" name="id_buku" value="<?= $buku['id_buku']; ?>">
                    <div id="judulInfo" style="font-weight: 500; text-align: center; font-size: 20px; text-decoration: underline;"></div>
                    <div id="lbl">
                        <div id="lblJudul"></div>
                        <div id="lblGenre"></div>
                        <div id="lblIdPenerbit"></div>
                        <div id="lblTahunTerbit"></div>
                        <div id="lblJumlahBuku"></div>
                    </div>
                    <div id="txt">
                        <input id="txtJudul" name="judul_buku" type="text" autocomplete="off" value="<?= $buku['judul_buku']; ?>" required>
                        <select id="txtGenre" name="genre" autocomplete="off" required>
                        <option value="<?= $buku['genre']; ?>" selected><?php echo $buku['genre']; ?></option>
                            <?php if($buku['genre'] == 'Fiksi'){
                                echo '<option value="Non Fiksi">Non Fiksi</option>';
                            }else{
                                echo '<option value="Fiksi">Fiksi</option>';
                            } 
                            ?>
                        </select>
                        <select id="txtIdPenerbit" name="id_penerbit" autocomplete="off"  required>
                            <option value="<?= $buku['id_penerbit']; ?>" selected><?php echo $penerbit_terpilih['nama_penerbit']," | PNB-", $buku['id_penerbit']; ?></option>
                            <?php foreach($penerbit as $pilihan): ?>
                            <?php if($pilihan['id_penerbit'] == $buku['id_penerbit']) continue; ?>
                            <option value="<?= $pilihan['id_penerbit']; ?>"><?php echo $pilihan['nama_penerbit'] ," | PNB-", $pilihan['id_penerbit']; ?></option>
                            <?php endforeach ?>
                        </select>
                        <input id="txtTahunTerbit" name="tahun_terbit" type="number" autocomplete="off" value="<?= $buku['tahun_terbit']; ?>" min="0" required>
                        <input id="txtJumlahBuku" name="jumlah" type="number" autocomplete="off" value="<?= $buku['jumlah']; ?>" min="0" required>
                    </div>
                    <button id="btnSimpan" name="btnSimpan" type="submit" value="Simpan">Simpan</button>
                </form>
            </div>
        </div>
        <div id="footer">

        </div>


        <script type="text/babel">
            let judulHead = (
                <p>Update Data Buku</p>
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
                <a href="lihatBuku.php">
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