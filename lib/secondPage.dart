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
  final String family;
  final String gift;
  final String giftIcons;
  final List<String> gifts;

  const Results({
    this.family,
    this.gift,
    this.giftIcons,
    this.gifts
});
}


List<Results> resultList = [
  const Results(
    family: 'Smith Family',
    gift: '4Fruit of the Loom Mens Basic Brief',
    giftIcons: "assets/HackUSUEvent.png",
    gifts: const ["Bike", "tablet", "Huntsman Hall"],
  ),
  const Results(
    family: 'Thompson Family',
    gift: 'Graco Backless TurboBooster Car Seat, Galaxy',
    giftIcons: "assets/HackUSUEvent.png",
    gifts: const["trophy", "bubbles", "rockstars"],
  ),
  const Results(
    family: 'Bradshaw Family',
    gift: 'Hanes Mens 6 Pack Over-the-Calf Tube Socks',
    giftIcons: "assets/HackUSUEvent.png",
    gifts: const ["Candy", "more candy", "pumkins"],
  ),
  const Results(
    family: 'Smith Family',
    gift: '4Fruit of the Loom Mens Basic Brief',
    giftIcons: "assets/HackUSUEvent.png",
    gifts: const ["Bike", "tablet", "Huntsman Hall"],
  ),
  const Results(
    family: 'Thompson Family',
    gift: 'Graco Backless TurboBooster Car Seat, Galaxy',
    giftIcons: "assets/HackUSUEvent.png",
    gifts: const["trophy", "bubbles", "rockstars"],
  ),
  const Results(
    family: 'Bradshaw Family',
    gift: 'Hanes Mens 6 Pack Over-the-Calf Tube Socks',
    giftIcons: "assets/HackUSUEvent.png",
    gifts: const ["Candy", "more candy", "pumkins"],
  )
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
      alignment: FractionalOffset.centerRight,
      child: new Image(
        image: new AssetImage(results.giftIcons),
        height: 92.0,
        width: 92.0,
      ),
    );

    final resultInfoContent = new Container(
      margin: new EdgeInsets.fromLTRB(26.0, 16.0, 36.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(results.family, style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          new Container(height: 10.0),
          new Text(results.gift, style: new TextStyle(fontWeight: FontWeight.w400)),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 72.0,
              color: Colors.redAccent
          ),
        ],
      ),
    );

    final resultInfo = new Container(
      child: resultInfoContent,
      height: 124.0,
      margin: new EdgeInsets.only(right: 46.0),
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
          imageHolder
        ],
      ),
    );
  }
}
