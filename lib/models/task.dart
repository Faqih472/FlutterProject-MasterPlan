class Task {

  final String description;
  final bool complete;

  const Task({
    this.complete=false,
    this.description='',
});
}

// 1. Apa Itu class?
//  Di Dart, class digunakan untuk membuat cetakan (template) dari suatu objek. Kelas berisi properti (fields) dan fungsi (methods) yang menggambarkan karakteristik serta perilaku dari objek yang dibuat.
//  Pada kode yang diberikan, kita membuat kelas Task yang merepresentasikan sebuah tugas.

// 2. Properti dalam Kelas
//  Di dalam kelas Task, terdapat dua properti:
//
// a. final String description;
//  -String adalah tipe data yang digunakan untuk menyimpan teks (karakter).
//
//  -final berarti nilai variabel ini hanya bisa di-set sekali, setelah itu tidak bisa diubah lagi.
//
//  -description adalah nama variabel yang digunakan untuk menyimpan deskripsi tugas.
//
// b. final bool complete;
//  -bool adalah tipe data yang hanya memiliki dua nilai: true (benar) atau false (salah).
//
//  -final membuat nilai complete tidak bisa diubah setelah objek dibuat.
//
//  -complete digunakan untuk menyimpan status apakah tugas sudah selesai atau belum.
//
// 🔹 Apa Itu bool?
//
// bool adalah kependekan dari "Boolean", yang merupakan tipe data dalam pemrograman yang hanya memiliki dua nilai:
// -true (benar)
// -false (salah)
//
// Contoh Penggunaan bool:
// bool isFlutterFun = true; // Menyatakan bahwa Flutter itu menyenangkan
// bool isCompleted = false; // Menyatakan tugas belum selesai

//3. Konstruktor dengan Nilai Default

// const Task({
//    this.complete = false,
//    this.description = '',
//  });


// Apa Itu Konstruktor?
//  • Konstruktor adalah metode khusus dalam kelas yang digunakan untuk membuat objek baru.
//  • Di kode ini, kita menggunakan konstruktor dengan parameter bernama {} untuk memberikan nilai awal ke properti description dan complete.

// Nilai Default
// this.complete = false,
// → Jika pengguna tidak memberikan nilai untuk complete, maka otomatis diatur sebagai false.
//
// this.description = '',
// → Jika pengguna tidak memberikan nilai untuk description, maka otomatis diatur sebagai string kosong ''.
//
// 🔹 Contoh Penggunaan:

//  var task1 = Task(description: 'Mengerjakan PR', complete: true);
//  var task2 = Task(); // complete = false, description = ''


// 4. Apa Itu const?
// Di kode ini, kita menggunakan const untuk mendeklarasikan konstruktor:

// const Task({this.complete = false, this.description = ''}); ini kode yang dibuat.

// 🔹 Apa Itu const?

// •  const adalah singkatan dari "constant", yang berarti tetap atau tidak bisa berubah.

// •  Jika kita menambahkan const pada konstruktor, maka objek yang dibuat akan menjadi immutable (tidak bisa diubah setelah dibuat).

// •  Ini membuat program lebih efisien dalam penggunaan memori karena Dart dapat menyimpan objek yang sama tanpa harus membuat ulang.

// 🔹 Perbedaan final dan const:

// Kata Kunci,	Kegunaan, dan	Contoh
// final,	Nilai hanya bisa di-set sekali saat objek dibuat, tetapi objeknya masih bisa berubah.	final int x = 10;
// const,	Nilai tidak bisa diubah sama sekali setelah dibuat (benar-benar tetap).	const int y = 20;


// Contoh const vs final:

// final DateTime now = DateTime.now(); // Bisa berubah setiap kali program dijalankan
// const double pi = 3.14; // Tidak akan pernah berubah



// 5. Contoh Penggunaan Kelas Task
// Sekarang kita coba buat objek dari kelas Task dan melihat hasilnya:

// void main() {
//   // Membuat objek Task
//   var tugas1 = Task(description: 'Belajar Flutter', complete: false);
//   var tugas2 = Task(description: 'Mengerjakan tugas', complete: true);
//   var tugas3 = Task(); // Menggunakan nilai default
//
//   // Menampilkan hasil
//   print('Tugas 1: ${tugas1.description}, Selesai: ${tugas1.complete}');
//   print('Tugas 2: ${tugas2.description}, Selesai: ${tugas2.complete}');
//   print('Tugas 3: ${tugas3.description}, Selesai: ${tugas3.complete}');
// }
// 💡 Hasil Output:

// Tugas 1: Belajar Flutter, Selesai: false
// Tugas 2: Mengerjakan tugas, Selesai: true
// Tugas 3: , Selesai: false
// Kesimpulan
// ✅ class Task digunakan untuk membuat objek tugas yang memiliki deskripsi dan status selesai/tidak.
// ✅ final digunakan agar nilai properti hanya bisa di-set sekali.
// ✅ bool adalah tipe data yang hanya bisa bernilai true atau false.
// ✅ const digunakan agar objek yang dibuat menjadi immutable (tidak bisa diubah).
// ✅ Konstruktor dengan parameter bernama {} memungkinkan pemberian nilai default.
