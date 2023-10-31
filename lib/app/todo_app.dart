import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_project/config/config.dart';
import 'package:todo_app_project/config/routes/routes.dart';

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RouterConfig = ref.watch(routesProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: RouterConfig,
    );
  }
}
