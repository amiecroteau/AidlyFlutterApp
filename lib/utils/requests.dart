import 'dart:convert';
import 'package:http/http.dart';

class HttpRequests {
  static String baseUrl = "http://localhost:5000/";

  static Future<Response> postJson(url, json) {
    return post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
  }

  static Future<bool> login(email, password) async {
    var json =
        jsonEncode(<String, String>{'email': email, 'password': password});

    var url = baseUrl + "user/token";

    var response = await postJson(url, json);
    if (response != null) {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        return true;
      } else {
        print('Wrong Credentials');
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
