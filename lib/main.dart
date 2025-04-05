import 'package:flutter/material.dart';
import 'models/data_layer.dart';
import 'provider/plan_provider.dart';
import 'views/plan_creator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ValueNotifier<List<Plan>> planNotifier = ValueNotifier<List<Plan>>([]);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      notifier: planNotifier,
      child: MaterialApp(
        title: 'Plan Manager',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          useMaterial3: true,
        ),
        home: const PlanCreatorScreen(), // halaman awal
      ),
    );
  }
}