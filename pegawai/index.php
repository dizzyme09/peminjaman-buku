<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <script src="https://unpkg.com/react@16/umd/react.production.min.js"></script>
        <script src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"></script>
        <script src="https://unpkg.com/babel-standalone@6.15.0/babel.min.js"></script>

        <link rel="stylesheet" href="boots/css/bootstrap.css">
        <link rel="stylesheet" href="content/menuPegawai.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    </head>
    <body>
        <div id="header">
            
        </div>
        <div id="article">
            <div id="head">
                <div id="judul"></div>
                <div id="exit"></div>
            </div>
            <div id="buatAkun">
                <img id="imgBA" src="../img/imgBuatAkun.png">
                <div id="btnBA"></div>
            </div>
            <div id="lihatAkun">
                <img id="imgLA" src="../img/imgLihatAkun.png">
                <div id="btnLA"></div>
            </div>
            <div id="pinjamBuku">
                <img id="imgPB" src="../img/imgPinjamBuku.png">
                <div id="btnPB"></div>
            </div>
            <div id="kembalikanBuku">
                <img id="imgKB" src="../img/imgKembalikanBuku.png">
                <div id="btnKB"></div>
            </div>
        </div>
        <div id="footer">

        </div>

        <script type="text/babel">
            let menuPegawai = (
                <p>MENU PEGAWAI</p>
            );
            ReactDOM.render(menuPegawai, document.getElementById("judul"));
        </script>
        <script type="text/babel">
            let exit = (
                <a href="../logout.php">
                    <button className="exit">
                        Exit
                    </button>
                </a>
            )
            ReactDOM.render(exit,document.getElementById("exit"));
        </script>
        <script type="text/babel">
            let btnBA = (
                <a>
                    <button className="btnBA">
                        Buat Akun
                    </button>
                </a>
            )
            ReactDOM.render(btnBA,document.getElementById("btnBA"));
        </script>
        <script type="text/babel">
            let btnLA = (
                <a>
                    <button className="btnLA">
                        Lihat Akun
                    </button>
                </a>
            )
            ReactDOM.render(btnLA,document.getElementById("btnLA"));
        </script>
        <script type="text/babel">
            let btnPB = (
                <a>
                    <button className="btnPB">
                        Pinjam Buku
                    </button>
                </a>
            )
            ReactDOM.render(btnPB,document.getElementById("btnPB"));
        </script>
        <script type="text/babel">
            let btnKB = (
                <a>
                    <button className="btnKB">
                        Kembalikan Buku
                    </button>
                </a>
            )
            ReactDOM.render(btnKB,document.getElementById("btnKB"));
        </script>
        <script>
            document.getElementById("btnLA").addEventListener("click", function show() {
                window.location="lihatAkun.php";
            });
        </script>
                <script>
            document.getElementById("btnPB").addEventListener("click", function show() {
                window.location="pinjamBuku.php";
            });
        </script>

        <script src="boots/js/jquery.js"></script> 
        <script src="boots/js/popper.js"></script> 
        <script src="boots/js/bootstrap.js"></script>
    </body>
</html>