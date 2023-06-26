import 'package:assignment_8/taskListScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TaskManagementApp());
}

class TaskManagementApp extends StatelessWidget {
   const TaskManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Management',
      home: TaskListScreen(),
    );
  }
}
