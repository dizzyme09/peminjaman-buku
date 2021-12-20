<?php 
$conn = mysqli_connect("localhost", "root", "", "db_buku");

function query($query){
    global $conn;
    $result = mysqli_query($conn, $query);
    $rows = [];
    while($row = mysqli_fetch_assoc($result)){
        $rows[] = $row;
    }
    return $rows;
}

function cariBuku($keyword){
    $query = "SELECT * FROM tb_buku WHERE 
    (judul_buku LIKE '%$keyword%'
    OR id_buku LIKE '%$keyword%')
    AND status_data = 'Aktif'";
    return query($query);
}

function hapusBuku($id_buku){
    global $conn;

    $query = "UPDATE tb_buku SET status_data = 'Tidak Aktif' WHERE id_buku=$id_buku";
    mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}

function hapusPegawai($id_pegawai){
    global $conn;

    $query = "UPDATE tb_pegawai SET status_data = 'Tidak Aktif' WHERE id_pegawai=$id_pegawai";
    mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}
?>