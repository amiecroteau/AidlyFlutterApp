import 'package:flutter/material.dart';

class UserModel {
  String firstName;
  String lastName;
  String phone;
  String email;
  String zip;
  String password;

  UserModel(
      {this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.zip,
      this.password});
}
