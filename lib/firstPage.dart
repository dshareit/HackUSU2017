import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget{
  @override
  _FirstPageState createState() => new _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {


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
            child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new ListView.builder(
                      itemBuilder: (context, index) => new ResultCard(resultList[index]),
                      itemCount: resultList.length,
                      padding: new EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ],
              ),
            ),
      ],
    );
  }
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
    description: "hackusuevents.org",
  ),
  const Results(
    title: 'Hunger & Homelessness Awareness Week',
    time: 'November 11 - 19',
    image: 'assets/hhw.png',
    description: '',
  ),
  const Results(
    title: 'Project Homeless Connect',
    time: 'October 6, 2017',
    image: "assets/phc.png",
    description: "phcslc.org",
  ),
  const Results(
    title: 'Food Drive',
    time: 'October 2017',
    image: "assets/StuffaBus.jpg",
    description: "Stuff a bus at USU"
  ),
  const Results(
    title: 'Students Collect Donations',
    time: 'May 15,2017',
    image: "assets/logo.png",
    description: "theroadhome.org",
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
          new Text(results.title),
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
    return new Container(
      height: 120.0,
      margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
      ),
      child: new Stack(
        children: <Widget>[
          resultInfo,
          imageHolder,
        ],
      ),
    );
  }
}
