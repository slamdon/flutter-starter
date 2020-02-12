import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode node1 = FocusNode();
  final FocusNode node2 = FocusNode();
  final FocusNode node3 = FocusNode();
  final FocusNode node4 = FocusNode();

  final TextEditingController node1Controller = TextEditingController();
  final TextEditingController node2Controller = TextEditingController();
  final TextEditingController node3Controller = TextEditingController();
  final TextEditingController node4Controller = TextEditingController();

  TextField _generateRoundTextField(
      focusNode, previousFocusNode, nextFocusNode, controller) {
    return TextField(
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        textAlign: TextAlign.center,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        controller: controller,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        onChanged: (text) {
          if (text.length != 0) {
            // when input new text, make next TextField get focus
            FocusScope.of(context).requestFocus(nextFocusNode);
          } else {
            // when remove text from TextField, make previous TextField get focus
            FocusScope.of(context).requestFocus(previousFocusNode);
          }

          if (nextFocusNode == null) {
            // when input the last TextField, hide keyboard
            FocusScope.of(context).unfocus();
          }
        },
        focusNode: focusNode);
  }

  _showAlertDialog(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          appBar: AppBar(title: Text("SMS CODE")),
          body: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: _generateRoundTextField(
                            node1, null, node2, node1Controller),
                        width: 60,
                        height: 60,
                      ),
                      Container(
                        child: _generateRoundTextField(
                            node2, node1, node3, node2Controller),
                        width: 60,
                        height: 60,
                      ),
                      Container(
                        child: _generateRoundTextField(
                            node3, node2, node4, node3Controller),
                        width: 60,
                        height: 60,
                      ),
                      Container(
                        child: _generateRoundTextField(
                            node4, node3, null, node4Controller),
                        width: 60,
                        height: 60,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: FlatButton(
                          child: Text("OK"),
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                            String code = node1Controller.text +
                                node2Controller.text +
                                node3Controller.text +
                                node4Controller.text;
                            _showAlertDialog("SMS CODE", code);
                          },
                        ),
                        width: 240,
                        height: 44,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ))
            ],
          )),
      onTap: () {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
