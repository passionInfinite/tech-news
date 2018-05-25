import 'package:flutter/material.dart';

class Headlines extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HeadlinesState();
  }
}

//FutureBuilder<Headline> _getHeadlines() {
//
//}

class HeadlinesState extends State<Headlines> {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
//      future: _getHeadlines(),
      builder: (context, snapshot) {

      }
    );
  }
}