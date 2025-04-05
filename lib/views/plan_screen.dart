import '../models/data_layer.dart'; // Mengimpor model Plan dan Task dari folder models
import 'package:flutter/material.dart'; // Mengimpor material design untuk membuat UI di Flutter
import '../provider/plan_provider.dart';

late ScrollController scrollController;


// PlanScreen adalah widget dengan state (stateful), artinya UI-nya bisa berubah
class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key}); // Konstruktor PlanScreen, menerima key opsional

  @override
  State createState() => _PlanScreenState(); // Membuat state dari widget ini
}

// _PlanScreenState adalah class yang mengatur logika dan tampilan PlanScreen
class _PlanScreenState extends State<PlanScreen> {
  // Controller untuk scroll agar kita bisa mendeteksi scroll dan menutup keyboard
  late ScrollController scrollController;

  // Dipanggil pertama kali saat state dibuat (mirip onCreate di Android)
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        // Menutup keyboard saat user scroll
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  // Dipanggil saat widget dihapus dari tree (untuk membersihkan resource)
  @override
  void dispose() {
    scrollController.dispose(); // Jangan lupa hapus controller-nya
    super.dispose();
  }

  // Membuat objek plan kosong. Karena final, kita perlu membuat ulang saat mengubah.
  Plan plan = const Plan(); // Plan default (tanpa nama & tanpa task)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Master Plan')),
      body: ValueListenableBuilder<Plan>(
        valueListenable: PlanProvider.of(context),
        builder: (context, plan, child) {
          return Column(
            children: [
              Expanded(child: _buildList(plan)),
              SafeArea(child: Text(plan.completenessMessage))
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  // Method untuk membangun tombol '+' (FloatingActionButton)
  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Plan currentPlan = planNotifier.value;
        planNotifier.value = Plan(
          name: currentPlan.name,
          tasks: List<Task>.from(currentPlan.tasks)..add(const Task()),
        );
      },
    );
  }




  // Method untuk menampilkan daftar task menggunakan ListView
  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index, context),
    );
  }



    // Method untuk membangun tampilan satu item (satu task)
  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
    return ListTile(
        leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
      Plan currentPlan = planNotifier.value;
      planNotifier.value = Plan(
        name: currentPlan.name,
        tasks: List<Task>.from(currentPlan.tasks)
          ..[index] = Task(
            description: task.description,
            complete: selected ?? false,
          ),
      );
    }),
    title: TextFormField(
    initialValue: task.description,
    onChanged: (text) {
    Plan currentPlan = planNotifier.value;
    planNotifier.value = Plan(
    name: currentPlan.name,
    tasks: List<Task>.from(currentPlan.tasks)
    ..[index] = Task(
    description: text,
    complete: task.complete,
    ),
    );
    },
    ),
    );
  }

  }




// ----------------------------------------
// 📘 Penjelasan Super Lengkap (Pelajaran) (By GPT)
// ----------------------------------------


//// ---------------------------------------------
// // 📌 Penjelasan tambahan: late ScrollController
// // ---------------------------------------------
// // 🧠 Apa itu ScrollController?
// // ScrollController adalah objek yang bisa kita gunakan untuk:
// //  - Mengatur atau mendeteksi pergerakan scroll pada ListView, SingleChildScrollView, dsb.
// //  - Melakukan aksi tertentu saat user scroll (contoh: menyembunyikan keyboard)
//
// // 🧑‍🏫 Kenapa pakai `late`?
// // Keyword `late` artinya variabel ini **akan diinisialisasi nanti**, bukan langsung saat deklarasi.
// // Karena kita menginisialisasi scrollController di dalam `initState()` (bukan langsung),
// // maka kita harus beri tahu Dart: "Tenang, variabel ini bakal diisi sebelum digunakan" -> dan itu pakai `late`
//
// // ✅ Kesimpulan:
// // - Kita butuh `ScrollController` untuk mendeteksi scroll dan menutup keyboard otomatis
// // - Kita pakai `late` karena baru akan menginisialisasi-nya di `initState()`
//
// late ScrollController scrollController;

