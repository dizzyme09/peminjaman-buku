<?php
session_start();
require 'functions.php';

if(isset($_POST['signIn'])){
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
                    <input id="username" type="text" name="username" placeholder="Username" autocomplete="off" required>
                    <input id="password" type="password" name="password" placeholder="Password" required>
                    <button id="btnSignIn" name="signIn" type="submit" value="Sign In">Sign In</button>
                </form>
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
        <script type="text/babel">
            let cpr = (
                <p style={{fontSize:"14px"}}>
                    copyright @BOOK.ZONE 2021        
                </p>   
            );
            ReactDOM.render(cpr, document.getElementById("foot"));
        </script>

        <script src="boots/js/jquery.js"></script> 
        <script src="boots/js/popper.js"></script> 
        <script src="boots/js/bootstrap.js"></script>
    </body>
</html>