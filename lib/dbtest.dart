import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_social/models/model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'user_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, firstName TEXT, lastName TEXT, phone TEXT, zip TEXT, password TEXT, statement TEXT)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
  Future<void> insertUser(UserModel user) async {
    // Get a reference to the database.
    final Database db = await database;
    // Insert the Dog into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    await db.insert(
      'user',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    Future<List<UserModel>> users() async {
      // Get a reference to the database.
      final Database db = await database;

      // Query the table for all The Dogs.
      final List<Map<String, dynamic>> maps = await db.query('users');

      // Convert the List<Map<String, dynamic> into a List<Dog>.
      return List.generate(maps.length, (i) {
        return UserModel(
            firstName: maps[i]['firstName'],
            lastName: maps[i]['lastName'],
            email: maps[i]['email'],
            phone: maps[i]['phone'],
            zip: maps[i]['zip'],
            password: maps[i]['password'],
            statement: maps[i]['statement']);
      });
    }

    await insertUser(user);
  }
}
