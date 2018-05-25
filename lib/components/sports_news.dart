import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:tech_news_app/config.dart';
import 'package:tech_news_app/models/sports_news.dart' as Sports;
import 'shared/tn_card.dart';

class SportsNews extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SportsNewsState();
  }
}

Future<List<Sports.SportsNews>> _getSportsNews() async {
  http.Response response = await http.get(Config.sportsNewsEndpoint);
  return Sports.SportsNews.getAll(json.decode(response.body)['articles']);
}

class SportsNewsState extends State<SportsNews> {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: _getSportsNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, position) {
                  return new TNCard(snapshot, position);
                });
          }
          if (snapshot.hasError) {
            return new Text("${snapshot.error}!");
          }
          return new Center(
              child: new CircularProgressIndicator()
          );
        }
    );
  }
}