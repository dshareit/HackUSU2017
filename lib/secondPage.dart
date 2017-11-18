import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:hackusu2017/models.dart';

import 'package:firebase_database/firebase_database.dart';         //new 
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';

final analytics = new FirebaseAnalytics();
final auth = FirebaseAuth.instance;
final reference = FirebaseDatabase.instance.reference().child('Gifts');

var url = "https://secret-santa-86017.firebaseio.com";

class SecondPage extends StatefulWidget {

  @override
  _SecondPageState createState() => new _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  _SecondPageState();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new RefreshIndicator(
        child: new ListView.builder(itemBuilder: _itemBuilder), 
        onRefresh: _onRefresh
        ),
    );
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = new Completer<Null>();

    Timer timer = new Timer(new Duration(seconds: 3), () {completer.complete();});

    return completer.future;
  }

  Widget _itemBuilder(BuildContext context, int index){
    Todo todo =  getTodo(index);
    return new TodoItemWidget(todo: todo);
  }

  Todo getTodo(int index){
    return new Todo(false, "Todo $index");
  }
}

class TodoItemWidget extends StatefulWidget{
  TodoItemWidget({Key, key, this.todo}) : super(key: key);

  final Todo todo;

  @override
  _TodoItemWidgetState createState() => new _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget>{
  @override

  Widget build(BuildContext context){
    return new ListTile(
      title: new Text(widget.todo.name),
      subtitle: new Text("5 members"),
      onTap: _onTap,
    );
  }

  void _onTap(){
    Route route = new MaterialPageRoute(
      settings: new RouteSettings(name: "/todos/todo"),
      builder: (BuildContext context) => new TodoPage(todo: widget.todo),
      );
    Navigator.of(context).push(route);
  }
}

class TodoPage extends StatefulWidget{
  TodoPage({Key key, this.todo}) : super(key: key);

  final Todo todo;

  @override
  _TodoPageState createState() => new _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context){
    var _children = <Widget>[
      new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
    ];
    return new Scaffold(
      appBar: new AppBar(title: new Text("Help Us")),
      body: new Column(
        children: _children,
      ),
    );
  }
}
