part of 'to_do_bloc.dart';

@immutable
abstract class TodoEvent {}

class AddTaskEvent extends TodoEvent {
  final Task task;

  AddTaskEvent({required this.task});
}

class EditTaskEvent extends TodoEvent {
  final int index;
  final Task updatedTask;

  EditTaskEvent({required this.index, required this.updatedTask});
}

class SaveTaskEvent extends TodoEvent {
  final Task task;
  final int? index;
  
  SaveTaskEvent({required this.task, this.index});
}