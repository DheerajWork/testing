import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testing/cric_api/old_matches/new_matches/new_match_model_class.dart';

class NewMatches extends StatefulWidget {
  @override
  _NewMatchesState createState() => _NewMatchesState();
}

class _NewMatchesState extends State<NewMatches> {
  List<NewMatchModelClass> l = [];

  getData() async {
    http.Response response = await http.get(Uri.parse('https://cricapi.com/api/matches?apikey=3rM71hcyu5f79E2XCRhaaWNcfMv1'));
    var parsedData = jsonDecode(response.body);
    l = (parsedData['matches'] as List)
        .map((e) => NewMatchModelClass.fromJson(e))
        .toList();
    print(response.body);
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
      body: l.isEmpty?Center(child: CircularProgressIndicator()):ListView.builder(itemCount: l.length,itemBuilder: (BuildContext context, int index){
        return InkWell(
          onTap: (){
            Navigator.of(context).pushNamed('OldMatches');
          },
          child: Column(
            children: [
              Text('${l[index].uniqueId}'),
              Text('${l[index].date}'),
              Text('${l[index].dateTimeGMT}'),
              Text('${l[index].team1}'),
              Text('${l[index].team2}'),
              Text('${l[index].type}'),
              SizedBox(
                height: 40,
              )
            ],
          ),
        );
      }),
    );
  }
}
