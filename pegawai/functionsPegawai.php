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

function hapusMember($id_member){
    global $conn;

    $query = "UPDATE tb_peminjam SET status_data = 'Tidak Aktif' WHERE id_member=$id_member";
    mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}
?>