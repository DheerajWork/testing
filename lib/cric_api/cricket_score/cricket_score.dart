import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testing/cric_api/cricket_score/cricket_score_model_class.dart';

class CricketScore extends StatefulWidget {
  @override
  _CricketScoreState createState() => _CricketScoreState();
}

class _CricketScoreState extends State<CricketScore> {

  bool _isVisible = false;

  CricketScoreModelClass l = CricketScoreModelClass();
  getData() async {
    http.Response response = await http.get(Uri.parse('https://cricapi.com/api/cricketScore?apikey=3rM71hcyu5f79E2XCRhaaWNcfMv1&unique_id=1034809'));
    var parsedData = jsonDecode(response.body);
    l = CricketScoreModelClass.fromJson(parsedData);
    print("${l.team2} VS ${l.team1}");
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              setState(() {
                _isVisible = !_isVisible;
              });
            },child: Text('Press'),),
           Visibility(visible: _isVisible,child: Column(
             children: [
               Text("${l.matchStarted}"),
               Text("${l.team1}"),
               Text("${l.team2}"),
               Text("${l.v}"),
               Text("${l.ttl}"),
             ],
           ),)
          ],
        ),
      ),
    );
  }
}
