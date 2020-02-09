import 'package:drawer/pages/member/member_page.dart';
import 'package:flutter/material.dart';
import 'package:drawer/pages/home_page.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String title = "Home";
  Widget currentPage = HomePage();

  menuTapHandler(int index) {
    setState(() {
      switch (index) {
        case 0:
          {
            title = "Home";
            currentPage = HomePage();
          }
          break;
        case 1:
          {
            title = "Members";
            currentPage = MemberPage();
          }
          break;
      }

      // hide menu
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: currentPage,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image(
                  image: AssetImage('assets/banner.png'), fit: BoxFit.cover),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              padding: EdgeInsets.zero,
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                menuTapHandler(0);
              },
            ),
            ListTile(
              title: Text('Member'),
              onTap: () {
                menuTapHandler(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
