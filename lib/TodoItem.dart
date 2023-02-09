import 'package:flutter/material.dart';

abstract class TodoItem {
  Widget buildTitle(BuildContext context);

  Widget buildSubtitle(BuildContext context);
}

class TodoItemHead implements TodoItem {
  final String heading;

  TodoItemHead(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

class TodoItemBody implements TodoItem {
  final String sender;
  final String body;

  TodoItemBody(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(
        sender,
        textAlign: TextAlign.center,
      );

  @override
  Widget buildSubtitle(BuildContext context) => Text(
        body,
        textAlign: TextAlign.center,
      );
}
