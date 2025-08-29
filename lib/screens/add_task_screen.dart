import 'package:todo_app/bloc/to_do_bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/all_tasks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTasks extends StatefulWidget {
  const AddTasks({super.key});
  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  final titleController = TextEditingController();
  final dueDateController = TextEditingController();
  final descriptionController = TextEditingController();

  @override

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
      appBar: AppBar(centerTitle: true, title: Text('New Task')),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title('Task Name'),
          textField(titleController, padding: 5),
          SizedBox(height: 15),
          title('Description'),
          textField(descriptionController, padding: 75),
          SizedBox(height: 15),
          title('Due Date'),
          textField(dueDateController, padding: 15),
        ],
      ),

      floatingActionButton: SizedBox(
        height: 40,
        width: 360,
        child: FloatingActionButton(
          onPressed: saveTask,
          backgroundColor: const Color.fromARGB(255, 70, 133, 241),
          child: Text(
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
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
    ),
  );

  Widget textField(
    TextEditingController? controller, {
    required double padding,
  }) {
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
