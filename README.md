# agristock

**PBP Tugas 7**   
**Apa perbedaan utama antara stateless dan stateful widget    dalam konteks pengembangan aplikasi Flutter?**  

- **Stateless Widget:**
   - **Stateless**: Stateless Widget memiliki tampilan yang bersifat stateless atau tidak akan berubah-ubah sehingga cocok untuk suatu halaman yang bersifat static
   - **Kinerja lebih cepat**: Stateless Widget lebih efisien secara kinerja daripada Stateful Widget karena bersifat statis.

- **Stateful Widget:**
   - **Mengelola keadaan (stateful)**: Stateful Widget memiliki tampilan dengan keadaan yang dapat berubah-ubah selama app dijalankan. Contohnya tombol yang dapat diubah menjadi berbagai bentuk atau input field.
   - **Kinerja sedikit lebih rendah**: Stateful Widget dapat memiliki kinerja lebih tidak efisien dibandingkan dengan Stateless Widget karena adanya perubahan selama app berjalan.

**Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.**

- `MaterialApp` : widget utama yang digunakan untuk     menginisialisasi dan mengatur seluruh aplikasi Flutter.
- `ThemeData` : widget untuk mengatur tema aplikasi.
- `Scaffold` : widget yang berfungsi sebagai kerangka dasar aplikasi.
- `AppBar` : widget yang memberikan navigation bar pada atas aplikasi.
- `SingleChildScrollView` : widget yang digunakan untuk mengizinkan konten aplikasi dapat discroll.
- `Padding` : widget untuk menambahkan padding.
- `Column` : widget yang digunakan untuk menampilkan children secara vertikal, satu di bawah yang lain.
- `Text` : widget untuk menampilkan text.
- `GridView.count` : widget untuk membuat tata letak grid dengan jumlah baris dan kolom yang telah ditentukan.
- `MenuCard` : widget custom untuk menampilkan card yang berisi item.
- `Material` : widget yang berfungsi untuk memberikan latar belakang warna pada card melalui property colornya.
- `InkWell` : widget yang berfungsi untuk memberikan respons terhadap sentuhan pengguna. Saat digunakan, akan menampilkan efek sentuhan (splash) ketika item diklik. 
- `ScaffoldMessenger.of(context)` : widget yang digunakan untuk mendapatkan pesan atau notifikasi terkait aplikasi.
- `SnackBar` : widget yang digunakan untuk menampilkan pesan notifikasi singkat yang muncul di bagian bawah layar.
- `Container` : Wwidget yang digunakan untuk mengelompokkan elemen-elemen seperti ikon dan teks ke dalam satu wadah.
- `Icon` : widget yang digunakan untuk menampilkan ikon.      


**Step by Step**    
1. **Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.**  
    1. menginisiasi program flutter dengan menjalankan command `flutter createapp <app_name>` dimana app_name disini adalah agristock
    2. Merapikan file pada directory lib seperti pada tutorial dan mengarahkan class homepage pada file dart bernama `menu.dart`
2. **Membuat tiga tombol sederhana dengan ikon dan teks untuk: Melihat daftar item (Lihat Item)   
Menambah item (Tambah Item)  
Logout (Logout)** 
    1. membuat widget `MyHomePage` yang mengextends statelesswidget
    2. membuat widget custom bernama `MenuCard` yang mengextends statelesswidget untuk membuat card yang berisi `MenuItem`
    3. membuat class `MenuItem` yang memiliki atribut name, icon, dan color
    4. membuat list yang berisikan MenuItem dengan nama items
    5. pada widget `MenuCard` pada color property widget `Material` saya menggunakan item.color untuk mencaiptakan card yang warnanya berbeda satu sama lain  
    6. menggunakan grid layout dengan children items.map yang merupakan setiap item pada list items.
3. **Memunculkan Snackbar**
    1. pada widget `MenuCard` saya menambahkan property onTap yang didalamnya terdapat widget `ScaffoldMessenger.of(context)`
    2. setelahnya saya menambahkan `..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));` untuk menampilkan snackbar dibawah layar dengan kalimat "Kamu telah menekan tombol ${item.name}!" dimana item.name merefers ke name pada objek MenuItem.
    
    






