import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_project/config/routes/route_location.dart';
import 'package:todo_app_project/data/data.dart';
import 'package:todo_app_project/utils/utils.dart';
import 'package:todo_app_project/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayWhiteText(
                      text: '29 October 2023',
                      fontWeight: FontWeight.bold,
                      size: 20,
                    ),
                    Gap(20),
                    DisplayWhiteText(
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
                    const DisplayListOfTasks(
                      tasks: [
                        Task(
                            title: "title",
                            note: "note",
                            time: "10:12",
                            date: "August 14 2023",
                            isCompleted: false,
                            category: TaskCategory.shopping),
                        Task(
                            title: "title 2 ",
                            note: "note",
                            time: "13:12",
                            date: "August 14 2023",
                            isCompleted: false,
                            category: TaskCategory.education),
                      ],
                    ),
                    const Gap(20),
                    const Text(
                      'completed',
                    ),
                    const Gap(20),
                    const DisplayListOfTasks(
                      tasks: [
                        Task(
                            title: "title",
                            note: "",
                            time: "10:12",
                            date: "August 14 2023",
                            isCompleted: true,
                            category: TaskCategory.personal),
                        Task(
                            title: "title 2 ",
                            note: "note",
                            time: "13:12",
                            date: "August 14 2023",
                            isCompleted: true,
                            category: TaskCategory.work)
                      ],
                      isCompletedTasks: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () => context.push(RouteLocation.createTask),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DisplayWhiteText(text: "Add new Text"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
