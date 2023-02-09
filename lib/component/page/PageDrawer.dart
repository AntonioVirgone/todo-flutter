import 'package:flutter/material.dart';

import 'TodoItem.dart';

abstract class PageDrawer {
  Widget build(BuildContext context);
}

class PageDrawerImpl implements PageDrawer {
  final List<TodoItem> items = List<TodoItem>.generate(
    1000,
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