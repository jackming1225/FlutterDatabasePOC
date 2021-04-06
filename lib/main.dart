import 'package:flutter/material.dart';
import 'package:flutter_database_app/farmer_list_screen/farmer_list_api.dart';
import 'package:flutter_database_app/farmer_list_screen/farmer_list_db.dart';
import 'package:flutter_database_app/loanscreen/farmer_list_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmerList',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.greenAccent,
      ),
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: new Text("Flutter List DB App"),
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.web),
                    text: 'API',
                  ),
                  Tab(
                    icon: Icon(Icons.storage),
                    text: 'DB',
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Scaffold(
                  body: FarmerListFromApi(),
                ),
                Scaffold(
                  body: FarmerListFromDB(),
                ),
              ],
            ),
          )),
    );
  }
}
