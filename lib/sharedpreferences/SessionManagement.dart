
import 'dart:convert';
import 'package:rms/server/response/roles_res.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/CommonString.dart';

class SessionManagement {

  static setSession(String key, String value) async {
    final SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setString(key, value);
  }

  static setSessionRoleList(String key, List<Roles> values) async {
    final SharedPreferences preference = await SharedPreferences.getInstance();
    final String encodedData = json.encode(values.map<Map<String, dynamic>>((value) =>value.toJson()).toList());
    await preference.setString(key, encodedData);
  }

  static Future<String> getSession(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key) ?? "";
  }

  static setIntSession(String key, int value) async {
    final SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setInt(key, value);
  }

  static getIntSession(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(key);
  }

  static getSessionRoleList(String key) async {
    List<Roles> roleList = [];
    final SharedPreferences preference = await SharedPreferences.getInstance();
    String? role = preference.getString(key);
    if (role == null) {
      return roleList;
    }
    return (json.decode(role) as List<dynamic>)
        .map<Roles>((item) => Roles.fromJson(item))
        .toList();
  }

  static removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove String
    prefs.clear();
  }

  static Future<String> getAccessToken() {
    return getSession(CommonString.ACCESS_TOKEN);
  }

  static Future<bool> isDirector() async {
    List<Roles> sessionRoleList =
    await getSessionRoleList(CommonString.USER_ROLES);
    for (var item in sessionRoleList) {
      if (item.id == 1) {
        return true;
      }
    }
    return false;
  }

  static clearSession() async {
    final SharedPreferences preference = await SharedPreferences.getInstance();
    await preference.clear();
  }
}