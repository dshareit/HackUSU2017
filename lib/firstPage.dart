import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackusu2017/main.dart';


class FirstPage extends StatefulWidget{
  @override
  _FirstPageState createState() => new _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  get buttonText => new Text("Start Giving");



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
//        new MaterialButton(
//          onPressed: null,
//          color: Colors.blueGrey,
//          child: buttonText,
//          textColor: Colors.white,
//        ),
//        new Divider(
//          height: 16.0,
//            indent: 0.0,
//            color: Colors.black,
//        ),
        new Text("News and Events"),
        new Divider(
          height: 16.0,
          indent: 0.0,
          color: Colors.black,
        ),
        new ListBody(
          children: <Widget>[
            new EventItem(),
          ],
        ),
      ],
    );
  }
}

class Event {
  final String title;
  final String date;
  final String time;
  final String description;
  final String location;
  final FileImage image;

  const Event({
    this.title,
    this.date,
    this.time,
    this.description,
    this.location,
    this.image});
}

const eventList = const <Event>[
  const Event(
    title: 'Hackathon',
    date: 'November 17, 2017',
    time: '9:00 A.M.',
    location: 'USU',
    description: 'Super awesome coding event....',
    image: const FileImage(null),
  ),
  const Event(
    title: 'Awards Ceremony',
    date: 'November 18, 2017',
    time: '8:00 P.M.',
    location: 'USU',
    description: 'Who wins it all?????',
    image: const FileImage(null),
    ),
];

class Results{
  final String title;
  final String date;
  final FileImage image;
  final List<String> gifts;

  const Results({
    this.title,
    this.date,
    this.image,
    this.gifts
});
}

const resultList = const <Results>[
  const Results(
    title: 'Planning meeting',
    date: 'November 7, 2017',
    image: const FileImage(null),
    gifts: const ["Bike", "tablet", "Huntsman Hall"],
  )
];

class _EventItem extends StatelessWidget{
  final Event _event;

  _EventItem(this._event);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
        leading: new CircleAvatar(
          child: new Image(image: _event.image),
        ),
        title: new Text(_event.title),
        subtitle: new Text(_event.description),
        onTap: null,
    );
  }
}

class _ResultItem extends StatelessWidget{
  final Results _result;

  _ResultItem(this._result);

  @override
  Widget build(BuildContext context){
    return new ListTile(
      leading: new CircleAvatar(
        child: new Image(image: _result.image),
      ),
      title: new Text(_result.title),
        subtitle: new Text(_result.date),
    );
  }
}

List<Widget> _buildrandeList(){
  var items = new List<Widget>();
  for(var a in _EventItem){
    items.add(new _ResultItem(_result));
  }
}

class _ResultsAndEvents extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return new
}