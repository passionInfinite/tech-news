import 'package:flutter/material.dart';
import 'package:tech_news_app/config.dart';
import 'package:tech_news_app/models/headline.dart';
import 'shared/tn_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Headlines extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HeadlinesState();
  }
}

Future<List<Headline>> _getHeadlines() async {
  http.Response response = await http.get(Config.headlinesEndpoint);
  return Headline.getAll(json.decode(response.body)['articles']);
}

class HeadlinesState extends State<Headlines> {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: _getHeadlines(),
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