import 'package:flutter/material.dart';
import 'package:todo/TodoItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppExample();
  }
}

class MyAppExample extends StatelessWidget {
  static const String title = "Flutter Demo";

  final List<TodoItem> items = List<TodoItem>.generate(
    1000,
    (i) => i % 6 == 0
        ? TodoItemStyle('Todo Item Head $i')
        : TodoItemContent('Todo Item Body $i', 'Message body $i'),
  );

  MyAppExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
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
