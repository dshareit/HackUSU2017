import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackusu2017/main.dart';

class FirstPage extends StatefulWidget{
  @override
  _FirstPageState createState() => new _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  //get countDown => new ;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new Expanded(
            child: new ListView.builder(
                itemBuilder: (context, index) => new ResultCard(resultList[index]),
              itemCount: resultList.length,
              padding: new EdgeInsets.symmetric(vertical: 16.0),
            ),
          ),
      ],
    );
  }
}

class Results{
  final String title;
  final String date;
  //final FileImage image;
  final List<String> gifts;

  const Results({
    this.title,
    this.date,
    //this.image,
    this.gifts
});
}


List<Results> resultList = [
  const Results(
    title: 'Planning meeting',
    date: 'Yesterday',
    //image: const FileImage(null),
    gifts: const ["Bike", "tablet", "Huntsman Hall"],
  ),
  const Results(
    title: 'Hackathon',
    date: 'Today',
    gifts: const["trophy", "bubbles", "rockstars"],
  ),
  const Results(
    title: 'Halloween',
    date: 'October 31',
    gifts: const ["Candy", "more candy", "pumkins"],
  )
];

class ResultCard extends StatelessWidget{
  final Results results;

  ResultCard(this.results);


  @override
  Widget build(BuildContext context){
    final resultInfoContent = new Container(
      margin: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(results.title),
          new Container(height: 10.0),
          new Text(results.date),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: Colors.red
          ),
        ],
      ),
    );

    final resultInfo = new Container(
      child: resultInfoContent,
      height: 124.0,
      decoration: new BoxDecoration(
        color: Colors.cyan,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
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
        ],
      ),
    );
  }
}


