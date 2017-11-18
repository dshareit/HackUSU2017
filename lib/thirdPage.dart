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
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.group,
              size: 50.0,
              color: Colors.blueGrey,
            ),
            new Text("Know someone in need?",
                style: new TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                )),
            new Padding(
              padding: new EdgeInsets.all(5.0),
            ),
            new Text(
              "Get in contact with a local representitive to get help for those who need it.",
              style: new TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            new Text(""),
            new Padding(
              padding: new EdgeInsets.all(20.0),
            ),
            new Column(
              children: <Widget>[
                new InkWell(onTap: _launchPhoneURL,
                  child: new Card(
                    child: new Container(
                      padding: new EdgeInsets.all(20.0),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Padding(
                              padding: new EdgeInsets.fromLTRB(
                                  38.0, 0.0, 20.0, 0.0)),
                          new Icon(
                            Icons.contact_phone,
                            color: Colors.blue[500],
                          ),
                          new Padding(
                              padding:
                              new EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 0.0)),
                          new Text(
                            '(408) 555-1212',
                            style: new TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                new InkWell(onTap: _launchEmailURL,
                  child: new Card(
                    child: new Container(
                      padding: new EdgeInsets.all(20.0),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Padding(
                              padding: new EdgeInsets.fromLTRB(
                                  16.0, 0.0, 20.0, 0.0)),
                          new Icon(
                            Icons.contact_mail,
                            color: Colors.blue[500],
                          ),
                          new Padding(
                              padding:
                              new EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0)),
                          new Text(
                            'johnsmith@gmail.com',
                            style: new TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                new InkWell(onTap: _launchPhoneURL,
                  child: new Card(
                    child: new Container(
                      padding: new EdgeInsets.all(20.0),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Padding(
                              padding: new EdgeInsets.fromLTRB(
                                  0.0, 0.0, 20.0, 0.0)),
                          new Icon(
                            Icons.map,
                            color: Colors.blue[500],
                          ),
                          new Padding(
                              padding:
                              new EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
                          new Text(
                            '1234 Main Street, Ogden, UT',
                            style: new TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _launchEmailURL() async {
    const url =
        'mailto:smith@example.org?subject=Someone%20Needs%20Help&body=New%20plugin';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
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
}
