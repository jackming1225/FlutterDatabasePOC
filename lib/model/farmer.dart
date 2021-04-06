import 'package:flutter_database_app/utils/database_helper.dart';
class Farmers {
  String farmerCode;
  String firstName;
  String address1;
  String address2;
  String village;
  String taluka;
  String photo;
  double acarage;
  int age;
  String mobileNumber;
  int farmerId;
  String cropexFarmerCode;

//  bool synced = true;
  int sex;
  String fatherName;
  String latLong;
  String dateOfBirth;
  String clientId;
  String attribute1;
  String attribute2;
  String attribute3;
  String attribute4;
  String attribute5;
  String attribute6;
  String attribute7;
  String attribute8;
  String attribute9;
  String attribute10;
  int geoId;
  int farmerLoginId;
  int activePlotCount;
  String aadharNo;

//  bool active = true;
  String lastModifiedDate;
  int lastModifiedBy;
  int createdBy;
  String createdDate;
  int localId;

  Farmers(
      {this.photo,
//      this.active,
      this.lastModifiedDate,
      this.lastModifiedBy,
      this.createdBy,
      this.createdDate,
      this.localId,
      this.address1,
      this.address2,
      this.village,
      this.taluka,
      this.acarage,
      this.age,
      this.mobileNumber,
      this.farmerId,
      this.cropexFarmerCode,
//      this.synced,
      this.sex,
      this.fatherName,
      this.latLong,
      this.dateOfBirth,
      this.clientId,
      this.attribute1,
      this.attribute2,
      this.attribute3,
      this.attribute4,
      this.attribute5,
      this.attribute6,
      this.attribute7,
      this.attribute8,
      this.attribute9,
      this.attribute10,
      this.geoId,
      this.farmerLoginId,
      this.activePlotCount,
      this.aadharNo,
      this.firstName,
      this.farmerCode});

  factory Farmers.fromJson(Map<String, dynamic> json) {
    return Farmers(
      firstName: json['firstName'] as String,
      farmerCode: json['farmerCode'] as String,
      address1: json['address1'] as String,
      address2: json['address2'] as String,
      village: json['village'] as String,
      taluka: json['taluka'] as String,
      acarage: json['acarage'] as double,
      age: json['age'] as int,
      mobileNumber: json['mobileNumber'] as String,
      farmerId: json['farmerId'] as int,
      cropexFarmerCode: json['cropexFarmerCode'] as String,
//      synced: true,
      sex: json['sex'] as int,
      fatherName: json['fatherName'] as String,
      latLong: json['latLong'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      clientId: json['clientId'] as String,
      attribute1: json['attribute1'] as String,
      attribute2: json['attribute2'] as String,
      attribute3: json['attribute3'] as String,
      attribute4: json['attribute4'] as String,
      attribute5: json['attribute5'] as String,
      attribute6: json['attribute6'] as String,
      attribute7: json['attribute7'] as String,
      attribute8: json['attribute8'] as String,
      attribute9: json['attribute9'] as String,
      attribute10: json['attribute10'] as String,
      geoId: json['geoId'] as int,
      farmerLoginId: json['farmerLoginId'] as int,
      activePlotCount: json['activePlotCount'] as int,
      aadharNo: json['aadharNo'] as String,
      lastModifiedBy: json['lastModifiedBy'] as int,
      lastModifiedDate: json['lastModifiedDate'] as String,
      createdBy: json['createdBy'] as int,
      createdDate: json['createdDate'] as String,
//      active: json['active'] as bool,
    );
  }

  Farmers.fromMap(Map<String, dynamic> json) {
    this.firstName = json['FirstName'];
    this.farmerCode = json['FarmerCode'];
    this.address1 = json['Address1'];
    this.address2 = json['Address2'];
    this.village = json['Aillage'];
    this.taluka = json['Taluka'];
    this.acarage = json['Acarage'];
    this.age = json['Age'];
    this.mobileNumber = json['MobileNumber'];
    this.farmerId = json['FarmerId'];
    this.cropexFarmerCode = json['CropexFarmerCode'];
//      synced= true,
    this.sex = json['Sex'];
    this.fatherName = json['FatherName'];
    this.latLong = json['LatLong'];
    this.dateOfBirth = json['DateOfBirth'];
    this.clientId = json['ClientId'];
    this.attribute1 = json['Attribute1'];
    this.attribute2 = json['Attribute2'];
    this.attribute3 = json['Attribute3'];
    this.attribute4 = json['Attribute4'];
    this.attribute5 = json['Attribute5'];
    this.attribute6 = json['Attribute6'];
    this.attribute7 = json['Attribute7'];
    this.attribute8 = json['Attribute8'];
    this.attribute9 = json['Attribute9'];
    this.attribute10 = json['Attribute10'];
    this.geoId = json['GeoId'];
    this.farmerLoginId = json['FarmerLoginId'];
    this.activePlotCount = json['ActivePlotCount'];
    this.aadharNo = json['AadharNo'];
    this.lastModifiedBy = json['LastModifiedBy'];
    this.lastModifiedDate = json['LastModifiedDate'];
    this.createdBy = json['CreatedBy'];
    this.createdDate = json['CreatedDate'];
//      active= json['active'] as bool,
  }

  Map<String, dynamic> toMap() {
    var json = new Map<String, dynamic>();
    if (clientId != null) {
      json['clientId'] = clientId;
    }

    json['firstName'] = firstName;
    json['farmerCode'] = farmerCode;
    json['address1'] = address1;
    json['address2'] = address2;
    json['village'] = village;
    json['taluka'] = taluka;
    json['acarage'] = acarage;
    json['age'] = age;
    json['mobileNumber'] = mobileNumber;
    json['farmerId'] = farmerId;
    json['cropexFarmerCode'] = cropexFarmerCode;

    json['sex'] = sex;
    json['fatherName'] = firstName;
    json['latLong'] = latLong;
    json['dateOfBirth'] = dateOfBirth;
    json['attribute1'] = attribute1;
    json['attribute2'] = attribute2;
    json['attribute3'] = attribute3;
    json['attribute4'] = attribute4;
    json['attribute5'] = attribute5;
    json['attribute6'] = attribute6;
    json['attribute7'] = attribute7;
    json['attribute8'] = attribute8;
    json['attribute9'] = attribute9;
    json['attribute10'] = attribute10;
    json['geoId'] = geoId;
    json['farmerLoginId'] = farmerLoginId;
    json['activePlotCount'] = activePlotCount;
    json['aadharNo'] = aadharNo;
    json['lastModifiedBy'] = lastModifiedBy;
    json['lastModifiedDate'] = lastModifiedDate;
    json['createdBy'] = createdBy;
    json['createdDate'] = createdDate;
//    json['active'] = active;
    return json;
  }
}
