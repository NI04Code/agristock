# WEAPONRY

# PBP TUGAS 7
## Apa perbedaan utama antara stateless dan stateful widget    dalam konteks pengembangan aplikasi Flutter?

- **Stateless Widget:**
   - **Stateless**: Stateless Widget memiliki tampilan yang bersifat stateless atau tidak akan berubah-ubah sehingga cocok untuk suatu page yang bersifat static
   - **Kinerja lebih cepat**: Stateless Widget lebih efisien secara kinerja daripada Stateful Widget karena bersifat statis.

- **Stateful Widget:**
   - **Mengelola keadaan (stateful)**: Stateful Widget memiliki tampilan dengan keadaan yang dapat berubah-ubah selama app dijalankan. Contohnya tombol yang dapat diubah menjadi berbagai bentuk atau input field.
   - **Kinerja sedikit lebih rendah**: Stateful Widget dapat memiliki kinerja lebih tidak efisien dibandingkan dengan Stateless Widget karena adanya perubahan selama app berjalan.

## Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

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


## Step by Step
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

# PBP TUGAS 8 
## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

**Navigator.push():**

- Metode ini digunakan untuk menambahkan page baru ke stack navigasi. page yang sebelumnya ada di stack tetap ada, dan pengguna dapat kembali ke page tersebut. Berfungsi ketika ingin menambahkan page baru ke stack dan memungkinkan pengguna untuk kembali ke page sebelumnya.

Berikut cara penggunaannya
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => NewPage()),
);
```

**Navigator.pushReplacement():**

- Metode ini juga menambahkan page baru ke stack navigasi, tetapi menghapus page yang saat ini aktif dari stack.
Berfungsi ketika ingin mengganti page saat ini dengan page baru dan tidak ingin pengguna kembali ke page sebelumnya.

Berikut cara penggunaannya
```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => NewPage()),
);
```
## Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

1. **Container:** Widget serbaguna untuk mengatur tata letak dan dekorasi.

2. **Row dan Column:** Digunakan untuk menyusun widget secara horizontal (Row) atau vertikal (Column).

3. **ListView:** Menampilkan daftar widget yang dapat di-scroll.

4. **Stack:** Memungkinkan penumpukan widget di atas satu sama lain.

5. **Expanded dan Flexible:** Memberikan proporsi ruang dalam widget yang menggunakan `Row` atau `Column`.

6. **GridView:** Menampilkan widget dalam bentuk grid.

7. **Wrap:** Menyusun widget dalam baris dan kolom yang dibungkus, berguna untuk menyusun widget secara dinamis.


## Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Pada tugas kali ini kita menggunakan `TextFormField`.   
`TextFormField` adalah widget Flutter yang digunakan untuk membuat input teks dalam bentuk formulir, beberapa alasan kenapa kita menggunakan input form ini karena beberapa atribut didalamnya seperti atribut `validator` otomatis dan atribut `onSaved` untuk menyimpan formulir tersebut dan `onChanged` untuk mengubah ngubah input dari form. Selain itu form ini juga dilengkapi dengan decorator seperti form pada html.

## Bagaimana penerapan clean architecture pada aplikasi Flutter? 
Clean architecture pada Flutter melibatkan pembagian aplikasi menjadi tiga lapisan utama: Presentation, Domain, dan Data.  Presentation layer akan berkomunikasi dengan domain layer, yang kemudian berinteraksi dengan data layer untuk mendapatkan atau menyimpan data.

## Step by Step

1. **Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan yang diberikan dan
memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.**   
    1. Membuat file dart dengan nama weapon_form, lalu menginisiasi variabel untuk input sesuai dengan models pada django yang telah dibuat
    2. Menggunakan `TextFormView` yang dibungkus di dalam column untuk melakukan input dan menvalidasinya dengan validator, berikut codenya,
    ```dart
        child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Nama Senjata",
                        labelText: "Nama Senjata",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _name = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Nama senjata tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ),

                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Jumlah",
                        labelText: "Jumlah",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _amount = int.parse(value!);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Jumlah tidak boleh kosong!";
                        }
                        if (int.tryParse(value) == null) {
                          return "Jumlah harus berupa angka!";
                        }
                        return null;
                      },
                    ),
                  ),
    ```    

    3. Melakukan Save dengan membuat objek dan menampilkan pop up windows keterangan senjata yang ditambahkan ketika form diklik, berikut codenya
    ```dart
        onPressed: () {
                        if (_formKey.currentState!.validate()) {
                        Weapon newWeapon = Weapon(_name, _amount, _atk, _critRate, _critDmg, _description);
                        Weapon.weaponList.add(newWeapon);
                        showDialog(
                            context: context,
                            builder: (context) {
                            return AlertDialog(
                                title: const Text('Produk berhasil tersimpan'),
                                content: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                    Text('Nama: $_name'),
                                    Text('Jumlah: $_amount'),
                                    Text('Atk: $_atk'),
                                    Text('Crit Rate: $_critRate'),
                                    Text('Crit Dmg: $_critDmg'),
                                    Text('Deskripsi: $_description')
                                    
                                    ],
                                ),
                                ),
                                actions: [
                                TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                    Navigator.pop(context);
                                    },
                                ),
                                ],
                            );
                            },
                        );
                        }
                        _formKey.currentState!.reset();
                    },
                    child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                    ),
    ```
2. **Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.**   
    1. Memisahkan menu card pada file terpisah dengan menu.dart
    2. Pada menu card ketika card diklik saya menggunakan `Navigator.push` ketika item.name pada menu cart == 'Tambah Senjata',
    ```dart
    onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          if (item.name == "Tambah Senjata") {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WeaponFormPage()));
          }
    ```
    
3. **Membuat sebuah drawer pada aplikasi dengan ketentuan yang diberikan**
    1. Membuat file `left_drawet.dart` seperti pada tutorial
    2. Membuat suatu listview dengan listtile yang berisi opsi halaman utama dan tambah senjata
    3. pada opsi halaman utama saya memberikan `navigator.pushReplacement` untuk mengarahkan ke MyHomePage()
    ```dart
     ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              // Bagian redirection ke MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
    ```
    4. pada opsi tambah senjata saya juga memberikan `navigator.pushReplacement` untuk mengarahpakn ke WeaponFormPage()
    ```dart
    ListTile(
              leading: const Icon(Icons.add_circle_outline),
              title: const Text('Tambah Senjata'),
              // Bagian redirection ke ShopFormPage
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WeaponFormPage()));
              },
            ),
    ```







