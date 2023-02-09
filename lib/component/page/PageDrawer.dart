import 'package:flutter/material.dart';

import 'TodoItem.dart';

abstract class PageDrawer {
  Widget buildPage(BuildContext context);
}

class PageDrawerImpl implements PageDrawer {
  final List<TodoItem> items;

  PageDrawerImpl(this.items);

  @override
  Widget buildPage(BuildContext context) {
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