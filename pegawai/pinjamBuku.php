<?php
session_start();
if(!isset($_SESSION['login'])){
    header('location:.../index.php');
    exit;
}
require 'functionsPegawai.php';

$id_member = query("SELECT DISTINCT id_member FROM tb_peminjam ORDER BY id_member ASC");
$id_buku = query("SELECT DISTINCT id_buku FROM tb_buku ORDER BY id_buku ASC");

$member = query("SELECT * FROM tb_peminjam WHERE status_data = 'Aktif'");

$query = "SELECT tb_buku.id_buku, tb_buku.judul_buku, tb_penulis.nama, tb_buku.genre, tb_penerbit.nama_penerbit as penerbit, tb_buku.tahun_terbit, tb_buku.jumlah, tb_buku.dibuat, tb_buku.diubah, tb_buku.dihapus, tb_buku.status_data from tb_buku
join tb_kepengarangan on (tb_buku.id_buku = tb_kepengarangan.id_buku)
join tb_penulis on (tb_penulis.id_penulis = tb_kepengarangan.id_penulis)
join tb_penerbit on (tb_buku.id_penerbit = tb_penerbit.id_penerbit)
WHERE tb_buku.status_data = 'Aktif'";
$buku = query($query);

if( isset($_POST['cariAkun'])){
    $member = cariMember($_POST['keywordAkun']);
}
elseif( isset($_POST['cariBuku'])){
    $buku = cariBuku($_POST['keywordBuku']);
}
elseif( isset($_POST['pinjam'])){
    if(tambahPeminjaman($_POST) > 0){
        echo "
            <script>
                alert('peminjaman berhasil dilakukan');
                document.location.href = 'index.php';
            </script>";
    }else{
        echo "
            <script>
                alert('peminjaman gagal');
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
        <link rel="stylesheet" href="content/pinjamBuku.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

    </head>
    <body>
        <div id="header">
            
        </div>
        <div id="article">
            <div id="head">
                <div id="cariAkun">
                    <div id="judulCariAkun"></div>
                    <form action="" method="POST">
                        <input id="searchAkun" type="search" name="keywordAkun">
                        <input id="btnSubmitAkun" type="submit" value="Cari" name="cariAkun">
                    </form>
                </div>
                <div id="judulHead"></div>
                <div id="exit"></div>
            </div>
            <div id="daftarAkun">
                <div id="judulDaftarAkun"></div>
                <div id="tableAkun" style="overflow-x:auto;">
                    <table class="tableAkun">
                        <tbody>
                            <tr id="row0">
                                <th>No</th>
                                <th>Id Member</th>
                                <th>Nama</th>
                                <th>Tempat Lahir</th>
                                <th>Tanggal Lahir</th>
                                <th>Nomor Telepon</th>
                                <th>Aksi</th>
                            </tr>
                            <?php $i= 1; ?>
                            <?php foreach( $member as $row ) :?>
                            <tr>
                                <td><?= $i ?></td>
                                <td><?php echo "MEM-", $row['id_member'] ?></td>
                                <td><?php echo $row['nama']?></td>
                                <td><?php echo $row['tempat_lahir']?></td>
                                <td><?php echo $row['tanggal_lahir']?></td>
                                <td><?php echo $row['no_telp'] ?></td>
                                <td>
                                    <a href="historiPeminjam.php?id_member=<?= $row['id_member']; ?>">
                                    <button class="history">Riwayat Peminjaman</button>
                                    </a>
                                </td>
                            </tr>
                            <?php $i++; ?>
                            <?php endforeach; ?>
                        </tbody>
                    </table>    
                </div>
            </div>
            <div id="infoAkun">
                <div id="judulPinjamBuku"></div>
                <form id="formAkun" name="formAkun" action="" method="POST">
                    <div id="lbl">
                        <div id="lblIdMember"></div>
                        <div id="lblIdBuku"></div>
                        <div id="judulTgl"></div>
                    </div>
                    <div id="txt">
                        <select name="id_member" id="txtIdMember" required>
                        <option value="" selected disabled hidden>Pilih ID Member</option>
                        <?php foreach($id_member as $pilihan): ?>
                        <option value="<?= $pilihan['id_member']; ?>"><?php echo "MEM-", $pilihan['id_member']; ?></option>
                        <?php endforeach ?>
                        </select>
                        <select name="id_buku" id="txtIdBuku" required>
                        <option value="" selected disabled hidden>Pilih ID Buku</option>
                        <?php foreach($id_buku as $pilihan): ?>
                        <option value="<?= $pilihan['id_buku']; ?>"><?php echo "BK-", $pilihan['id_buku']; ?></option>
                        <?php endforeach ?>
                        </select>
                        <!-- <input id="txtIdMember" name="txtNama" type="text">
                        <input id="txtIdBuku" name="txtIdMember" type="text"> -->
                        <input id="tgl" type="date" name="tgl_pinjam" required>
                    </div>
                    <button type="submit" class="pinjam" name="pinjam">Pinjam</button>
                    <!-- <div id="pinjam"></div> -->
                </form>
            </div>
            <div id="cariBuku">
                <div id="judulCariBuku"></div>
                <form action="" method="POST">
                    <input id="searchBuku" type="search" name="keywordBuku">
                    <input id="btnSubmitBuku" type="submit" value="Cari" name="cariBuku">
                </form>
            </div>
            <div id="spc"></div>
            <div id="daftarBuku">
                <div id="judulDaftarBuku"></div>
                <div id="tableBuku" style="overflow-x:auto;">
                    <table class="tableBuku">
                        <tbody>
                            <tr>
                                <th>No</th>
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
                        </tbody>
                    </table>    
                </div>
            </div>
        </div>
        <div id="footer">

        </div>


        <script type="text/babel">
            let judulCariAkun = (
                <p>Cari :</p>
            );
            ReactDOM.render(judulCariAkun, document.getElementById("judulCariAkun"));
        </script>
        <script type="text/babel">
            let judulHead = (
                <p>PINJAM BUKU</p>
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
            let pinjam = (
                <a>
                    <button className="pinjam">
                        Pinjam Buku
                    </button>
                </a>
            )
            ReactDOM.render(pinjam,document.getElementById("pinjam"));
        </script>
        <script type="text/babel">
            let judulDaftarAkun = (
                <p>Table List Member</p>
            );
            ReactDOM.render(judulDaftarAkun, document.getElementById("judulDaftarAkun"));
        </script>
        <script type="text/babel">
            let judulPinjamBuku = (
                <p>Form Pinjam Buku</p>
            );
            ReactDOM.render(judulPinjamBuku, document.getElementById("judulPinjamBuku"));
        </script>
        <script type="text/babel">
            let lblIdMember = (
                <p>ID Member</p>
            );
            ReactDOM.render(lblIdMember, document.getElementById("lblIdMember"));
        </script>
        <script type="text/babel">
            let lblIdBuku = (
                <p>ID Buku</p>
            );
            ReactDOM.render(lblIdBuku, document.getElementById("lblIdBuku"));
        </script>
        <script type="text/babel">
            let judulTgl = (
                <p>Tanggal Pinjam</p>
            );
            ReactDOM.render(judulTgl, document.getElementById("judulTgl"));
        </script>
        <script type="text/babel">
            let history = (
                <a>
                    <button className="history">
                        Lihat History Peminjaman Buku
                    </button>
                </a>
            )
            ReactDOM.render(history,document.getElementById("history"));
        </script>
        <script type="text/babel">
            let judulCariBuku = (
                <p>Cari :</p>
            );
            ReactDOM.render(judulCariBuku, document.getElementById("judulCariBuku"));
        </script>
        <script type="text/babel">
            let judulDaftarBuku = (
                <p>Table List Buku</p>
            );
            ReactDOM.render(judulDaftarBuku, document.getElementById("judulDaftarBuku"));
        </script>
        

        <script src="boots/js/jquery.js"></script> 
        <script src="boots/js/popper.js"></script> 
        <script src="boots/js/bootstrap.js"></script>
    </body>
</html>