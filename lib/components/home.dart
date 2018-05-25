import 'package:flutter/material.dart';
import 'package:tech_news_app/components/headlines.dart';
import 'package:tech_news_app/components/sports_news.dart';
import 'package:tech_news_app/components/tech_crunch_news.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.black87,
          title: new Text("Tech News"),
          bottom: new TabBar(
            tabs: [
              new Tab(text: "Headlines"),
              new Tab(text: "Tech Crunch"),
              new Tab(text: "Sports"),
            ]
          ),
          centerTitle: true,
        ),
        body: new TabBarView(
          children: <Widget>[
            new Headlines(),
            new TechCrunchNews(),
            new SportsNews()
          ],
        ),
      )
    );
  }
}