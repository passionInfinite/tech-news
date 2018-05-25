import 'package:flutter/material.dart';
import 'package:tech_news_app/config.dart';
import 'package:tech_news_app/models/hacker_news.dart' as News;
import 'shared/tn_card.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HackerNews extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HackerNewsState();
  }
}

Future<List<News.HackerNews>> _getHackerNews() async {
  http.Response response = await http.get(Config.hackerNewsEndpoint);
  return News.HackerNews.getAll(json.decode(response.body)['articles']);
}

class HackerNewsState extends State<HackerNews> {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: _getHackerNews(),
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