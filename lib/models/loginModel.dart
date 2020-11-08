import 'package:flutter/material.dart';

class LoginModel {
  TextEditingController email;
  TextEditingController password;

  LoginModel() {
    this.email = TextEditingController();
    this.password = TextEditingController();
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  void dispose() {
    email.dispose();
    password.dispose();
  }

  @override
  String toString() {
    return 'LoginModel{email:$email,password:$password}';
  }
}
