export '../models/plan.dart';
export '../models/task.dart';


//  Kita dapat membungkus beberapa data layer ke dalam sebuah file yang nanti akan mengekspor kedua model tersebut.
//  Dengan begitu, proses impor akan lebih ringkas seiring berkembangnya aplikasi.
//  Buat file bernama plan_provider.dart di folder models. Kodenya hanya berisi export seperti berikut.\

//Penjelasan GPT:
// File ini berfungsi sebagai "barrel file" atau file pengelompokan ekspor, yang tujuannya adalah:
// Menyederhanakan import dari beberapa file lain.
// Supaya file lain di project cukup import plan_provider.dart saja untuk mendapatkan akses ke Plan dan Task.

// 🔹 Contoh sebelum pakai plan_provider.dart:

// import 'task.dart';
// import 'plan.dart';

// 🔹 Contoh setelah pakai plan_provider.dart:

// import 'plan_provider.dart'; // otomatis dapat akses ke Plan & Task
// Keuntungan:
//  •  Kode jadi lebih bersih dan rapi.
//  •  Mudah dikelola kalau ada banyak file data/model lain nanti.

// Kalau kamu tambah model baru, tinggal export 'model_baru.dart'; di sini.
// Kalau kamu bikin folder data_layer/, biasanya file ini dinamai plan_provider.dart atau data.dart,
// dan dipakai sebagai pintu masuk modul data.