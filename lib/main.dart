import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Secret Santa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(

        title: new Text(widget.title),
      ),
      body: new Center(

        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      bottomNavigationBar:
        new BottomNavigationBar(
          items: _buildBottomNavigationItemList()
        ),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationItemList() {
    List<BottomNavigationBarItem> result = new List<BottomNavigationBarItem>();
    result.add(new BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text("Home")));
    result.add(new BottomNavigationBarItem(icon: new Icon(Icons.card_giftcard), title: new Text("Give")));
    result.add(new BottomNavigationBarItem(icon: new Icon(Icons.settings), title: new Text("Settings")));
    return result;
  }
}
