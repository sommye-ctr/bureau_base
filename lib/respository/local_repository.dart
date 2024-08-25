import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository {
  final String USER_ID = "USER_ID";

  late SharedPreferences sharedPreferences;

  Future<int?> getLoggedInUserId() async {
    sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getInt(USER_ID);
  }

  Future<List<dynamic>> getStatesList() async {
    final String resp = await rootBundle.loadString("assets/states.json");

    final List states = jsonDecode(resp);
    return states;
  }

  Future<List<dynamic>> getCitiesList({required String state}) async {
    final String resp = await rootBundle.loadString("assets/cities.json");

    final data = jsonDecode(resp);
    return data[state];
  }
}
