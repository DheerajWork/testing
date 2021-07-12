import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testing/cric_api/old_matches/new_matches/new_matches.dart';
import 'package:testing/cric_api/old_matches/old_matches.dart';
import 'package:testing/cric_api/player_profile/player_profile.dart';
import 'package:testing/model_class.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewMatches(),
      routes: {
        'NewMatches' : (context) => NewMatches(),
        'OldMatches' : (context) => OldMatchesData()
      },
    );
  }
}

class MTesting extends StatefulWidget {
  @override
  _MTestingState createState() => _MTestingState();
}

class _MTestingState extends State<MTesting> {

  List<UserModel> l = [];
  getData() async {
    http.Response response = await http.get(Uri.parse('http://developing.quiz99.online/api/feedback'));
    var parsedData = jsonDecode(response.body);
   l= (parsedData['Data'] as List).map((e) => UserModel.fromJson(e)).toList();
    print(l[1].designation);
    setState(() {

    });
  }

  @override
  // ignore: must_call_super
  void initState() {
    // TODO: implement initState
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Testing'),),
      body: l.isEmpty?CircularProgressIndicator(): Column(
        children: [
          // ignore: deprecated_member_use
          RaisedButton(onPressed: (){
            getData();
          },child: Text('Press'),),
          Text("${l[0].name}")
        ],
      ),
    );
  }
}




