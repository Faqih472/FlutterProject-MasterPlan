import 'task.dart';

class Plan {
  final String name;
  final List<Task> tasks;

  const Plan({this.name = '', this.tasks = const []});
}


// 1. import './task.dart';
// 🔹 Apa itu import?
//  •  import adalah perintah di Dart untuk mengambil kode dari file lain.
//  •  Dalam hal ini, kita mengimpor task.dart agar bisa menggunakan kelas Task yang sudah didefinisikan sebelumnya.
// 🔹 Mengapa perlu import?
//  •  Kelas Plan memiliki properti tasks yang bertipe List<Task>.
//  •  Karena Task dideklarasikan di file task.dart, maka kita perlu mengimpornya agar bisa digunakan dalam plan.dart.




// 2. Deklarasi Kelas Plan

//  class Plan {
//     final String name;
//    final List<Task> tasks;
//  }    (Kode yang dibuat)

// 🔹 Apa itu class?
//  •  class adalah template atau blueprint yang digunakan untuk membuat objek.
//  •  Kelas Plan digunakan untuk menyimpan informasi tentang rencana yang berisi daftar tugas (Task).

// Properti dalam Kelas Plan
// Kelas ini memiliki dua properti:

//  1. final String name;
//      • name digunakan untuk menyimpan nama rencana.
//      • Bertipe String, berarti nilainya adalah teks.
//      • final berarti nilai name hanya bisa ditentukan satu kali saat objek dibuat dan tidak bisa diubah setelah itu.

//  2. final List<Task> tasks;
//      • tasks digunakan untuk menyimpan daftar tugas (Task) dalam rencana.
//      • List<Task> berarti properti ini adalah daftar yang berisi objek-objek dari kelas Task.
//      • final berarti referensi ke daftar ini tidak bisa diubah setelah objek dibuat.
// 🔹 Apa Itu List<Task>?
//    • List adalah tipe data di Dart yang digunakan untuk menyimpan kumpulan nilai dalam satu variabel.
//    • List<Task> berarti daftar ini hanya boleh berisi elemen yang bertipe Task.

// Contoh List<Task>:

//  List<Task> daftarTugas = [
//    Task(description: 'Mengerjakan PR', complete: false),
//     Task(description: 'Belajar Flutter', complete: true),
//  ]; (Contoh kode)




// 3. Konstruktor Plan

//   const Plan({this.name = '', this.tasks = const []}); (kode yang dibuat)

// Konstruktor ini digunakan untuk membuat objek Plan.
// 🔹 Apa yang terjadi dalam konstruktor ini?
//  • this.name = ''
//    • Jika pengguna tidak mengisi nama, maka nama rencana akan default menjadi string kosong ('').
//  • this.tasks = const []
//    •Jika pengguna tidak memberikan daftar tugas, maka tasks akan default menjadi daftar kosong ([]).
//    •const [] berarti daftar ini bersifat immutable (tidak bisa diubah).
// 🔹 Mengapa const []?
//  • Jika kita menggunakan final List<Task> tasks;, maka kita perlu menginisialisasi daftar ini dengan nilai tetap (constant).
//  • const [] memastikan bahwa daftar kosong ini tidak bisa dimodifikasi setelah objek Plan dibuat.
//  • Ini mencegah kesalahan saat membuat objek Plan tanpa daftar tugas.




// 4. Contoh Penggunaan Kelas Plan
// Sekarang kita coba membuat objek dari kelas Plan dan melihat hasilnya.

// Contoh 1: Membuat Rencana Tanpa Tugas

//   void main() {
//     var plan1 = Plan(name: 'Belajar Dart');
//    print('Nama Rencana: ${plan1.name}');
//    print('Daftar Tugas: ${plan1.tasks}');
//   }  (Contoh Kode)

// 💡 Hasil Output:

//  Nama Rencana: Belajar Dart
//  Daftar Tugas: [] (Output Contoh Kode)

//  🔹 Penjelasan:
//    • plan1 dibuat dengan nama "Belajar Dart", tetapi daftar tugasnya kosong (tasks = []).
//
// Contoh 2: Membuat Rencana dengan Daftar Tugas

//  void main() {
//     var plan2 = Plan(
//       name: 'Proyek Flutter',
//      tasks: [
//         Task(description: 'Membuat UI', complete: false),
//        Task(description: 'Menulis kode backend', complete: false),
//      ],
//    );

//   print('Nama Rencana: ${plan2.name}');
//   for (var task in plan2.tasks) {
//     print('Tugas: ${task.description}, Selesai: ${task.complete}');
//   }
// }

// 💡 Hasil Output: (Output contoh Kode)

//    Nama Rencana: Proyek Flutter
//    Tugas: Membuat UI, Selesai: false
//    Tugas: Menulis kode backend, Selesai: false

// 🔹 Penjelasan:
//  • plan2 dibuat dengan nama "Proyek Flutter" dan memiliki dua tugas (tasks).
//  • Setiap tugas memiliki deskripsi dan status selesai/tidak (complete).




// 5. Kesimpulan
// ✅ Plan adalah kelas yang merepresentasikan sebuah rencana, yang berisi nama dan daftar tugas (Task).
// ✅ Properti name bertipe String dan tasks bertipe List<Task>.
// ✅ Menggunakan final agar nilai tidak bisa diubah setelah objek dibuat.
// ✅ Konstruktor memiliki nilai default (name = '' dan tasks = const []).
// ✅ Gunakan const agar objek yang dibuat lebih efisien dalam memori.