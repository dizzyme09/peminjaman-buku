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

function cariMember($keyword){
    $query = "SELECT * FROM tb_peminjam WHERE 
    (nama LIKE '%$keyword%'
    OR tempat_lahir LIKE '%$keyword%'
    OR no_telp LIKE '%$keyword%')
    AND status_data = 'Aktif'";
    return query($query);
}

function cariBuku($keyword){
    $query = "SELECT tb_buku.id_buku, tb_buku.judul_buku, tb_penulis.nama, tb_buku.genre, tb_penerbit.nama_penerbit as penerbit, tb_buku.tahun_terbit, tb_buku.jumlah, tb_buku.dibuat, tb_buku.diubah, tb_buku.dihapus, tb_buku.status_data from tb_buku
    join tb_kepengarangan on (tb_buku.id_buku = tb_kepengarangan.id_buku)
    join tb_penulis on (tb_penulis.id_penulis = tb_kepengarangan.id_penulis)
    join tb_penerbit on (tb_buku.id_penerbit = tb_penerbit.id_penerbit)
    WHERE (tb_buku.judul_buku LIKE '%$keyword%' OR
    tb_penulis.nama LIKE '%$keyword%' OR
    tb_penerbit.nama_penerbit LIKE '%$keyword%')AND tb_buku.status_data = 'Aktif'";
    return query($query);
}
function tambahPeminjaman($data){
    global $conn;
    $id_member = htmlspecialchars((int)$data['id_member']);
    $id_buku = htmlspecialchars((int)$data['id_buku']);
    $tgl_pinjam = htmlspecialchars($data['tgl_pinjam']);

    $query = "INSERT INTO tb_peminjaman 
    (id_member, id_buku, id_pegawai, tgl_pinjam)
    VALUES
    ($id_member, $id_buku, '".$_SESSION["id_pegawai"]."', '$tgl_pinjam')";

    mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}
?>