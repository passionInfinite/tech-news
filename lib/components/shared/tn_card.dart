import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TNCard extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final int position;

  TNCard(this.snapshot, this.position);

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

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
                child: new Column(
                  children: <Widget>[
                    new Text(snapshot.data[position].title, style: new TextStyle(fontSize: 16.0)),
                    new Container(
                      margin: new EdgeInsets.only(top: 10.0),
                      alignment: Alignment.topLeft,
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Text(
                                "${snapshot.data[position].publishedAt}",
                                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.grey.shade400)),
                          ),
                          new Expanded(
                            child: new Container(
                              child: new InkWell(
                                child: new Row(
                                  children: <Widget>[
                                    new Icon(Icons.info_outline, color: Colors.lightBlueAccent, size: 16.0),
                                    new Padding(padding: new EdgeInsets.only(left: 4.0)),
                                    new Text("Read More", style: new TextStyle(fontSize: 16.0, color: Colors.lightBlueAccent)),
                                  ],
                                ),
                                onTap: () => _launchUrl(snapshot.data[position].url),
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                  ],
                )
              ),
            ),
            new Container(
              height: 140.0,
              width: 140.0,
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