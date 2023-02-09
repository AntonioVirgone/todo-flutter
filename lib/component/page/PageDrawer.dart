import 'package:flutter/material.dart';

import 'TodoItem.dart';

class PageDrawer {
  Widget build(BuildContext context) {
    return PageDrawerImpl().build(context);
  }
}

class PageDrawerImpl {
  final List<TodoItem> items = List<TodoItem>.generate(
    100,
        (i) => i % 6 == 0
        ? TodoItemHead('Todo Item Head $i')
        : TodoItemBody('Todo Item Body $i', 'Message body $i'),
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: item.buildTitle(context),
          subtitle: item.buildSubtitle(context),
        );
      },
    );
  }

}