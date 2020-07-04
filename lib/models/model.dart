import 'package:flutter/material.dart';

class UserModel {
  String firstName;
  String lastName;
  String phone;
  String email;
  String zip;
  String password;
  String statement;
  int time;
  int day;

  UserModel(
      {this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.zip,
      this.password,
      this.statement,
      this.time,
      this.day});

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'zip': zip,
      'password': password,
      'statement': statement,
      'time': time,
      'day': day
    };
  }

  @override
  String toString() {
    return 'User{firstName: $firstName, lastName: $lastName, phone: $phone, email:$email, zip:$zip, password:$password, statement:$statement, time:$time, day:$day}';
  }
}
