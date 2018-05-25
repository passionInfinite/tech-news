import 'package:flutter/material.dart';

class TNCard extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final int position;

  TNCard(this.snapshot, this.position);

  @override
  Widget build(BuildContext context) {
    return new Card(
      margin: new EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(const Radius.circular(10.0))
      ),
      elevation: 2.0,
      child: new Container(
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Container(
                margin: new EdgeInsets.all(20.0),
                child: new Text(snapshot.data[position].title, style: new TextStyle(fontSize: 16.0)),
              ),
            ),
            new Container(
              height: 120.0,
              width: 120.0,
              child: snapshot.data[position].urlToImage != null ?
              new Image.network(snapshot.data[position].urlToImage,fit: BoxFit.fill, alignment: Alignment.topLeft) :
              new Image.asset("assets/images/default.png", fit: BoxFit.fill, alignment: Alignment.topLeft),
            ),
          ],
        ),
      )
    );
  }
}