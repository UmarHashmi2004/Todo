import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_project/data/datasource/task_repository_provider.dart';
import 'package:todo_app_project/data/repositories/task_repositories.dart';
import 'package:todo_app_project/data/repositories/task_repositories_impl.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final datasource = ref.read(taskDatasourceProvider);
  return TaskRepositoryImpl(datasource);
});
