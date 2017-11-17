import 'package:flutter/material.dart';


class FirstPage extends StatefulWidget {

  @override
  _FirstPageState createState() => new _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new Text("FirstPage"),
      ],
    );
  }
}