<p align="center">
  <img src="img/Rectangle 46(1).png" width=300>
</p>

# Project Akhir Sistem Basis Data
### Anggota Kelompok
* Belvin Shandy Aurora (11200910000052)
* Anindia Tri Cahyani (11200910000053)
* Amir Acalapati Henry (11200910000055)
***

## Cara Menggunakan Aplikasi yang Telah Dibuat
### Instalasi Aplikasi yang Diperlukan
* [XAMPP](https://www.apachefriends.org/download.html) (disini memakai versi 7.3.33 / PHP 7.3.33)

catatan: yang diperlukan pada XAMPP ini adalah MySQL dan Apache jika terjadi error saat menjalankan Apache seperti port error [lihat disini](https://youtu.be/_cu7KM0NsUA) untuk cara penyelesaiannya

## Cara Kerja
* Jalankan aplikasi XAMPP lalu aktifkan services MySQL dan Apache
* Buka browser kalian, tulis `localhost` **Jika port Apache tidak error saat pertama kali instalasi**
* Jika port Apache diganti maka tulis `localhost:[port-yang-diganti]` **contoh:** `localhost:8080`, jika berhasil maka akan masuk ke menu phpMyAdmin
* Pada repository ini buka menu **Code** lalu dropdown akan muncul pilih **Download ZIP** ini akan mendownload ke local storage kalian atau bisa menggunakan Git Bash dengan menggunakan URL `git clone https://github.com/DizzyMeee/peminjaman-buku.git` dan perlu diingat file ini harus berada pada local folder kalian yang bernama `xampp/htdocs`
* Kembali ke browser dengan page `localhost/phpmyadmin` yang masih terbuka cari toolbars yang berjudul **import**
* Ketika pada menu import diminta untuk upload file yaitu file sql yang ada di dalam folder ini
* Jalankan aplikasinya dengan cara `localhost/nama-folder` **nama-folder** disini adalah nama folder yang diclone ke dalam htdocs yaitu **peminjaman-buku**
