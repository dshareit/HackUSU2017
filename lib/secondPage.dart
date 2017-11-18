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
            ),
          ),
      ],
    );
  }
}

class Results{
  final String name;
  final String image;
  final String item;
  final String location;
  final String link;

  const Results({
    this.name,
    this.image,
    this.item,
    this.location,
    this.link
  });
}


List<Results> resultList = [
  const Results(
      image : "https://images-na.ssl-images-amazon.com/images/I/81KYH5AP95L._UX679_.jpg",
      item : "Fruit of the Loom Men's Basic Brief",
      link : "https://www.amazon.com/gp/item-dispatch/ref=cm_wl_addtocart_o_pC_nS?registryID.1=BBCSIJHR7R99&registryItemID.1=I2D0O3WJZIOQ7L&offeringID.1=%252B7NBIaJPoE3%252BFBFRWZAP5EoVmYNmMCSnKRtb%252Bz%252BP5Bg3B5DWZeJGPkfqjrPsSazWtB4ijQ6aUkS1ufxpybbQYh534%252FgFH0RIqKEV0vp%252FrzDDOgyE2QQd5w%253D%253D&session-id=142-5438377-8276525&isGift=1&submit.addToCart=1&quantity.1=1",
      location : "Salt Lake City, UT",
      name : "The Road Home - Homeless Shelter"
  ),
  const Results(
      image : "https://images-na.ssl-images-amazon.com/images/I/41Y+fEcS3vL._AC_US218_.jpg",
      item : "Graco Backless TurboBooster Car Seat, Galaxy",
      link : "https://www.amazon.com/gp/item-dispatch/ref=cm_wl_addtocart_o_pC_nS?registryID.1=BBCSIJHR7R99&registryItemID.1=IE7L00JB4B3J6&offeringID.1=737hIuIf9rosrHBPxI%252BJqi9dNUgJtcpF0Wl41yhJYL%252BOOQiU%252Bt2jGA0MEBdhbyZ3NdW4qdcAWDpG46WU3ozJSBwMWAmSYkZmnZoQKjKxwdgtOJKXzxRtiQ%253D%253D&session-id=142-5438377-8276525&isGift=1&submit.addToCart=1&quantity.1=1",
      location : "Salt Lake City, UT",
      name : "The Road Home - Homeless Shelter"
  ),
  const Results(
      image : "https://images-na.ssl-images-amazon.com/images/I/91NJuz9b9fL._UX679_.jpg",
      item : "Hanes Men's 6 Pack Over-the-Calf Tube Socks",
      link : "https://www.amazon.com/gp/item-dispatch/ref=cm_wl_addtocart_o_pC_nS?registryID.1=BBCSIJHR7R99&registryItemID.1=I27J9J75QK4PV3&offeringID.1=p%252BCKRfN6%252FxW1M23PK4mi5D0bgd86Wh5NgrS%252FRGkqTYQIYtNV3qCWnuO1U0iTThGKBTVYPYr6ocHMfHTf8sOw2akbckuqq6MKh6ImQeJOikw%253D&session-id=142-5438377-8276525&isGift=1&submit.addToCart=1&quantity.1=1",
      location : "Salt Lake City, UT",
      name : "The Road Home - Homeless Shelter"
  ),
  const Results(
      image : "https://images-na.ssl-images-amazon.com/images/I/41OLR3Xx9cL._AC_US218_.jpg",
      item : "Aurora World Flopsie Plush Goldie Labrador Dog, 12 Inch",
      link : "https://www.amazon.com/gp/item-dispatch/ref=cm_wl_addtocart_o_pC_nS?registryID.1=BBCSIJHR7R99&registryItemID.1=I2DL88ZXEB972A&offeringID.1=DDZOWMzR4gd%252Fk1hPi33lJXTW9DtDGZD8e1WMhRj9V6Z0bcYs%252BH1myol9Aw%252BBGZvUm4cAPKDhpf7CoHTkc%252FScRqH3U6uCtPsnQru4Fjv56NiIhyVq8w8nNQ%253D%253D&session-id=142-5438377-8276525&isGift=1&submit.addToCart=1&quantity.1=1",
      location : "Salt Lake City, UT",
      name : "The Road Home - Homeless Shelter"
  ),
  const Results(
      image : "https://images-na.ssl-images-amazon.com/images/I/51Wpant49KL.jpg",
      item : "Scott 1000 Bath Tissue 12 roll",
      link : "https://www.amazon.com/gp/item-dispatch/ref=cm_wl_addtocart_o_pC_nS?registryID.1=BBCSIJHR7R99&registryItemID.1=I1YA6CZ93BNX69&offeringID.1=Tj5tNNziFgH3uu%252BJ1KqJ65TzjXyFuAy3B2sVgV%252BvMWKEyT%252Fdd%252BhvP5xuJc0%252BbGFBLEfWXullKlCBLq1HCCZmRMsWzSCnRf4ZjD4s%252FlSNYpKs35RQVpv2XLa%252FNy3SBq%252BitVGZd0huPgvcsrfxQuNz9%252B1%252BZcTnrqE2&session-id=142-5438377-8276525&isGift=1&submit.addToCart=1&quantity.1=1",
      location : "Salt Lake City, UT",
      name : "The Road Home - Homeless Shelter"
  ),
  const Results(
      image : "https://images-na.ssl-images-amazon.com/images/I/61w7hTZnzAL._SX355_.jpg",
      item : "Huggies Snug & Dry Diapers",
      link : "https://www.amazon.com/gp/item-dispatch/ref=cm_wl_addtocart_o_pC_nS?registryID.1=BBCSIJHR7R99&registryItemID.1=IJ3E17FKLHMDW&offeringID.1=R0kVMWl%252Bk9IxAGNEnYAs7Pu0RsiMhPtb%252FNd403OJz2f4h9zpZzizp4ltzMXzrveLreSRaGnJwxVgImWxzwQcrN%252FOsmo9x3bmhcG%252B4RDpxH9%252FCakz6BweBg%253D%253D&session-id=142-5438377-8276525&isGift=1&submit.addToCart=1&quantity.1=1",
      location : "Salt Lake City, UT",
      name : "The Road Home - Homeless Shelter"
  ),
  const Results(
      image : "https://images-na.ssl-images-amazon.com/images/I/81V6lqWk63L._SX522_.jpg",
      item : "Summer Infant Complete Nursery Care Kit, Pink/White",
      link : "https://www.amazon.com/gp/item-dispatch/ref=cm_wl_addtocart_o_pC_nS?registryID.1=BBCSIJHR7R99&registryItemID.1=I3675IAQ578O2B&offeringID.1=s0agLQ8p9wS5BlkOrxXuw6FME4U140UbGgZILfckY5M1rVEM8UUWJELdIn%252FLhJlGFi6FmvzughqweeRY1dokQ6XhiIcgRRSFNFy%252FwN%252FMma60FNiKGUXzKg%253D%253D&session-id=142-5438377-8276525&isGift=1&submit.addToCart=1&quantity.1=1",
      location : "Salt Lake City, UT",
      name : "The Road Home - Homeless Shelter"
  ),
  const Results(
      image : "https://images-na.ssl-images-amazon.com/images/I/41RPil7LrbL.jpg",
      item : "Aurora World Flopsie Plush Farrah Fawn, 12 Inch",
      link : "https://www.amazon.com/gp/item-dispatch/ref=cm_wl_addtocart_o_pC_nS?registryID.1=BBCSIJHR7R99&registryItemID.1=I1Y8TAFFCHDG89&offeringID.1=faOLta9KfuSrjsvIjNtu2nLZKszMt5Y%252BbEAWbNQ69wNTjcJpA8jb18yZlB4yQhp1jkqZ2hfrNgZGgZ%252BYIkA1XmPcmoCz4gkaPs0uj8VSQZ39eLCULiGfWg%253D%253D&session-id=142-5438377-8276525&isGift=1&submit.addToCart=1&quantity.1=1",
      location : "Salt Lake City, UT",
      name : "The Road Home - Homeless Shelter"
  ),
  const Results(
      image : "https://images-na.ssl-images-amazon.com/images/I/71onzWwrx8L._SL1500_.jpg",
      item : "Herbal Essences Long Term Relationship Shampoo & Conditioner Set",
      link : "https://www.amazon.com/gp/item-dispatch/ref=cm_wl_addtocart_o_pC_nS?registryID.1=BBCSIJHR7R99&registryItemID.1=I391AXXKQT4JHS&offeringID.1=D%252FyoUvpyCsoR9w4KjANn4uTLNtF%252B14b%252BBs8G4A2rxGc8zWgCdFSkTnvehKLGiZWDxHdPsm%252BmMIUTRMErKQCk1cL0HIFBtK4oceHCNAou%252FgOIHOVmq6gin%252Fjx%252F%252FsShlB0sJrONyPQk2j9o6zb%252FJQ6phC1BMEGLjeA&session-id=142-5438377-8276525&isGift=1&submit.addToCart=1&quantity.1=1",
      location : "Salt Lake City, UT",
      name : "The Road Home - Homeless Shelter"
  ),
  const Results(
      image : "https://images.samsclubresources.com/is/image/samsclub/0003700097680_A?\$img_size_380x380\$",
      item : "Luvs Ultra Leakguards Diapers",
      link : "https://www.amazon.com/gp/item-dispatch/ref=cm_wl_addtocart_o_pC_nS?registryID.1=BBCSIJHR7R99&registryItemID.1=I3SNNX81AZOKJS&offeringID.1=pRua2dqA4J0uiLPGraHpjRQAxQhhspZMrloK5YOv0vrRp3QVaCHR6z7CMC1Rzo9orAY0tD%252BD%252Flf%252FWz6PHF1nrPqmv1UA4oHsy2GZBlT03d8IIsJj6hXoYA%253D%253D&session-id=142-5438377-8276525&isGift=1&submit.addToCart=1&quantity.1=1",
      location : "Salt Lake City, UT",
      name : "The Road Home - Homeless Shelter"
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
        image: new NetworkImage(results.image),
        height: 92.0,
        width: 92.0,
      ),
    );

    final resultInfoContent = new Container(
      margin: new EdgeInsets.fromLTRB(26.0, 16.0, 36.0, 14.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(results.name, style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          new Container(height: 10.0),
          new Text(results.location, style: new TextStyle(fontWeight: FontWeight.w400)),
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
