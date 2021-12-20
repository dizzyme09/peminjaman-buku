<?php
session_start();
if(!isset($_SESSION['login'])){
    header('location:.../index.php');
    exit;
}
require 'functionsPegawai.php';

$member = query("SELECT * FROM tb_peminjam WHERE status_data = 'Aktif'");

if( isset($_POST['search'])){
    $member = cari($_POST['keyword']);
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
        <link rel="stylesheet" href="content/lihatAkun.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

    </head>
    <body>
        <div id="header">
            
        </div>
        <div id="article">
            <div id="head">
                <div id="cariPegawai">
                    <div id="cari"></div>
                    <form>
                        <input id="search" type="search" name="keyword" autocomplete="off">
                        <img id="imgSearch" src="../img/SearchIcon.png">
                    </form>
                </div>
                <div id="judulHead"></div>
                <div id="exit"></div>
            </div>
            <div id="daftarAkun">
                <div id="judulDaftar"></div>
                <div id="tableAkun" style="overflow-x:auto;">
                    <table>
                        <tr id="row0">
                            <th>No</th>
                            <th>Aksi</th>
                            <th>NIK</th>
                            <th>Id Member</th>
                            <th>Nama</th>
                            <th>Tempat Lahir</th>
                            <th>Tanggal Lahir</th>
                            <th>Nomor Telepon</th>
                        </tr>
                        <?php $i= 1; ?>
                        <?php foreach( $member as $row ) :?>
                        <tr>
                            <td><?= $i ?></td>
                            <td>
                                <a href="#">
                                    <button class="update">Update</button>
                                </a></br>
                                <a href="hapusAkun.php?id_member=<?= $row['id_member']; ?>" onclick="return confirm('hapus data?')";>
                                    <button class="hapus">Hapus</button>
                                </a>
                            </td>
                            <td><?php echo $row['NIK'] ?></td>
                            <td><?php echo "MEM-", $row['id_member'] ?></td>
                            <td><?php echo $row['nama']?></td>
                            <td><?php echo $row['tempat_lahir']?></td>
                            <td><?php echo $row['tanggal_lahir']?></td>
                            <td><?php echo $row['no_telp'] ?></td>
                        </tr>
                        <?php $i++; ?>
                        <?php endforeach; ?>
                    </table>    
                </div>
                
            </div>
        </div>
        <div id="footer">

        </div>


        <script type="text/babel">
            let cari = (
                <p>Cari :</p>
            );
            ReactDOM.render(cari, document.getElementById("cari"));
        </script>
        <script type="text/babel">
            let judulHead = (
                <p>LIHAT AKUN</p>
            );
            ReactDOM.render(judulHead, document.getElementById("judulHead"));
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
            let judulDaftar = (
                <p>DAFTAR MEMBER</p>
            );
            ReactDOM.render(judulDaftar, document.getElementById("judulDaftar"));
        </script>

        <script src="boots/js/jquery.js"></script> 
        <script src="boots/js/popper.js"></script> 
        <script src="boots/js/bootstrap.js"></script>
    </body>
</html>