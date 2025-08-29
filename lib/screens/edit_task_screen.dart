import 'package:todo_app/bloc/to_do_bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/all_tasks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTasks extends StatelessWidget {
  final Task task;
  final int index;
  const EditTasks({super.key, required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: task.taskTitle);
    final descriptionController = TextEditingController(text: task.taskDescription);
    final dueDateController = TextEditingController(text: task.taskDueDate);

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
      appBar: AppBar(centerTitle: true, title: const Text('Edit Task')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title('Task Name'),
          textField(titleController, padding: 5),
          const SizedBox(height: 15),
          title('Description'),
          textField(descriptionController, padding: 75),
          const SizedBox(height: 15),
          title('Due Date'),
          textField(dueDateController, padding: 15),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 40,
        width: 360,
        child: FloatingActionButton(
          onPressed: saveEditedTask,
          backgroundColor: const Color.fromARGB(255, 70, 133, 241),
          child: const Text(
            'Save Task',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }

  Widget title(String text) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
    ),
  );

  Widget textField(TextEditingController controller, {required double padding}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(padding),
          filled: true,
          fillColor: const Color.fromARGB(116, 132, 167, 232),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
