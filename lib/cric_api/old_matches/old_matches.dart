import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testing/cric_api/old_matches/old_matches_model_class.dart';

class OldMatchesData extends StatefulWidget {
  @override
  _OldMatchesDataState createState() => _OldMatchesDataState();
}

class _OldMatchesDataState extends State<OldMatchesData> {

  List<OldMatchesDataModel> l = [];

  getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://cricapi.com/api/cricket?apikey=3rM71hcyu5f79E2XCRhaaWNcfMv1'));
    var parsedData = jsonDecode(response.body);
    l = (parsedData['data'] as List).map((e) => OldMatchesDataModel.fromJson(e)).toList();
    print(l[0].title);
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
      body: l.isEmpty?Center(child: CircularProgressIndicator()):Column(
        children: [
         Expanded(
           child: ListView.builder(itemCount: l.length,itemBuilder: (BuildContext context, int index){
             return InkWell(
               onTap: (){
                 Navigator.of(context).pop();
               },
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text("Unique Id = ${l[index].uniqueId}",style: TextStyle(fontWeight: FontWeight.bold),),
                   Text("Title = ${l[index].title}"),
                   Text("Description = ${l[index].description}"),
                   SizedBox(
                     height: 30,
                   )
                 ],
               ),
             );
           }),
         )
        ],
      ),
    );
  }
}
