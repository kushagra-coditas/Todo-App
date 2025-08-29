import 'package:todo_app/all_tasks.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(tasks: [])) {
    on<AddTaskEvent>((event, emit) {
      final updatedList = List.of(state.tasks)..add(event.task);
      emit(TodoState(tasks: updatedList));
    });
    on<EditTaskEvent>((event, emit) {
      final updatedList = List.of(state.tasks);
      updatedList[event.index] = event.updatedTask;
      emit(TodoState(tasks: updatedList));
    });
    on<SaveTaskEvent>((event, emit) {
      final updatedTasks = List<Task>.from(state.tasks)..add(event.task);
      emit(TodoState(tasks: updatedTasks));
    });
  }
}
