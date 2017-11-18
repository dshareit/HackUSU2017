import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class ThirdPage extends StatefulWidget {

  @override
  _ThirdPageState createState() => new _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: new EdgeInsets.all(30.0),
        child: new Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(Icons.group, size: 50.0, color: Colors.blueGrey,),
            new Text("Know someone in need?", style: new TextStyle( fontSize: 23.0, fontWeight: FontWeight.bold,)),
            new Padding(padding: new EdgeInsets.all(5.0),),
            new Text("Get in contact with a local representitive to get help for those who need it.", style: new TextStyle( fontSize: 16.0), textAlign: TextAlign.center,),
            new Text(""),
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              new RaisedButton(onPressed: _launchEmailURL, child: new Text("Email Us", style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),), )

            ],),
            new Padding(padding: new EdgeInsets.all(8.0),),
            new Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              new RaisedButton(onPressed: _launchPhoneURL, child: new Text("Call Us", style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),), )

            ],),
          ],
        ),
      ),
    );
  }

  _launchEmailURL() async {
    const url = 'mailto:smith@example.org?subject=Someone%20Needs%20Help&body=New%20plugin';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

_launchPhoneURL() async {
  const url = 'tel:+18016780047';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}



