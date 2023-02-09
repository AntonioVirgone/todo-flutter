import 'package:flutter/material.dart';
import 'package:todo/component/menu/NavDrawer.dart';
import 'package:todo/component/page/PageDrawer.dart';
import 'package:todo/component/page/TodoItem.dart';

void main() {
  runApp(const MaterialApp(home: MyApp(),));
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
        ? TodoItemHead('Todo Item Head $i')
        : TodoItemBody('Todo Item Body $i', 'Message body $i'),
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
        body: PageDrawerImpl(items).buildPage(context),
        drawer: Drawer(
          child: NavDrawerImpl('Antonio', 'test@mail.com').buildItems(context),
        ),
      ),
    );
  }
}
