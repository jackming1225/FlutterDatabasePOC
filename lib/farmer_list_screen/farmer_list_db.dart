import 'package:flutter/material.dart';
import 'package:flutter_database_app/model/farmer.dart';
import 'package:flutter_database_app/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class FarmerListFromDB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FarmerListState();
  }
}

class FarmerListState extends State<FarmerListFromDB> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Farmers> farmerListFromDb;
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (farmerListFromDb == null) {
      farmerListFromDb = List<Farmers>();
      updateListView();
    }

    return Scaffold(
//      body: Icon(Icons.storage),
      body: getFarmerListFromWeb(),
    );
  }

  ListView getFarmerListFromWeb() {
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

                child: Text(farmerListFromDb[position].firstName[0]),
//                child: Icon(Icons.web),
              ),
              title: Text(
                this.farmerListFromDb[position].firstName,
                style: titleStyle,
              ),
              subtitle: Text(this.farmerListFromDb[position].farmerCode),
            ),
          );
        });
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Farmers>> farmerListFuture =
          databaseHelper.getFarmerListFormMapList();
      farmerListFuture.then((farmerList) {
        setState(() {
          this.farmerListFromDb = farmerList;
          this.itemCount = farmerList.length;
        });
      });
    });
  }
}
