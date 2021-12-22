<?php
session_start();
if(!isset($_SESSION['login'])){
    header('location:../index.php');
    exit;
}
require 'functionsManager.php';

$query = "SELECT tb_buku.id_buku, tb_buku.judul_buku, tb_penulis.nama, tb_buku.genre, tb_penerbit.nama_penerbit as penerbit, tb_buku.tahun_terbit, tb_buku.jumlah, tb_buku.dibuat, tb_buku.diubah, tb_buku.dihapus, tb_buku.status_data from tb_buku
join tb_kepengarangan on (tb_buku.id_buku = tb_kepengarangan.id_buku)
join tb_penulis on (tb_penulis.id_penulis = tb_kepengarangan.id_penulis)
join tb_penerbit on (tb_buku.id_penerbit = tb_penerbit.id_penerbit)
WHERE tb_buku.status_data = 'Aktif'
ORDER BY id_buku ASC";
$buku = query($query);

if( isset($_POST['cari'])){
    $buku = cariBuku($_POST['keyword']);
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
        <link rel="stylesheet" href="content/lihatBuku.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

    </head>
    <body>
        <div id="header">
            
        </div>
        <div id="article">
            <div id="head">
                <div id="cariPegawai">
                    <form action="" method="POST">
                        <div id="cari"></div>
                        <input id="search" type="search" name="keyword" autocomplete="off">
                        <input id="btnSubmitAkun" type="submit" name="cari" value="Cari">
                    </form>
                </div>
                <div id="judulHead"></div>
                <div id="exit"></div>
            </div>
            <!-- <div id="filterBuku">
                <img id="imgFilter" src="img/filter.png">
                <div id="filter"></div>
                <div id="fiksi"></div>
                <div id="nonFiksi"></div>
                <div id="penerbit"></div>
            </div> -->
            <div id="daftarBuku">
                <div id="judulDaftar"></div>
                <div id="tableBuku" style="overflow-x:auto;">
                    <table>
                        <tr>
                            <th>No</th>
                            <th>Aksi</th>
                            <th>ID Buku</th>
                            <th>Judul Buku</th>
                            <th>Penulis</th>
                            <th>Genre</th>
                            <th>Penerbit</th>
                            <th>Tahun Terbit</th>
                            <th>Jumlah</th>
                        </tr>
                        <?php $i= 1; ?>
                        <?php foreach( $buku as $row ) :?>
                        <tr>
                            <td><?= $i ?></td>
                            <td>
                                <a href="updateBuku.php?id_buku=<?= $row['id_buku'];?>">
                                    <button class="update">Update</button>
                                </a></br>
                                <a href="hapusBuku.php?id_buku=<?= $row['id_buku']; ?>" onclick="return confirm('hapus data?')";>
                                    <button class="hapus">Hapus</button>
                                </a>
                            </td>
                            <td><?php echo "BK-", $row['id_buku'] ?></td>
                            <td><?php echo $row['judul_buku'] ?></td>
                            <td><?php echo $row['nama']?></td>
                            <td><?php echo $row['genre']?></td>
                            <td><?php echo $row['penerbit']?></td>
                            <td><?php echo $row['tahun_terbit'] ?></td>
                            <td><?php echo $row['jumlah'] ?></td>
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
                <p>LIHAT BUKU</p>
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
            let filter = (
                <p>Filter :</p>
            );
            ReactDOM.render(filter, document.getElementById("filter"));
        </script>
        <script type="text/babel">
            let fiksi = (
                <a>
                    <button className="Fiksi">
                        Fiksi
                    </button>
                </a>
            );
            let nonFiksi = (
                <a>
                    <button className="nonFiksi">
                        Non Fiksi
                    </button>
                </a>
            );
            let penerbit = (
                <a>
                    <button className="penerbit">
                        Penerbit Terpopuler
                    </button>
                </a>
            );
            ReactDOM.render(fiksi,document.getElementById("fiksi"));
            ReactDOM.render(nonFiksi,document.getElementById("nonFiksi"));
            ReactDOM.render(penerbit,document.getElementById("penerbit"));
        </script>
        <script type="text/babel">
            let judulDaftar = (
                <p>DAFTAR BUKU</p>
            );
            ReactDOM.render(judulDaftar, document.getElementById("judulDaftar"));
        </script>

        <script src="boots/js/jquery.js"></script> 
        <script src="boots/js/popper.js"></script> 
        <script src="boots/js/bootstrap.js"></script>
    </body>
</html>