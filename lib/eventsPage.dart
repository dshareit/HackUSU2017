import 'package:flutter/material.dart';

class eventsPage extends StatefulWidget{
  @override
  _eventsPageState createState() => new _eventsPageState();
}

class _eventsPageState extends State<eventsPage>{
  @override
  Widget build(BuildContext context){
    return new Row(
      children: <Widget>[
        new Text("what"),
//        new Expanded(
//          child: new ListView.builder(
//            itemBuilder: (context, index) => new ResultCard(resultList[index]),
//            itemCount: resultList.length,
//            padding: new EdgeInsets.symmetric(vertical: 16.0),
//          ),
//        ),
      ],
    );
  }
}

