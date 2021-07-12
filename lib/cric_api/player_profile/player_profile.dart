import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testing/cric_api/player_profile/player_profile_model_class.dart';

class PlayerProfile extends StatefulWidget {
  @override
  _PlayerProfileState createState() => _PlayerProfileState();
}

class _PlayerProfileState extends State<PlayerProfile> {

  PlayerProfileModelClass l = PlayerProfileModelClass();

  getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://cricapi.com/api/playerStats?apikey=3rM71hcyu5f79E2XCRhaaWNcfMv1&pid=35320'));
    var parsedData = jsonDecode(response.body);
    l = PlayerProfileModelClass.fromJson(parsedData);
    print(l.data!.bowling!.t20Is!.sR!);
    setState(() {});
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

      body: l.data==null?Center(child: CircularProgressIndicator(),):SafeArea(
        child: Column(
          children: [
            Text("${l.pid}"),
            Text("${l.profile}"),
            Image.network("${l.imageURL}"),
            Text("${l.battingStyle}"),
            Text("${l.bowlingStyle}"),
            Text("${l.majorTeams}"),
            Text("${l.currentAge}"),
            Text("${l.born}"),
            Text("${l.fullName}"),
            Text("${l.name}"),
            Text("${l.country}"),
            Text("${l.playingRole}"),
            Text("${l.v}"),
            Text("${l.data!.bowling!.listA!.s10}"),
          ],
        ),
      )
    );
  }
}
