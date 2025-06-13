import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repository/abstract_todo_repository.dart';
import '../state/todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository repo;

  TodoCubit(this.repo) : super(const TodoInitial());

  void loadTodos() async {
    emit(const TodoLoading());
    final todos = await repo.fetchTodos();
    emit(TodoLoaded(todos));
  }

  void addTodo(String item) async {
    await repo.addTodo(item);
    loadTodos();
  }

  void deleteTodo(String item) async {
    await repo.deleteTodo(item);
    loadTodos();
  }
}

