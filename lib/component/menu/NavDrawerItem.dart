import 'package:flutter/material.dart';

class NavDrawerItem {
  final String title;
  final IconData icon;
  final StatelessWidget page;

  NavDrawerItem(this.title, this.icon, this.page);

  Widget buildItem(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
