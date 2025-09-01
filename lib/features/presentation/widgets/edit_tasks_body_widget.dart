import 'package:flutter/material.dart';
import 'package:todo_app/features/presentation/widgets/title_text_widget.dart';

import 'custom_textfield_widget.dart';

class EditTasksBody extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController dueDateController;
  final VoidCallback onSave;

  const EditTasksBody({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.dueDateController,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(text: 'Task Name',),
        CustomTextField(controller: titleController, padding: 5),
        SizedBox(height: 15),
        TitleText(text: 'Description'),
        CustomTextField(controller: descriptionController, padding: 75),
        SizedBox(height: 15),
        TitleText(text: 'Due Date'),
        CustomTextField(controller: dueDateController, padding: 15),
        SizedBox(height: 20),
        SizedBox(
          height: 40,
          width: double.infinity,
          child: FloatingActionButton(
            onPressed: onSave,
            backgroundColor:  Color.fromARGB(255, 70, 133, 241),
            child: Text(
              'Save Task',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
