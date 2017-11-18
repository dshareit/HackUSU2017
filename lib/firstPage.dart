import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackusu2017/event1Page.dart';
import 'package:hackusu2017/event2Page.dart';
import 'package:hackusu2017/event3Page.dart';
import 'package:hackusu2017/eventsPage.dart';

class FirstPage extends StatefulWidget{
  @override
  _FirstPageState createState() => new _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new DaysToChristmas(),
          ],
        ),
        new Divider(
          height: 16.0,
          color: Colors.black,
        ),
        new Text("Past Events"),
        new Divider(
          height: 16.0,
          color: Colors.black,
        ),
        new Expanded(
            child: new Scaffold(
              floatingActionButton: _index != 0 ? new IconButton(
                icon: new Icon(Icons.arrow_back),
                onPressed: () {
                  setState((){
                    this._index = 0;
                  });
                },
                ) : new Text(" "),
              body: _index != 0 ? _eventWidgetList()[_index] : new Row(
                children: <Widget>[
                  new Expanded(
                    child: new PopupMenuButton(
                      itemBuilder: (context, index) => new ResultCard(resultList[index]),
                      itemCount: resultList.length,
                      padding: new EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ],
              ),
              ),
          ),
      ],
    );
  }
}

List<Widget> _eventWidgetList(){
  List<Widget> pages = new List<Widget>();
  pages.add(new eventsPage());
  pages.add(new event1Page());
  pages.add(new event2Page());
  pages.add(new event3Page());
  return pages;
}

class DaysToChristmas extends StatelessWidget{
  DateTime christmas = new DateTime.utc(2017, 12, 25);
  DateTime now = new DateTime.now();

  @override
  Widget build(BuildContext context){
    var daysLeft = christmas.difference(now).inDays.toString();

    final timeLeft = new Container(
      child: new Column(
        children: <Widget>[
          new Expanded(
            child: new Row(
              children: <Widget>[
                new Text("ONLY " + daysLeft + " DAYS UNTIL CHRISTMAS!", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0)),
              ],
            ),
          ),
        ],
      ),
      height: 110.0,
      decoration: new BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.transparent,
            blurRadius: 10.0,
          ),
        ],
      ),
    );
    return new Container(
      height: 45.0,
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 26.0,
      ),
      child: new Stack(
        children: <Widget>[
          timeLeft
        ],
      ),
    );
  }
}
class Results{
  final String title;
  final String time;
  final String image;
  final String description;

  const Results({
    this.title,
    this.time,
    this.image,
    this.description,
  });
}


List<Results> resultList = [
  const Results(
    title: 'Hackathon',
    time: 'Today',
    image: "assets/HackUSUEvent.png",
    description: "More info...",
  ),
  const Results(
    title: 'Project Homeless Connect',
    time: 'October 6, 2017',
    image: "assets/phc.png",
    description: "More info...",
    //https://www.phcslc.org/
  ),
  const Results(
    title: 'Students Collect Donations',
    time: 'May 15,2017',
    image: "assets/logo.png",
    description: "More info...",
    //www.theroadhome.org/news
  ),
];

class ResultCard extends StatelessWidget{
  final Results results;

  ResultCard(this.results);

  @override
  Widget build(BuildContext context){
    final imageHolder = new Container(
      margin: new EdgeInsets.symmetric(
          vertical: 20.0
      ),
      alignment: FractionalOffset.centerLeft,
      child: new Image(
        image: new AssetImage(results.image),
        height: 92.0,
        width: 92.0,
      ),
    );

    final resultInfoContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(results.title, style: new TextStyle(color: Colors.black12)),
          new Container(height: 10.0),
          new Text(results.time),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 72.0,
              color: Colors.blue
          ),
          new Row(
            children: <Widget>[
              new Container(width: 8.0),
              new Text(results.description),
            ],
          ),
        ],
      ),
    );

    final resultInfo = new Container(
      child: resultInfoContent,
      height: 124.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );
    return new MaterialButton(
      height: 120.0,
      onPressed: _cardLinks,
      //margin: const EdgeInsets.symmetric(
      //    vertical: 16.0,
      //    horizontal: 24.0,
      //),
      child: new Stack(
        children: <Widget>[
          resultInfo,
          imageHolder,
        ],
      ),
    );
  }
}

void _cardLinks(){
  print("button");
}
