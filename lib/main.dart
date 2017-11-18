import 'package:flutter/material.dart';
import 'package:hackusu2017/firstPage.dart';
import 'package:hackusu2017/secondPage.dart';
import 'package:hackusu2017/thirdPage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  final GoogleSignIn googleSignIn = new GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: signedIn() ? new MyHomePage() : new SignInPage(googleSignIn),
      routes: <String, WidgetBuilder> { //5
        '/homePage': (BuildContext context) => new MyHomePage(),
      },
    );
  }

  bool signedIn() {
    GoogleSignInAccount user = googleSignIn.currentUser;
    return user != null;
  }
}

class SignInPage extends StatefulWidget{

  SignInPage(this.googleSignIn);
  GoogleSignIn googleSignIn;

  @override
  _SignInPageState createState() => new _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image : new DecorationImage(
                image: new ExactAssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              new Container(
                child: new IconButton(
                  icon: new Image.asset("assets/google_sign_in_button.png"),
                  onPressed: _onGoogleSignInPressed,
                ),
                width: 1000.0,
                height: 72.0,
              )



            ],
          ),

        ],


      ),
      
    );
  }

  void _switchToHomePage(){
    Navigator.of(context).pushReplacementNamed('/homePage');
  }

  Future<Null> _onGoogleSignInPressed() async {
    GoogleSignInAccount user = widget.googleSignIn.currentUser;
    if (user == null)
      user = await widget.googleSignIn.signInSilently();

    if (user == null) {
      await widget.googleSignIn.signIn();
    }

    _switchToHomePage();
  }

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  final String title = "Secret Santa";

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _index = 0;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(

        title: new Text(widget.title),
      ),

      body: _bodyList()[_index],

      bottomNavigationBar:
        new BottomNavigationBar(
          currentIndex: _index,
          items: _buildBottomNavigationItemList(),
          onTap: (int index) {
            setState((){
              this._index = index;
            });
          },
        ),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationItemList() {
    List<BottomNavigationBarItem> result = new List<BottomNavigationBarItem>();
    result.add(new BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text("Home")));
    result.add(new BottomNavigationBarItem(icon: new Icon(Icons.card_giftcard), title: new Text("Give")));
    result.add(new BottomNavigationBarItem(icon: new Icon(Icons.account_circle), title: new Text("Settings")));
    return result;
  }

  List<Widget> _bodyList() {
    List<Widget> result = new List<Widget>();
    result.add(new FirstPage());
    result.add(new SecondPage());
    result.add(new ThirdPage());
    return result;
  }
}






