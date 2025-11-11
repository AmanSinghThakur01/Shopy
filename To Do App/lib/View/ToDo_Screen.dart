import 'package:flutter/material.dart';
import 'package:to_do_app/Provider/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<ToDoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text(
          " || TO DO App ||",
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.task, color: Colors.teal),
                      hintText: 'Enter a task',
                    ),
                    onSubmitted: (value) {
                      if (value.trim().isNotEmpty) {
                        todoProvider.addToDo(value.trim());
                        _controller.clear();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            content: Row(
                              children: [
                                Icon(Icons.done, color: Colors.white,),
                                Text(
                                  'Task added successfully!',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            duration: Duration(seconds: 1),
                          ),
                        );

                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter a task before adding!'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () {
                      if (_controller.text.trim().isNotEmpty) {
                        todoProvider.addToDo(_controller.text.trim());
                        _controller.clear();

                        ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                             backgroundColor: Colors.green,
                            content: Text('Task added successfully!'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.redAccent, // 👈 change color here
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            content: const Text(
                              'Please enter a task before adding!',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: todoProvider.todos.length,
                itemBuilder: (context, index) {
                  final task = todoProvider.todos[index];
                  return Container(
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.teal.shade100,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          task,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        trailing: IconButton(
                          onPressed: () => todoProvider.removeTodo(index),
                          icon: Icon(Icons.delete_outline,
                              color: Colors.red[700]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
