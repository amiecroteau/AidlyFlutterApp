import 'dart:convert';
import 'package:http/http.dart';

import 'constants.dart';

class HttpRequests {
  static String baseUrl = "http://ac8cf18150f3.ngrok.io/";

  static Future<Response> postJson(url, json) {
    return post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
  }

  static Future<bool> login(String email, String password) async {
    var json =
        jsonEncode(<String, String>{'email': email, 'password': password});

    var url = baseUrl + "user/token";

    var response = await postJson(url, json);
    if (response != null) {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        Constants.prefs.setString('token', data['token']);
        Constants.prefs.setString('firstName', data['firstName']);
        Constants.prefs.setString('lastName', data['lastName']);
        Constants.prefs.setString('email', email);
        return true;
      } else {
        Constants.prefs.setString('token', '');
        return false;
      }
    }

    return false;
  }
}

enum requestStatus {
  success,
  fail,
}
