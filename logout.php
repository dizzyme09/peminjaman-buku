<?php
    session_start();
    require 'functions.php';
    $call_procedure = "CALL log_logout('".$_SESSION["username"]."', '".$_SESSION["id_pegawai"]."')";
    query($call_procedure);
    $_SESSION = [];
    session_unset();
    session_destroy($_SESSION['login']);

    header('location:index.php');
?>