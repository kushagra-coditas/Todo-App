import 'package:todo_app/features/presentation/bloc/to_do_bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/presentation/add_tasks/screen/add_task_screen.dart';
import 'package:todo_app/features/presentation/edit_tasks/screen/edit_task_screen.dart';
import 'package:todo_app/features/presentation/widgets/task_tile_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Tasks'),

          actions: [
            IconButton(
              onPressed: () async {
                final Task? newTask = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTasks()),
                );
                if (newTask != null) {}
              },
              icon: Icon(Icons.add),
              iconSize: 32,
            ),
            SizedBox(width: 8),
          ],
        ),

        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state.tasks.isEmpty) {
              return const Center(child: Text("No tasks yet"));
            }
            return ListView.separated(
              padding: const EdgeInsets.only(right: 80),
              itemCount: state.tasks.length,
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditTasks(task: task, index: index),
                      ),
                    );
                  },
                  child: TaskTileWidget(
                    taskTitle: task.taskTitle,
                    taskDueDate: task.taskDueDate,
                  ),
                );
              },
            );
          },
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final Task? newTask = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTasks()),
            );
            if (newTask != null) {}
          },
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
