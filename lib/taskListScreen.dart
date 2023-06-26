import 'package:flutter/material.dart';
import 'components.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController date = TextEditingController();

  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFE8E8E9),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Task Management'),
      ),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              onLongPress: () => _deleteBottomSheet(context, index),
              title: Text(
                tasks[index].title,
                style: bodyTxtTitle(),
              ),
              subtitle: Text(tasks[index].description),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addTaskDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  ///Show Dialog
  void addTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: title,
                decoration: const InputDecoration(
                    label: Text('Title'), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextFormField(
                maxLines: 4,
                controller: description,
                decoration: const InputDecoration(
                    label: Text('Description'), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: date,
                decoration: const InputDecoration(
                    label: Text('Days required'), border: OutlineInputBorder()),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  if (title.text.trim().isNotEmpty &&
                      description.text.trim().isNotEmpty &&
                      date.text.trim().isNotEmpty) {
                    tasks.add(Task(title.text, description.text, date.text));
                  }
                  if (mounted) {
                    setState(() {});
                    title.clear();
                    description.clear();
                    date.clear();
                  }
                  Navigator.pop(context);
                },
                child: const Text('Save'))
          ],
        );
      },
    );
  }

  void _deleteBottomSheet(BuildContext context, int index) {
    showBottomSheet(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Delete Task',
                  style: bottomSheetHeadingTitle(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Title: ${tasks[index].title}", style: bottomSheetTitle(),),
                const SizedBox(
                  height: 10,
                ),
                Text("Description: ${tasks[index].description}"),
                const SizedBox(
                  height: 10,
                ),
                Text("Days: ${tasks[index].date}", style: bottomSheetDate(),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          tasks.removeAt(index);
                        });
                      },
                      child: const Text('Delete'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {});
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
