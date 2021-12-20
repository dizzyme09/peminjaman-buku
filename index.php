<?php
session_start();
if(isset($_SESSION['login'])){
    header('location:index.php');
    exit;
}
require 'functions.php';

if(isset($_POST['login'])){
    $username = $_POST['username'];
    $password = $_POST['password'];


    $query = "SELECT username, password, tb_pegawai.id_pegawai, jabatan FROM tb_user 
                JOIN tb_pegawai on (tb_pegawai.id_user = tb_user.id_user) 
                WHERE username = '$username'";
    $result = mysqli_query($conn, $query);

    if(mysqli_num_rows($result) === 1){
        $row = mysqli_fetch_assoc($result);
        if($password == $row['password']){
            $_SESSION['login'] = true;
            $_SESSION['username'] = $row['username'];
            $_SESSION['id_pegawai'] = (int)$row['id_pegawai'];
            
            if($row['jabatan'] == 'Manager'){
                header('location: manager/index.php');
            }
            else if($row['jabatan'] == 'Pegawai'){
                header('location: pegawai/index.php');
            }

            $call_procedure = "CALL log_login('".$_SESSION["username"]."', '".$_SESSION["id_pegawai"]."')";
            query($call_procedure);
            exit;
        }
    }

    $error = true;
}
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <script src="https://unpkg.com/react@16/umd/react.production.min.js"></script>
        <script src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"></script>
        <script src="https://unpkg.com/babel-standalone@6.15.0/babel.min.js"></script>

        <link rel="stylesheet" href="boots/css/bootstrap.css">
        <link rel="stylesheet" href="content/login.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    </head>
    <body>
        <div id="header">
            <img src="img/Rectangle 46(1).png">
        </div>
        <div id="article">
            <div id="login">
                <div id="txtLogin"></div>
                <form action="" method="POST">
                    <input id="username" name="username" type="text" placeholder="Username" autocomplete="off" required>
                    <input id="password" name="password" type="password" placeholder="Password" required>
                    <button type="submit" name="login" class="sign">Sign In</button>
                </form>
                <div id="signIn"></div>
            </div>
            <div id="foot"></div>
        </div>
        <div id="footer">
            
        </div>

        <script type="text/babel">
            let login = (
                <p>Login</p>
            );
            ReactDOM.render(login, document.getElementById("txtLogin"));
        </script>
        <!-- <script type="text/babel">
            let signIn = (
                <a>
                    <button className="sign">
                        Sign In
                    </button>
                </a>
            )
            ReactDOM.render(signIn,document.getElementById("signIn"));
        </script> -->
        <script type="text/babel">
            let cpr = (
                <p style={{fontSize:"14px"}}>
                    copyright @BOOK.ZONE 2021        
                </p>   
            );
            ReactDOM.render(cpr, document.getElementById("foot"));
        </script>
        <!-- <script>
            document.getElementById("signIn").addEventListener("click", function show() {
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
                if (username == "Pegawai") {
                    if (password == "13579") {
                        window.location="menuPegawai.html";
                    }
                    else {
                        window.alert("Harap masukkan username dan password yang sesuai");
                    }
                }
                else if (username == "Manager") {
                    if (password == "24680") {
                        window.location="menuManager.html";
                    }
                    else {
                        window.alert("Harap masukkan username dan password yang sesuai");
                    }
                }
                else if(username != "Pegawai" || username != "Manager") {
                    window.alert("Harap masukkan username dan password yang sesuai");
                }
            });
        </script> -->


        <script src="boots/js/jquery.js"></script> 
        <script src="boots/js/popper.js"></script> 
        <script src="boots/js/bootstrap.js"></script>
    </body>
</html>