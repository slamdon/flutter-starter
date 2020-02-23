import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/pages/home_page.dart';
import 'package:shopping/providers/cart_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider.value(
        value: CartProvider(),
        child: HomePage(),
      ),
    );
  }
}
