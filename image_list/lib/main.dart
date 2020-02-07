import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Image List';

    final images = [
      "mountain-1.png",
      "mountain-2.png",
      "mountain-3.png",
      "mountain-4.png",
      "mountain-5.png"
    ];

    return MaterialApp(
        title: title,
        home: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: ListView(
              children: List.generate(images.length, (index) {
                return Column(
                  children: <Widget>[
                    Container(
                      height: 300,
                      child: Image(
                        image: AssetImage('assets/' + images[index]),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      child: Center(
                          child: Text(images[index],
                              style: TextStyle(fontSize: 20))),
                      height: 50,
                      decoration: BoxDecoration(color: Colors.amber),
                    )
                  ],
                );
              }),
            )));
  }
}
