<?php
session_start();
if(!isset($_SESSION['login'])){
    header('location:../index.php');
    exit;
}
require 'functionsPegawai.php';

$id_member = $_GET['id_member'];

$member = query("SELECT * FROM tb_peminjam WHERE id_member=$id_member")[0];

if( isset($_POST['btnSimpan'])){
    if(ubahMember($_POST) > 0){
        echo "
            <script>
                alert('data member berhasil diubah');
                document.location.href = 'lihatAkun.php';
            </script>";
    }else{
        echo "
            <script>
                alert('data member gagal diubah');
                document.location.href = 'lihatAkun.php';
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
        <link rel="stylesheet" href="content/updateMember.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

    </head>
    <body>
        <div id="header">
            
        </div>
        <div id="article">
            <div id="head">
                <div id="judulHead"></div>
            </div>
            <div id="dataMember">
                <form id="formAkun" name="formAkun" action="" method="POST">
                    <input type="hidden" name="id_member" value="<?= $member['id_member']; ?>">
                    <div id="lbl">
                        <div id="lblNama"></div>
                        <div id="lblNIK"></div>
                        <div id="lblJK"></div>
                        <div id="lblTempatLahir"></div>
                        <div id="lblTanggalLahir"></div>
                        <div id="lblNoTelp"></div>
                        <div id="lblAlamat"></div>
                    </div>
                    <div id="txt">
                        <input id="txtNama" name="nama" type="text" autocomplete="off" value="<?= $member['nama']; ?>" required>
                        <input id="txtNIK" name="NIK" type="number" autocomplete="off" value="<?= $member['NIK']; ?>" min="0" required>
                        <select id="txtJK" name="jenis_kelamin" autocomplete="off" required>
                            <option value="<?= $member['jenis_kelamin']; ?>" selected><?php echo $member['jenis_kelamin']; ?></option>
                            <?php if($member['jenis_kelamin'] == 'Laki-Laki'){
                                echo '<option value="Perempuan">Perempuan</option>';
                            }else{
                                echo '<option value="Laki-Laki">Laki-Laki</option>';
                            } 
                            ?>
                        </select>
                        <input id="txtTempatLahir" name="tempat_lahir" type="text" autocomplete="off" value="<?= $member['tempat_lahir']; ?>" required>
                        <input id="txtTanggalLahir" name="tanggal_lahir" type="date" autocomplete="off" value="<?= $member['tanggal_lahir']; ?>" required>
                        <input id="txtNoTelp" name="no_telp" type="tel" autocomplete="off" value="<?= $member['no_telp']; ?>" required>
                        <textarea id="txtAlamat" name="alamat" autocomplete="off" required><?php echo $member['alamat'] ?></textarea>
                    </div>
                    <button id="btnSimpan" name="btnSimpan" type="submit" value="Simpan">Simpan</button>
                </form>
                <div id="exit"></div>
            </div>
        </div>
        <div id="footer">

        </div>


        <script type="text/babel">
            let judulHead = (
                <p>Data Member</p>
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
            let lblTempatLahir = (
                <p>Tempat Lahir</p>
            );
            ReactDOM.render(lblTempatLahir, document.getElementById("lblTempatLahir"));
        </script>
        <script type="text/babel">
            let lblTanggalLahir = (
                <p>Tanggal Lahir</p>
            );
            ReactDOM.render(lblTanggalLahir, document.getElementById("lblTanggalLahir"));
        </script>
        <script type="text/babel">
            let lblJK = (
                <p>Jenis Kelamin</p>
            );
            ReactDOM.render(lblJK, document.getElementById("lblJK"));
        </script>
        <script type="text/babel">
            let lblNIK = (
                <p>NIK</p>
            );
            ReactDOM.render(lblNIK, document.getElementById("lblNIK"));
        </script>
        <script type="text/babel">
            let lblNoTelp = (
                <p>No. Telepon</p>
            );
            ReactDOM.render(lblNoTelp, document.getElementById("lblNoTelp"));
        </script>
        <script type="text/babel">
            let lblAlamat = (
                <p>Alamat</p>
            );
            ReactDOM.render(lblAlamat, document.getElementById("lblAlamat"));
        </script>
        <script type="text/babel">
            let exit = (
                <a href="lihatAkun.php">
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