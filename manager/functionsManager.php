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

function tambahBuku($data){
    global $conn;
    $judul_buku = htmlspecialchars($data['judul_buku']);
    $genre = htmlspecialchars($data['genre']);
    $id_penerbit = (int)$data['id_penerbit'];
    $tahun_terbit = (int)$data['tahun_terbit'];
    $jumlah = (int)$data['jumlah'];

    $query = "INSERT INTO tb_buku (judul_buku, genre, id_penerbit, tahun_terbit, jumlah)
                VALUES
                ('$judul_buku', '$genre', $id_penerbit, $tahun_terbit, $jumlah)";

    mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}

function ubahBuku($data){
    global $conn;
    $id_buku = (int)$data['id_buku'];
    $judul_buku = htmlspecialchars($data['judul_buku']);
    $genre = htmlspecialchars($data['genre']);
    $id_penerbit = (int)$data['id_penerbit'];
    $tahun_terbit = (int)$data['tahun_terbit'];
    $jumlah = (int)$data['jumlah'];

    $query = "UPDATE tb_buku SET judul_buku='$judul_buku', genre='$genre', 
            id_penerbit=$id_penerbit, tahun_terbit=$tahun_terbit, jumlah=$jumlah
            WHERE id_buku=$id_buku";

    mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}

function cariBuku($keyword){
    $query = "SELECT tb_buku.id_buku, tb_buku.judul_buku, tb_penulis.nama, tb_buku.genre, tb_penerbit.nama_penerbit as penerbit, tb_buku.tahun_terbit, tb_buku.jumlah, tb_buku.dibuat, tb_buku.diubah, tb_buku.dihapus, tb_buku.status_data from tb_buku
    join tb_kepengarangan on (tb_buku.id_buku = tb_kepengarangan.id_buku)
    join tb_penulis on (tb_penulis.id_penulis = tb_kepengarangan.id_penulis)
    join tb_penerbit on (tb_buku.id_penerbit = tb_penerbit.id_penerbit)
    WHERE 
    (tb_buku.judul_buku LIKE '%$keyword%'
    OR tb_buku.id_buku LIKE '%$keyword%')
    AND tb_buku.status_data = 'Aktif'";
    return query($query);
}

function hapusBuku($id_buku){
    global $conn;

    $query = "UPDATE tb_buku SET status_data = 'Tidak Aktif' WHERE id_buku=$id_buku";
    mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}

function ubahPegawai($data){
    global $conn;
    $id_pegawai = (int)$data['id_pegawai'];
    $nik = htmlspecialchars($data['NIK']);
    $nama = htmlspecialchars($data['nama']);
    $jenis_kelamin = htmlspecialchars($data['jenis_kelamin']);
    $jabatan = htmlspecialchars($data['jabatan']);
    $tempat_lahir = htmlspecialchars($data['tempat_lahir']);
    $tanggal_lahir = htmlspecialchars($data['tanggal_lahir']);
    $no_telp = htmlspecialchars($data['no_telp']);
    $alamat = htmlspecialchars($data['alamat']);

    $query = "UPDATE tb_pegawai SET NIK='$nik', nama='$nama', jenis_kelamin='$jenis_kelamin', jabatan='$jabatan',
                tempat_lahir='$tempat_lahir', tanggal_lahir='$tanggal_lahir', no_telp='$no_telp', alamat='$alamat'
                WHERE id_pegawai=$id_pegawai";

    mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}

function hapusPegawai($id_pegawai){
    global $conn;

    $query = "UPDATE tb_pegawai SET status_data = 'Tidak Aktif' WHERE id_pegawai=$id_pegawai";
    mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}

function cariPegawai($keyword){
    $query = "SELECT * FROM tb_pegawai WHERE 
    (nama LIKE '%$keyword%'
    OR NIK LIKE '%$keyword%'
    OR jabatan LIKE '%$keyword%'
    OR tempat_lahir LIKE '%$keyword%')
    AND status_data = 'Aktif'";
    return query($query);
}

function tambahPenulis($data){
    global $conn;
    $nama = htmlspecialchars($data['nama']);
    $jenis_kelamin = htmlspecialchars($data['jenis_kelamin']);
    $tanggal_lahir = $data['tanggal_lahir'];

    $query = "INSERT INTO tb_penulis (nama, jenis_kelamin, tanggal_lahir)
                VALUES
                ('$nama', '$jenis_kelamin', '$tanggal_lahir')";

    mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}

function tambahPenerbit($data){
    global $conn;
    $nama_penerbit = htmlspecialchars($data['nama_penerbit']);

    $query = "INSERT INTO tb_penerbit (nama_penerbit)
                VALUES
                ('$nama_penerbit')";

    mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}

function tambahKepengarangan($data){
    global $conn;
    $id_penulis = (int)$data['id_penulis'];
    $id_buku = (int)$data['id_buku'];

    $query = "INSERT INTO tb_kepengarangan (id_buku, id_penulis)
                VALUES
                ($id_buku, $id_penulis)";

    mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}
?>