import 'package:flutter/material.dart';

class event1Page extends StatefulWidget{
  @override
  _event1PageState createState() => new _event1PageState();
}

class _event1PageState extends State<event1Page>{
  @override
  Widget build(BuildContext context){
    return new Row(
      children: <Widget>[
        new Text("Work!!"),
      ],
    );
  }
}