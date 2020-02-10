import 'package:dark_mode/pages/home_page.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String title = "Home";

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: HomePage(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text('Menu'),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text("Dark", style: TextStyle(fontSize: 20)),
              onTap: () {
                listTapHandler(0);
              },
            ),
            ListTile(
              title: Text("Light", style: TextStyle(fontSize: 20)),
              onTap: () {
                listTapHandler(1);
              },
            ),
          ],
        ),
      ),
    );
  }

  listTapHandler(int index) {
    setState(() {
      switch (index) {
        case 0:
          {
            title = "DARK";
          }
          break;
        case 1:
          {
            title = "LIGHT";
          }
          break;
      }
      Navigator.pop(context);
    });
  }
}
