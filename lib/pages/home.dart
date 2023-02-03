import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _todoUser;
  List todoList = [];

  @override
  void initState() {
    super.initState();

    todoList.addAll([
      "Сидеть на стене",
      "Свалиться во сне",
      "Не мочь Шалтая-Болтая собрать"
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Список дел'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todoList[index]),
              child: Card(
                child: ListTile(
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete_outline,
                      color: Colors.blue,
                    ), onPressed: () {
                    setState(() {
                      todoList.removeAt(index);
                    });
                  },
                  ),
                  title: Text(todoList[index]),
                ),
              ),
              onDismissed: (direction) {
                //if(direction == DismissDirection.startToEnd)
                setState(() {
                  todoList.removeAt(index);
                });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Add new"),
                content: TextField(
                    onChanged: (String value) {
                      _todoUser = value;
                    },
                ),
                actions: [
                  ElevatedButton(onPressed: () {
                    setState(() {
                      todoList.add(_todoUser);
                    });
                    _todoUser = "";
                    Navigator.of(context).pop();
                  }, child: Text("Add"))
                ],
              );
          });
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
