import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:aidly/models/orgModel.dart';
import 'package:http/http.dart';

import 'constants.dart';

class HttpRequests {
  static String baseUrl = "http://165.227.87.42:1234/";

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

  static Future<Response> getJsonWithJson(
    url,
    json,
  ) {
    return get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
//      body: json,
    );
  }

  static Future<Response> getJson(url) {
    return get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
  }

  static Future<List<OrgModel>> organization() async {
    var url = baseUrl + "company/userMatches";

    var response = await getJson(url);
    if (response != null) {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        var orgs = data["organizations"];
        List<OrgModel> orgList = new List<OrgModel>();
        for (int x = 0; x < orgs.length; x++) {
          orgList.add(OrgModel(
              orgs[x]['name'],
              orgs[x]['main_email'],
              orgs[x]['street'],
              orgs[x]['city'],
              orgs[x]['state'],
              orgs[x]['zip'],
              orgs[x]['phone'],
              orgs[x]['percentage_match'].toDouble()));
        }
        print(orgList);
        return orgList;
      } else {
        Constants.prefs.setString('token', '');
        return new List<OrgModel>();
      }
    }

    return new List<OrgModel>();
  }
}

enum requestStatus {
  success,
  fail,
}
