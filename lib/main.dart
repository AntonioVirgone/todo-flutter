import 'package:flutter/material.dart';
import 'package:todo/TodoItem.dart';

void main() {
  final items = List<TodoItem>.generate(
    1000,
    (i) => i % 6 == 0
        ? TodoItemStyle('Todo Item Head $i')
        : TodoItemContent('Todo Item Body $i', 'Message body $i'),
  );

  runApp(MyApp(
    items: items,
  ));
}

class MyApp extends StatelessWidget {
  final List<TodoItem> items;

  const MyApp({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ciao"),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            );
          },
        ),
      ),
    );
  }
}
