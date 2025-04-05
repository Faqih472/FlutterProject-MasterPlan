# flutter_masterplan

A new Flutter project.

## GIF Praktikum 1

![Praktikum 1](GIF/praktikum1.gif)


SOAL PRAKTIKUM DAN JAWABAN
SOAL:

Tugas Praktikum 1: Dasar State dengan Model-View 
1.  Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silahkan diperbaiki.
2.  Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?
3.  mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?
4.  Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
5.  Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?


Tugas Praktikum 2: InheritedWidget
1.  Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki sesuai dengan tujuan aplikasi tersebut dibuat.
2.  Jelaskan mana yang dimaksud InheritedWidget pada langkah 1 tersebut! Mengapa yang digunakan InheritedNotifier?
3.  Jelaskan maksud dari method di langkah 3 pada praktikum tersebut! Mengapa dilakukan demikian?
4.  Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!


Tugas Praktikum 3: State di Multiple Screens
1.  Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silahkan diperbaiki sesuai dengan tujuan aplikasi tersebut dibuat.
2.  Berdasarkan Praktikum 3 yang telah Anda lakukan, jelaskan maksud dari gambar diagram berikut ini!
3.  Lakukan capture hasil dari Langkah 14 berupa GIF, kemudian jelaskan apa yang telah Anda buat!


SOAL PRAKTIKUM DAN JAWABAN
JAWABAN:

Jawaban Praktikum 1
1.  Telah Terselesaikan Tanpa Error

2.  Langkah 4 menjelaskan tentang pembuatan model data dasar yaitu Task dan Plan. Model ini digunakan untuk memisahkan logika data dari tampilan (UI).
•  Task merepresentasikan satu tugas yang memiliki deskripsi dan status selesai (complete).
•  Plan adalah kumpulan dari beberapa task, yang memiliki nama dan daftar tugas (tasks).
Langkah ini dilakukan agar data lebih terstruktur, mudah digunakan, dan mendukung pengelolaan state yang baik di aplikasi Flutter. Pendekatan ini juga sesuai dengan prinsip pemrograman yang baik yaitu separation of concerns dan memudahkan proses pengujian serta pemeliharaan aplikasi di masa depan.

3.  Variabel plan digunakan untuk menyimpan data state aplikasi saat ini, yaitu daftar tugas yang ditampilkan dan dimodifikasi pada layar. Saat pengguna menambahkan, mengedit, atau mencentang tugas, semua perubahan akan disimpan dalam variabel plan.
Variabel ini dibuat sebagai konstanta (const) karena kelas Plan dan Task bersifat immutable (tidak dapat diubah). Untuk mengubah isinya, kita perlu membuat objek baru. Dengan menggunakan const, kita menjamin bahwa objek tersebut tidak akan berubah sembarangan dan mendukung optimalisasi performa oleh Flutter saat membangun ulang UI.

4.  Pada langkah 9, aplikasi telah dapat menambahkan daftar tugas menggunakan tombol tambah (+). Ketika tombol ditekan, sebuah task kosong ditambahkan ke daftar. Pengguna kemudian dapat mengisi deskripsi tugas dan mencentang kotak untuk menandai tugas tersebut telah selesai.

GIF yang diambil memperlihatkan:
•  Pengguna menekan tombol tambah untuk menambahkan task baru.
•  Pengguna mengetik deskripsi di setiap task.
•  Pengguna mencentang dan menghapus centang dari task sesuai status penyelesaian.
Fitur ini memperlihatkan penerapan konsep state management di Flutter, di mana perubahan data (state) secara otomatis menyebabkan tampilan (UI) diperbarui menggunakan setState.


5.  •  Langkah 11 menggunakan method initState() yang merupakan bagian dari lifecycle State di Flutter. Method ini dipanggil sekali saat state pertama kali dibuat. Dalam praktikum ini, digunakan untuk menginisialisasi ScrollController dan menambahkan listener agar keyboard ditutup otomatis saat pengguna melakukan scroll (terutama di perangkat iOS).

    •  Langkah 13 menggunakan method dispose() yang juga bagian dari lifecycle State. Method ini dipanggil saat state akan dihapus dari widget tree. Fungsinya untuk membersihkan sumber daya yang digunakan, dalam hal ini untuk memanggil dispose() pada ScrollController agar tidak terjadi memory leak.

Kedua method ini penting untuk pengelolaan resource secara efisien dan memastikan aplikasi tetap stabil dan optimal.


