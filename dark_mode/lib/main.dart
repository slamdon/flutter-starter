import 'package:flutter/material.dart';
import 'package:dark_mode/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData currentTheme;
  String title = "DARK";

  final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      accentColor: Colors.white,
      primaryColor: Colors.blue,
      iconTheme: IconThemeData(color: Colors.grey),
      textTheme:
          TextTheme(body1: TextStyle(color: Color.fromRGBO(32, 73, 105, 1))));

  final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      accentColor: Colors.black,
      primaryColor: Colors.cyan,
      iconTheme: IconThemeData(color: Colors.blue),
      textTheme: TextTheme(body1: TextStyle(color: Colors.red)));

  @override
  void initState() {
    currentTheme = lightTheme;
    super.initState();
  }

  listTapHandler(int index) {
    setState(() {
      switch (index) {
        case 0:
          {
            title = "DARK";
            currentTheme = darkTheme;
          }
          break;
        case 1:
          {
            title = "LIGHT";
            currentTheme = lightTheme;
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: currentTheme,
        home: Scaffold(
          appBar: AppBar(title: Text(title)),
          body: HomePage(),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Center(
                    child: Text('Dark Mode',
                        style: TextStyle(
                            fontSize: 30,
                            color: currentTheme.primaryTextTheme.body1.color)),
                  ),
                  decoration:
                      BoxDecoration(color: currentTheme.textTheme.body1.color),
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
        ));
  }
}
