<?php
session_start();
if(!isset($_SESSION['login'])){
    header('location:../index.php');
    exit;
}
require 'functionsPegawai.php';

$id_member = (int)$_GET['id_member'];
$query = "SELECT tb_peminjaman.id_member, tb_peminjam.nama, tb_buku.judul_buku, tb_peminjaman.status_peminjaman, tb_peminjaman.keterangan, tb_peminjaman.tgl_pinjam, tb_peminjaman.tgl_kembali FROM tb_peminjaman
JOIN tb_buku on (tb_peminjaman.id_buku = tb_buku.id_buku)
JOIN tb_peminjam on (tb_peminjaman.id_member = tb_peminjam.id_member)
WHERE tb_peminjam.id_member = $id_member
ORDER BY id_peminjaman ASC";
$member = query($query);
?>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://unpkg.com/react@16/umd/react.production.min.js"></script>
        <script src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"></script>
        <script src="https://unpkg.com/babel-standalone@6.15.0/babel.min.js"></script>

        <link rel="stylesheet" href="boots/css/bootstrap.css">
        <link rel="stylesheet" href="content/historiPeminjam.css">

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
            <div id="daftarAkun">
                <div id="judulDaftar"></div>
                <div id="tableAkun" style="overflow-x:auto;">
                    <table>
                        <tr id="row0">
                            <th>No</th>
                            <th>ID Member</th>
                            <th>Nama</th>
                            <th>Judul Buku</th>
                            <th>Status Peminjaman</th>
                            <th>Keterangan</th>
                            <th>Tanggal Pinjam</th>
                            <th>Tanggal Kembali</th>
                        </tr>
                        <?php $i= 1; ?>
                        <?php foreach( $member as $row ) :?>
                        <tr>
                            <td><?= $i ?></td>
                            <td><?php echo "MEM-", $row['id_member'] ?></td>
                            <td><?php echo $row['nama']?></td>
                            <td><?php echo $row['judul_buku']?></td>
                            <td><?php echo $row['status_peminjaman']?></td>
                            <td><?php echo $row['keterangan'] ?></td>
                            <td><?php echo $row['tgl_pinjam'] ?></td>
                            <td><?php echo $row['tgl_kembali'] ?></td>
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
                <p>LIHAT HISTORI PEMINJAM</p>
            );
            ReactDOM.render(judulHead, document.getElementById("judulHead"));
        </script>
        <script type="text/babel">
            let exit = (
                <a href="pinjamBuku.php">
                    <button className="exit">
                        Back
                    </button>
                </a>
            )
            ReactDOM.render(exit,document.getElementById("exit"));
        </script>
        <script type="text/babel">
            let judulDaftar = (
                <p>DAFTAR PEMINJAMAN</p>
            );
            ReactDOM.render(judulDaftar, document.getElementById("judulDaftar"));
        </script>

        <script src="boots/js/jquery.js"></script> 
        <script src="boots/js/popper.js"></script> 
        <script src="boots/js/bootstrap.js"></script>
    </body>
</html>