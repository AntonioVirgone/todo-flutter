import 'package:flutter/material.dart';
import 'package:todo/component/menu/NavDrawerItem.dart';
import 'package:todo/route/PageRoute.dart';

abstract class NavDrawer {
  Widget buildHeader(BuildContext context);

  Widget buildItems(BuildContext context);
}

class NavDrawerImpl implements NavDrawer {
  final String username;
  final String email;

  NavDrawerImpl(this.username, this.email);

  @override
  Widget buildHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(username),
      accountEmail: Text(email),
      currentAccountPicture: const CircleAvatar(
        child: FlutterLogo(size: 42.0),
      ),
    );
  }

  @override
  Widget buildItems(BuildContext context) {
    return ListView(
      children: [
        buildHeader(context),
        NavDrawerItem("PageOne", Icons.favorite, const FirstRoute()).buildItem(context),
        NavDrawerItem("PageTwo", Icons.comment, const SecondRoute()).buildItem(context),
        NavDrawerItem("PageTree", Icons.account_tree, const FirstRoute()).buildItem(context),
        NavDrawerItem("PageFour", Icons.add_card, const SecondRoute()).buildItem(context),
      ],
    );
  }
}