// 💡 Apa itu PlanScreen dan _PlanScreenState?
// PlanScreen adalah StatefulWidget -> artinya widget ini punya state yang bisa berubah.
// _PlanScreenState adalah class yang menyimpan semua logika & UI dari PlanScreen.
// Di Flutter, UI dibangun ulang setiap kali state berubah. Maka kita gunakan setState() untuk memberi tahu Flutter agar rebuild UI-nya.

// 🧠 Apa yang dilakukan oleh PlanScreen?
// 1. Menampilkan AppBar dengan judul "Master Plan Namaku"
// 2. Menampilkan semua task dalam bentuk list (dengan checkbox & kolom teks)
// 3. Memungkinkan pengguna:
//    - Menambah task baru (dengan tombol "+")
//    - Mengubah deskripsi task (dengan mengetik di kolom teks)
//    - Menandai task selesai atau belum (dengan mencentang checkbox)
//    - Menutup keyboard otomatis saat scroll (ScrollController + FocusScope)

// 🔄 Penjelasan Alur:
// • Plan plan = const Plan(); -> Membuat objek Plan kosong (tidak punya task, tidak punya nama)
// • scrollController = ScrollController(); -> Controller untuk mendeteksi scroll
// • initState() -> Inisialisasi scrollController dan tambahkan listener untuk menutup keyboard saat scroll
// • dispose() -> Membersihkan scrollController saat widget dihapus
// • _buildList() -> Membuat ListView untuk menampilkan semua task di plan.tasks
// • _buildAddTaskButton() -> Membuat FloatingActionButton untuk menambah task baru
//   - Saat ditekan, akan menyalin isi list task lama lalu menambahkan Task() baru
//   - Karena plan adalah final, kita tidak bisa ubah langsung -> jadi kita buat objek Plan baru
// • _buildTaskTile() -> Untuk setiap Task ditampilkan:
//   - Checkbox: untuk menandai task sudah selesai
//   - TextFormField: untuk mengisi/ubah deskripsi
//   - Jika terjadi perubahan: kita buat Plan baru dan update task di posisi index yang sama

// 🧱 Struktur Data yang Digunakan:
// class Plan {
//   final String name;
//   final List<Task> tasks;
// }
// class Task {
//   final String description;
//   final bool complete;
// }
// Plan = daftar kerja besar, Task = item kerja dalam Plan tersebut

// 🧪 Contoh Penggunaan:
// Jika user tekan tombol + dua kali dan isi:
//   Task 1: "Belajar Flutter", Task 2: "Buat UI"
// Maka isi plan.tasks menjadi:
// [
//   Task(description: "Belajar Flutter", complete: false),
//   Task(description: "Buat UI", complete: false)
// ]

// ✨ Tips Belajar Tambahan:
// - final = variabel tidak bisa diganti objeknya (tapi isi objek bisa diubah kalau bukan const)
// - const = objeknya benar-benar tidak bisa diubah
// - .. = cascade operator (memanggil method langsung dari objek hasil return sebelumnya)
// - List<Task>.from() = digunakan untuk menyalin isi list agar bisa dimodifikasi
// - setState() = dipanggil setiap kali kita ingin UI dibangun ulang berdasarkan perubahan data
// - ScrollController = digunakan untuk mengontrol dan mendeteksi scroll di ListView
// - FocusScope.of(context).requestFocus(FocusNode()) = digunakan untuk menyembunyikan keyboard (mengalihkan fokus)
// - initState() = fungsi pertama yang dipanggil saat State dibuat. Cocok untuk inisialisasi awal seperti controller
// - dispose() = fungsi terakhir saat State dihapus. Digunakan untuk membersihkan resource seperti controller

// ✅ Ringkasan Fungsi:
// - PlanScreen = tampilan halaman utama
// - _buildList() = membangun list dari task
// - _buildAddTaskButton() = tombol tambah task
// - _buildTaskTile() = membangun satu baris item task (checkbox + kolom teks)
// - initState() = inisialisasi ScrollController & auto-close keyboard saat scroll
// - dispose() = hapus ScrollController saat widget dibuang
