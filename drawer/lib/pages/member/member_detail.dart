import 'package:drawer/model/member.dart';
import 'package:flutter/material.dart';

class MemberDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Member member = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text('Member Detail')),
      body: Center(
          child: Container(
              child: Column(children: <Widget>[
        Container(
          child: Center(
              child: Text(member.name,
                  style: TextStyle(
                      color: Color.fromRGBO(23, 34, 59, 1), fontSize: 80))),
          height: 300,
          color: Color.fromRGBO(138, 198, 209, 1),
        ),
        Container(
          child: FlatButton(
            child: Text(
              'POP',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Color.fromRGBO(38, 56, 89, 1),
            textColor: Colors.black,
          ),
          padding: EdgeInsets.zero,
          width: double.infinity,
          height: 60,
        )
      ]))),
    );
  }
}
