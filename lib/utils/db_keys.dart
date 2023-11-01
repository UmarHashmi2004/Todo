import 'package:flutter/material.dart';
import 'package:todo_app_project/utils/utils.dart';

@immutable
class DBKeys {
  const DBKeys._();
  static const String dbName = 'Task.db';
  static const String dbTable = 'Tasks';
  static const String idcolumn = TaskKeys.id;
  static const String titlecolumn = TaskKeys.title;
  static const String notecolumn = TaskKeys.note;
  static const String timecolumn = TaskKeys.time;
  static const String datecolumn = TaskKeys.date;
  static const String categorycolumn = TaskKeys.category;
  static const String isCompletedcolumn = TaskKeys.isCompleted;
}
