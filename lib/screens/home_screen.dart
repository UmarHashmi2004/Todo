// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_project/config/routes/route_location.dart';
import 'package:todo_app_project/providers/providers.dart';
import 'package:todo_app_project/utils/utils.dart';
import 'package:todo_app_project/widgets/widgets.dart';
import '../data/models/task.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final TaskState = ref.watch(tasksProvider);
    final inCompletedTasks = _incompletedTask(TaskState.tasks, ref);
    final completedTasks = _compltedTask(TaskState.tasks, ref);
    final selectedDate = ref.watch(dateProvider);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Helpers.selectDate(context, ref),
                      child: DisplayWhiteText(
                        text: DateFormat.yMMMd().format(selectedDate),
                        fontWeight: FontWeight.bold,
                        size: 20,
                      ),
                    ),
                    const Gap(20),
                    const DisplayWhiteText(
                      text: 'My Todo List',
                      fontWeight: FontWeight.bold,
                      size: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 180,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListOfTasks(
                      tasks: inCompletedTasks,
                    ),
                    const Gap(20),
                    const Text(
                      'completed',
                    ),
                    const Gap(20),
                    DisplayListOfTasks(
                      tasks: completedTasks,
                      isCompletedTasks: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () => context.push(RouteLocation.createTask),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DisplayWhiteText(text: "Add new Text"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Task> _compltedTask(List<Task> tasks, WidgetRef ref) {
    final List<Task> filteredTask = [];
    final date = ref.watch(dateProvider);

    for (var task in tasks) {
      final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
      if (task.isCompleted && isTaskDay) {
        filteredTask.add(task);
      }
    }
    return filteredTask;
  }

  List<Task> _incompletedTask(List<Task> tasks, WidgetRef ref) {
    final List<Task> filteredTask = [];
    final date = ref.watch(dateProvider);

    for (var task in tasks) {
      final isTaskDay =
          Helpers.isTaskFromSelectedDate(task, date); // Define isTaskDay here
      if (!task.isCompleted && isTaskDay) {
        // Now you can use isTaskDay
        filteredTask.add(task);
      }
    }
    return filteredTask;
  }
}
