import 'package:flutter/material.dart';

class Task {
  final String taskTitle;
  final String taskDescription;
  final String taskDueDate;

  Task({
    required this.taskTitle,
    required this.taskDueDate,
    required this.taskDescription,
  });
}

class TaskTileWidget extends StatelessWidget {
  const TaskTileWidget({
    super.key,
    required this.taskTitle,
  
    required this.taskDueDate,
  });

  final String taskTitle;
  
  final String taskDueDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(width: 16),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromARGB(160, 176, 175, 175),
          ),
          child: Icon(Icons.drag_handle, size: 40),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskTitle,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            
            Text(
              taskDueDate,
              style: TextStyle(color: Color.fromARGB(185, 7, 4, 4)),
            ),
          ],
        ),
      ],
    );
  }
}
