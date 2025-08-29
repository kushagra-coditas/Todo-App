part of 'to_do_bloc.dart';

@immutable

class TodoState {
  final List<Task> tasks;

  const TodoState({required this.tasks});
}
