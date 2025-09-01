import 'package:todo_app/core/constants/string_constants.dart';
import 'package:todo_app/features/presentation/bloc/to_do_bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/presentation/widgets/add_tasks_body_widget.dart';
import 'package:todo_app/features/presentation/widgets/task_tile_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTasks extends StatefulWidget {
  const AddTasks({super.key});

  @override
  State<AddTasks> createState() => AddTasksState();
}

class AddTasksState extends State<AddTasks> {
  final titleController = TextEditingController();
  final dueDateController = TextEditingController();
  final descriptionController = TextEditingController();

  void saveTask() {
    final title = titleController.text.trim();
    final dueDate = dueDateController.text.trim();
    final description = descriptionController.text.trim();

    if (title.isNotEmpty && dueDate.isNotEmpty && description.isNotEmpty) {
      final newTask = Task(
        taskTitle: title,
        taskDueDate: dueDate,
        taskDescription: description,
      );

      context.read<TodoBloc>().add(SaveTaskEvent(task: newTask));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text(AddTaskScreenConstants.appBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AddTasksBody(
          titleController: titleController,
          descriptionController: descriptionController,
          dueDateController: dueDateController,
          onSave: saveTask,
        ),
      ),
    );
  }
}