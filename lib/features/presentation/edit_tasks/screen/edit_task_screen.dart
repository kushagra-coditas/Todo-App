import 'package:todo_app/features/presentation/bloc/to_do_bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/presentation/widgets/edit_tasks_body_widget.dart';
import 'package:todo_app/features/presentation/widgets/task_tile_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTasks extends StatelessWidget {
  final Task task;
  final int index;

  const EditTasks({
    super.key,
    required this.task,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: task.taskTitle);
    final descriptionController =
        TextEditingController(text: task.taskDescription);
    final dueDateController =
        TextEditingController(text: task.taskDueDate);

    void saveEditedTask() {
      final updatedTask = Task(
        taskTitle: titleController.text.trim(),
        taskDueDate: dueDateController.text.trim(),
        taskDescription: descriptionController.text.trim(),
      );

      context.read<TodoBloc>().add(
            SaveTaskEvent(task: updatedTask, index: index),
          );
      Navigator.pop(context);
    }
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Edit Task')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: EditTasksBody(
          titleController: titleController,
          descriptionController: descriptionController,
          dueDateController: dueDateController,
          onSave: saveEditedTask,
        ),
      ),
    );
  }
}