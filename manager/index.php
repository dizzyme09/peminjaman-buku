<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <script src="https://unpkg.com/react@16/umd/react.production.min.js"></script>
        <script src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"></script>
        <script src="https://unpkg.com/babel-standalone@6.15.0/babel.min.js"></script>

        <link rel="stylesheet" href="boots/css/bootstrap.css">
        <link rel="stylesheet" href="content/menuManager.css">

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
            <div id="lihatPegawai">
                <img id="imgLP" src="../img/imgPegawai.png">
                <div id="btnLP"></div>
            </div>
            <div id="tambahBuku">
                <img id="imgTB" src="../img/imgKembalikanBuku.png">
                <div id="btnTB"></div>
            </div>
            <div id="lihatBuku">
                <img id="imgLB" src="../img/imgLihatBuku.png">
                <div id="btnLB"></div>
            </div>
        </div>
        <div id="footer">

        </div>

        <script type="text/babel">
            let menuPegawai = (
                <p>MENU MANAJER</p>
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
            let btnLP = (
                <a>
                    <button className="btnLP">
                        Lihat Pegawai
                    </button>
                </a>
            )
            ReactDOM.render(btnLP,document.getElementById("btnLP"));
        </script>
        <script type="text/babel">
            let btnTB = (
                <a>
                    <button className="btnTB">
                        Tambah Buku
                    </button>
                </a>
            )
            ReactDOM.render(btnTB,document.getElementById("btnTB"));
        </script>
        <script type="text/babel">
            let btnLB = (
                <a>
                    <button className="btnLB">
                        Lihat Buku
                    </button>
                </a>
            )
            ReactDOM.render(btnLB,document.getElementById("btnLB"));
        </script>
        <script>
            document.getElementById("btnLP").addEventListener("click", function show() {
                window.location="lihatPegawai.php";
            });
            document.getElementById("btnLB").addEventListener("click", function show() {
                window.location="lihatBuku.php";
            });
        </script>

        <script src="boots/js/jquery.js"></script> 
        <script src="boots/js/popper.js"></script> 
        <script src="boots/js/bootstrap.js"></script>
    </body>
</html>