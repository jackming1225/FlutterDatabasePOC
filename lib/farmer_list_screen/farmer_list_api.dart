import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database_app/model/farmer.dart';
import 'package:flutter_database_app/utils/database_helper.dart';
import 'package:http/http.dart' as http;

class FarmerListFromApi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FarmerListFromApiState();
  }
}

class FarmerListFromApiState extends State<FarmerListFromApi> {
  int itemCount = 0;
  DatabaseHelper databaseHelper = DatabaseHelper();

  List<Farmers> farmerList;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (farmerList == null) {
      farmerList = List<Farmers>();
    }

    return Scaffold(
      body: FutureBuilder<List<Farmers>>(
        future: getFarmerData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? getFarmerListView(snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ListView getFarmerListView(List<Farmers> farmerDatas) {
    this.farmerList = farmerDatas;
    this.itemCount = farmerList.length;

    updateDatabase();

    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 4.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amberAccent,

                child: Text(farmerList[position].firstName[0]),
//                child: Icon(Icons.web),
              ),
              title: Text(
                this.farmerList[position].firstName,
                style: titleStyle,
              ),
              subtitle: Text(this.farmerList[position].farmerCode),
            ),
          );
        });
  }

  Future<List<Farmers>> getFarmerData() async {
    databaseHelper.initializeDatabase();

    var response = await http.get(Uri.encodeFull(
//        "https://farmerserviceqa.cropin.in/api/v1/farmer/listAll"),
            "https://f2204389-8f7d-4b3a-95bf-17977ab5ea54.mock.pstmn.io/flutterSunny"),
        headers: {
          "X-Auth-TOKEN":
              "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ7XCJ1c2VyTmFtZVwiOlwiMjUyNTI1MTIzNFwiLFwicGFzc3dvcmRcIjpcIlY3NWZVTWVjRDBVK1BFa3c4cFRiMVFcXHUwMDNkXFx1MDAzZFwiLFwiY3JlYXRlZERhdGVcIjp7XCJ5ZWFyXCI6MjAxOSxcIm1vbnRoXCI6MCxcImRheU9mTW9udGhcIjozMCxcImhvdXJPZkRheVwiOjEwLFwibWludXRlXCI6NDQsXCJzZWNvbmRcIjo0fSxcInZhbGlkVG9EYXRlXCI6e1wieWVhclwiOjIwMTksXCJtb250aFwiOjYsXCJkYXlPZk1vbnRoXCI6MjksXCJob3VyT2ZEYXlcIjoxMCxcIm1pbnV0ZVwiOjQ0LFwic2Vjb25kXCI6NH0sXCJjYWxsZXJcIjpcIlNtYXJ0RmFybVwiLFwiY2FsbGVyVHlwZVwiOlwiTW9iaWxlXCIsXCJtb2JpbGVBcGtWZXJzaW9uXCI6XCI0LjFcIn0ifQ.JIr7rrZRqE4ECKPYv5LmrWxwOzonM1X1LjRD0FKJvpd6elUOcUV6KNw8nsAEfiQKG5wPBEj85LPwDgji4O0blA",
          "mobileApkVersion": "4.2",
          "X-Source": "SmartFarm",
          "user-agent": "Mobile"
        });

    return compute(parseFarmersFromJSON, response.body.toString());
  }

  static List<Farmers> parseFarmersFromJSON(String responseBody) {
    final Iterable parsed = json.decode(responseBody);

    List<Farmers> farmer_list =
        parsed.map<Farmers>((json) => Farmers.fromJson(json)).toList();

    return farmer_list;
  }

  void updateDatabase() async {
    int result = 0;
    for (Farmers data in farmerList) {
      print(Text('inserting farmer' + data.firstName));
      result = await databaseHelper.saveFarmer(data);

      if (result != 0) {
        print(Text('insert success for farmer' + data.firstName));
      }
    }
  }
}
