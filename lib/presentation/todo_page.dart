import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/todo_cubit.dart';
import '../../logic/state/todo_state.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text('MyTasks'),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 6,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(todo),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_forever_outlined),
                      onPressed: () =>
                          context.read<TodoCubit>().deleteTodo(todo),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No todos yet!'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: const Text('Add Task'),
                    content: TextField(
                      controller: controller,
                      decoration:
                          const InputDecoration(hintText: 'Enter todo'),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          context.read<TodoCubit>().addTodo(controller.text);
                          controller.clear();
                          Navigator.pop(context);
                        },
                        child: const Text("Add"),
                      )
                    ],
                  ));
        },
      ),
    );
  }
}
