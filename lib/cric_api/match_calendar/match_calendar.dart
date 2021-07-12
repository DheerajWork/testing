import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testing/cric_api/match_calendar/match_calendar_model_class.dart';

class MatchCalendar extends StatefulWidget {
  @override
  _MatchCalendarState createState() => _MatchCalendarState();
}

class _MatchCalendarState extends State<MatchCalendar> {

  MatchCalendarModelClass l = MatchCalendarModelClass();
  getData() async{
    http.Response response = await http.get(Uri.parse('https://cricapi.com/api/matchCalendar?apikey=3rM71hcyu5f79E2XCRhaaWNcfMv1'));
    var parsedData = jsonDecode(response.body);
    l = MatchCalendarModelClass.fromJson(parsedData);
    print(l.uniqueId);
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

    );
  }
}
