import 'dart:ffi';

import 'package:flutter/material.dart';

class Organization {
  final String name;
  final String mainContact;
  final String streetAddress;
  final String city;
  final String state;
  final String zip;
  final String phone;
  final String website;
  final Float percentage;

  Organization(this.name, this.mainContact, this.streetAddress, this.city,
      this.state, this.zip, this.phone, this.website, this.percentage);
}
