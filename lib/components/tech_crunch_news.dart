import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:tech_news_app/config.dart';
import 'package:tech_news_app/models/tech_crunch.dart';
import 'shared/tn_card.dart';

class TechCrunchNews extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TechCrunchNewsState();
  }
}

Future<List<TechCrunch>> _getTechCrunchNews() async {
  http.Response response = await http.get(Config.techCrunchEndpoint);
  return TechCrunch.getAll(json.decode(response.body)['articles']);
}

class TechCrunchNewsState extends State<TechCrunchNews> {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: _getTechCrunchNews(),
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