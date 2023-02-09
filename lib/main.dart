import 'package:flutter/material.dart';
import 'package:todo/component/menu/NavDrawer.dart';
import 'package:todo/component/page/PageDrawer.dart';

void main() {
  const String title = "Flutter Demo";

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MyApp(),
    title: title,
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyAppExample();
  }
}

class MyAppExample extends StatelessWidget {
  const MyAppExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: PageDrawer().build(context),
      drawer: Drawer(
        child: NavDrawerImpl('Antonio', 'test@mail.com').build(context),
      ),
    );
  }
}
