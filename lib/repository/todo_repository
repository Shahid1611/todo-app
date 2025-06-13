abstract class TodoRepository {
  Future<List<String>> fetchTodos();
  Future<void> addTodo(String item);
  Future<void> deleteTodo(String item);
}

class TodoRepositoryImpl implements TodoRepository {
  List<String> _todos = [];

  @override
  Future<List<String>> fetchTodos() async => _todos;

  @override
  Future<void> addTodo(String item) async {
    _todos.add(item);
  }

  @override
  Future<void> deleteTodo(String item) async {
    _todos.remove(item);
  }
}
