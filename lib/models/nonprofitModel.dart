import 'package:flutter/material.dart';

class NonprofitModel {
  TextEditingController name;
  TextEditingController website;
  NonprofitModel() {
    this.name = TextEditingController();
    this.website = TextEditingController();
  }
  void dispose() {
    this.name.dispose();
    this.website.dispose();
  }
}