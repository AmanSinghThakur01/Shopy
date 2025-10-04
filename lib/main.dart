

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter To Do App',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Appbody(),
    );
  }
}
class Appbody extends StatefulWidget {
  const Appbody({super.key});

  @override
  State<Appbody> createState() => _AppbodyState();
}

class _AppbodyState extends State<Appbody> {
  TextEditingController controller = TextEditingController();
  List tasks = [];
  void Addtask (){
    if (controller.text.isNotEmpty)
    {
      setState(() {
        tasks.add(controller.text);
        controller.clear();
      });
    }
  }
  void deletetask (int index){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Alert"),
        content: Text(" Are  you sure want to delete this task "),
        actions: [
          TextButton(onPressed: (){Navigator.pop(context);}, child: Text(" Cancel")),
          TextButton(onPressed: (){
            setState(() {
              tasks.removeAt(index);
            });
            Navigator.pop(context);}, child: Text(" Delete",style: TextStyle(color: Colors.red),)),
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" To Do App "),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: ' Enter a Task ',
                        fillColor: Colors.tealAccent,
                      ),
                      onSubmitted: (value){Addtask();
                      },
                    ),
                  ),
                ),
                ElevatedButton(onPressed: Addtask, child: Text("Add To Task"),),
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context , index){return
                    ListTile(
                      title: Text(tasks[index]),
                      trailing: IconButton(onPressed: ()=> deletetask(index), icon: Icon(Icons.delete,color: Colors.red,)),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
