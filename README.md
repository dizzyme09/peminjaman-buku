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
* Jalankan aplikasi XAMPP lalu hidupkan services MySQL dan Apache
* Buka browser kesayangan kalian, tulis `localhost` **Jika port Apache tidak error saat pertama kali instalasi**
* Jika port Apache diganti maka tulis `localhost:[port-yang-diganti]` **contoh:** `localhost:8080` jika berhasil masuk ke menu phpMyAdmin
* Pada repository ini buka menu **Code** lalu dropdown akan muncul pilih **Download ZIP** ini akan mendownload ke local storage kalian
* Di dalam file zip tersebut diantaranya ada file php, css dan sql, ekstrak zip tersebut dan copy foldernya
* Browse ke local directory kalian, cari folder xampp/htdocs lalu paste
* Kembali ke browser dengan page `localhost/phpmyadmin` yang masih terbuka cari toolbars yang berjudul **import**
* Ketika pada menu import diminta untuk upload file yaitu file sql yang ada di dalam folder zip ini
* Jalankan aplikasinya dengan cara `localhost/nama-folder` **nama-folder** disini adalah nama folder yang dipaste ke dalam htdocs tadi yaitu **peminjaman-buku**
