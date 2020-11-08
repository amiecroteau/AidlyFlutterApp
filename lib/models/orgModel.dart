import 'dart:ffi';

import 'package:flutter/material.dart';

class OrgModel {
  final String name;
  String main_email;
  final String street;
  final String city;
  final String state;
  final String zip;
  final String phone;
  final double percentage_match;

  OrgModel(this.name, this.main_email, this.street, this.city, this.state,
      this.zip, this.phone, this.percentage_match);
}

//factory OrgModel.fromJson(dynamic json) {
//return OrgModel(json['name'] as String, json['mainContact'] as String,
//json['streetAddress'] as String,  json['city'] as String,  json['state'] as String,
//json['zip'] as String);
//}
