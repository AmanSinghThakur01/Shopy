

import 'package:flutter/material.dart';
import 'package:to_do_app/Provider/todo_provider.dart';
import 'package:to_do_app/View/ToDo_Screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ToDoProvider(),
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter To Do App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey.shade50,
          surface: Colors.grey.shade200,
        ),
      ),
      home: TodoScreen()
    );
  }
}
