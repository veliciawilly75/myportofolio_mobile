# Portofolio versi Mobile

Nama : Velicia Willy

NPM : 2506657384

Kelas : PBP D

## Hyperlinks
1. [Tugas 7](#tugas-7)
2. [Tugas 8](#tugas-8)


## Tugas 7
### Perubahan yang terjadi
1. Mengganti color scheme dari hasil Tutorial 8
2. Mengubah pewarnaan tombol Lihat Proyek, Tambah Proyek, dan Logout agar jadi saling kontras.

### Pertanyaan Reflektif
1. Widget tree adalah struktur tree di mana setiap nodenya adalah widget dan mengandung semua widget yang ada pada aplikasi. Widget tree menggambarkan hubungan hierarkis antar widget. Parent widget adalah widget yang mengandung child widget di dalamnya. Parent widget meneruskan properti-propertinya seperti layout, styling, perilaku, dan data ke anak-anak widgetnya.

2. Proyek ini menggunakan widget Material, MaterialApp (fungsinya di jawaban nomor 3), Scaffold (menentukan struktur visual dasar halaman), AppBar (menampilkan semacam header dari halaman), Body (menampilkan isi dari halaman), Padding (menambahkan padding di sekitar widgets), Column (menyusun widgets secara vertikal), Row (menyusun widgets secara horizontal), Center (merata-tengah-kan widgets di dalamnya), Text (menampilkan teks), SizedBox (menentukan batasan ukuran untuk child widgets), GridView (menentukan peletakan widgets secara grid), Card (membuat panel yang menampung widget lain serta memiliki properti seperti bentuk border, elevation, bentuk, dll), InkWell (membuat respons terhadap berbagai aksi tekan), SnackBar (menampilkan pesan popup), Container (menampung widgets dengan properti tertentu), dan Icon (menyimpan icon). 

3. Widget MaterialApp berfungsi sebagai pembungkus widget-widget yang ada pada halaman kita. MaterialApp juga berfungsi untuk menentukan judul aplikasi yang dikenali device (properti title), tema keseluruhan aplikasi (properti theme), dan path-path dari proyek kita. Contoh path adalah properti home yang merupakan landing page atau halaman yang pertama kali dibuka ketika aplikasi dibuka. Karena menyimpan hal-hal yang berlaku untuk keseluruhan proyek, MaterialApp umumnya digunakan sebagai root widget pada aplikasi.

4. StatelessWidget adalah Widget yang tidak memerlukan state yang diubah oleh sebuah aksi atau properti. Contohnya adalah InfoCard pada proyek ini. Isi dari InfoCard tidak akan berubah sehingga cocok menggunakan StatelessWidget. Sementara itu, StatefulWidget adalah Widget yang dapat diubah oleh sebuah aksi atau properti. Contohnya adalah widget pada aplikasi counter default dari flutter. Teks yang berisi informasi jumlah penekanan tombol berubah setiap kali tombol ditekan. Oleh karena itu, widget ini tidak dapat diimplementasikan dengan StatelessWidget karena memerlukan state program, dalam kasus ini jumlah penekanan tombol.

5. BuildContext adalah sebuah objek di flutter yang digunakan untuk mengetahui posisi suatu widget pada widget tree. Posisi ini dapat digunakan untuk mengetahui theme dan peletakan objek pada layar. Informasi-informasi tersebut berguna pada method build untuk menentukan sifat dari widget baru yang di-build.

6. Hot reload hanya me-reload perubahan pada kode, state program tidak berubah, sementara hot restart mengubahnya dengan menjalankan ulang aplikasi flutter. Hot reload berguna ketika kita melakukan perubahan yang tidak berhubungan dengan state program seperti perubahan skema pewarnaan dan perbaikan bug kecil. Akan tetapi, bila kita perlu state suatu program di-reload ke state awal/default, kita harus melakukan hot restart. Full restart diperlukan apabila kita membuat perubahan terhadap native code seperti Java/Kotlin/ObjectiveC/Swift sehingga code tersebut perlu di-compile ulang.

### AI Disclosure
Saya menggunakan Gemini AI untuk membantu saya membuat color scheme pada tugas ini, berhubung saya tidak terlalu paham soal desain.

Berikut link percakapan saya dengan AI: https://gemini.google.com/share/d/1Z8cxu3aWmx8QSUVvWuWA0zwAUw8G50P8?usp=sharing

### Resources
1. Halaman Tutorial 8 PBP
2. PPT 09 - Intro to Dart and Flutter

## Tugas 8
### Perubahan yang terjadi
1. Menambahkan halaman form Experience.
2. Menyatukan tema warna pada keseluruhan aplikasi.

### Pertanyaan Reflektif
1. Navigator.push() hanya meng-append suatu route ke stack route, sementara Navigator.pushReplacement() menghapus route teratas pada stack route dan menggantinya dengan route baru. Navigator.pop() menghapus route teratas pada stack route dan memindahkan user ke route yang berada di bawah route teratas pada stack route. Navigator.push() saya gunakan untuk membuka formulir pada kartu aksi karena ini memungkinkan pengguna untuk kembali ke halaman sebelumnya dengan menekan tombol back pada device. Untuk kembali ke Home, saya menggunakan Navigator.pushReplacement() untuk mencegah pengguna kembali ke halaman sebelumnya (halaman formulir misalnya).
2. Scaffold mendefinisikan app bar (header) dan drawer dari suatu halaman. Jika setting theme app bar dan drawer yang digunakan pada keseluruhan aplikasi sama, struktur halaman pada keseluruhan aplikasi akan konsisten. Penggunaan warna tema portofolio saya ada di backgroundColor dan foregroundColor app bar masing-masing halaman dan pada drawer header.
3. Untuk formulir, tinggi total widgets/fields bisa jadi melebihi tinggi layar pengguna. Oleh karena itu, kita perlu memungkinkan pengguna untuk melakukan scrolling ketika tinggi totalnya melebihi tinggi layar device agar widgets/fields di bawahnya tidak terpotong. Mekanisme scrolling ini diimplementasikan menggunakan widget SingleChildScrollView. Pada halaman forms, terlihat pula bahwa ada jarak di antara field satu dengan field lainnya. Hal ini diperlukan karena field yang saling berdempetan tidak terlihat bagus dan bahkan bisa menyulitkan pengguna ketika membaca dan mengisi form. Pengaturan jarak ini diimplementasikan dengan widget Padding dan mengisi atribut padding-nya dengan ukuran padding yang diinginkan.
4. GlobalKey<FormState> digunakan untuk mengakses dan memvalidasi data yang dikumpulkan, serta mengelola state dari form. GlobalKey<FormState> merupakan key milik suatu form yang bisa digunakan untuk mengidentifikasinya. Validator adalah salah satu atribut dari FormField berupa fungsi yang digunakan untuk memastikan input pengguna sesuai ketentuan. Jika tidak sesuai ketentuan, validator akan mengembalikan pesan error dan menolak input pengguna. Fungsi validate() diterapkan kepada FormState milik key milik form. Fungsi ini akan menjalankan validator dari semua field pada form.

### AI Disclosure
Saya menggunakan Gemini AI untuk membantu saya mengimplementasikan date picker dan validator untuk date picker serta dropdown selection.

Link chat saya dengan AI: https://gemini.google.com/share/d/1ghl9n1yLB3NMn04Wdn1LTbMheD4bB9hz?usp=sharing 

### Resources
1. Halaman Tutorial 9 PBP
2. Dokumentasi Flutter (https://docs.flutter.dev/)