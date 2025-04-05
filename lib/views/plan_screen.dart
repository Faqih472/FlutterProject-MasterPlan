import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          final currentPlan = plans.firstWhere((p) => p.name == widget.plan.name);
          return Column(
            children: [
              Expanded(child: _buildList(currentPlan, plansNotifier)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    final plansNotifier = PlanProvider.of(context);
    final currentPlan = plansNotifier.value.firstWhere((p) => p.name == widget.plan.name);
    final planIndex = plansNotifier.value.indexOf(currentPlan);

    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        final updatedTasks = List<Task>.from(currentPlan.tasks)..add(const Task());
        plansNotifier.value = List<Plan>.from(plansNotifier.value)
          ..[planIndex] = Plan(name: currentPlan.name, tasks: updatedTasks);
      },
    );
  }

  Widget _buildList(Plan plan, ValueNotifier<List<Plan>> plansNotifier) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) {
        return _buildTaskTile(plan, plan.tasks[index], index, plansNotifier);
      },
    );
  }

  Widget _buildTaskTile(
      Plan currentPlan,
      Task task,
      int index,
      ValueNotifier<List<Plan>> plansNotifier,
      ) {
    final planIndex = plansNotifier.value.indexWhere((p) => p.name == currentPlan.name);

    final controller = TextEditingController(text: task.description);
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          final updatedTasks = List<Task>.from(currentPlan.tasks)
            ..[index] = Task(
              description: controller.text,
              complete: selected ?? false,
            );
          plansNotifier.value = List<Plan>.from(plansNotifier.value)
            ..[planIndex] = Plan(name: currentPlan.name, tasks: updatedTasks);
        },
      ),
      title: TextField(
        controller: controller,
        onChanged: (text) {
          final updatedTasks = List<Task>.from(currentPlan.tasks)
            ..[index] = Task(description: text, complete: task.complete);
          plansNotifier.value = List<Plan>.from(plansNotifier.value)
            ..[planIndex] = Plan(name: currentPlan.name, tasks: updatedTasks);
        },
      ),
    );
  }

}