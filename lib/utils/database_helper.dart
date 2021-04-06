import 'dart:async';
import 'dart:io';

import 'package:flutter_database_app/model/farmer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  DatabaseHelper._createInstance();

//Farmer Table columns
  String farmerTable = 'Farmers';
  String farmerCode = 'FarmerCode';
  String firstName = 'FirstName';
  String address1 = 'Address1';
  String address2 = 'Address2';
  String village = 'Village';
  String taluka = 'Taluka';
  String photo = 'Photo';
  String acarage = 'Acarage';
  String age = 'Age';
  String mobileNumber = 'MobileNumber';
  String farmerId = 'FarmerId';
  String cropexFarmerCode = 'CropexFarmerCode';
  String sex = 'Sex';
  String fatherName = 'FatherName';
  String latLong = 'LatLong';
  String dateOfBirth = 'DateOfBirth';
  String clientId = 'ClientId';
  String attribute1 = 'Attribute1';
  String attribute2 = 'Attribute2';
  String attribute3 = 'Attribute3';
  String attribute4 = 'Attribute4';
  String attribute5 = 'Attribute5';
  String attribute6 = 'Attribute6';
  String attribute7 = 'Attribute7';
  String attribute8 = 'Attribute8';
  String attribute9 = 'Attribute9';
  String attribute10 = 'Attribute10';
  String geoId = 'GeoId';
  String farmerLoginId = 'FarmerLoginId';
  String activePlotCount = 'ActivePlotCount';
  String aadharNo = 'AadharNo';

//  String active = 'Active';
  String lastModifiedDate = 'LastModifiedDate';
  String lastModifiedBy = 'LastModifiedBy';
  String createdBy = 'CreatedBy';
  String createdDate = 'CreatedDate';

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }

    return _databaseHelper;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $farmerTable($clientId Text PRIMARY KEY, $farmerCode TEXT, $firstName TEXT, $address1 TEXT, $address2 TEXT, $village TEXT, '
        '$taluka TEXT, $photo TEXT, $acarage DOUBLE, $age INTEGER, $mobileNumber TEXT, $farmerId INTEGER, $cropexFarmerCode TEXT, '
        '$sex INTEGER,  $fatherName TEXT, $latLong TEXT, $dateOfBirth TEXT,  $attribute1 TEXT'
        ', $attribute2 TEXT, $attribute3 TEXT, $attribute4 TEXT, $attribute5 TEXT, $attribute6 TEXT, $attribute7 TEXT, $attribute8 TEXT, $attribute9 TEXT, $attribute10 TEXT, $geoId INTEGER'
        ', $farmerLoginId INTEGER,$activePlotCount INTEGER, $aadharNo TEXT,  $lastModifiedDate TEXT, '
        '$createdDate TEXT, $createdBy INTEGER, $lastModifiedBy INTEGER)');
  }

  Future<Database> initializeDatabase() async {
    //getting directory path
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'Cropin_Smartfarm.db';

    //Creating or opening the database
    var smartFarmDb = await openDatabase(path, version: 1, onCreate: _createDb);

    return smartFarmDb;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

//Fetching all farmers
  Future<List<Map<String, dynamic>>> getAllFarmers() async {
    Database dbClient = await this.database;
    var result = await dbClient.rawQuery('SELECT * FROM $farmerTable');

    return result;
  }

  //insert farmer data to db
  Future<int> saveFarmer(Farmers farmers) async {
    Database dbClient = await this.database;
    var result = await dbClient.insert(farmerTable, farmers.toMap());

    return result;
  }

  Future<List<Farmers>> getFarmerListFormMapList() async {
    var mapList = await getAllFarmers();

    List<Farmers> farmerList = List<Farmers>();

    for (Map<String,dynamic> map in mapList) {
      farmerList.add(Farmers.fromMap(map));
    }
    return farmerList;
  }
}
