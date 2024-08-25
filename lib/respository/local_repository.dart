import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository {
  final String ONBOARDING_DONE = "ONBOARDING_DONE";

  late SharedPreferences sharedPreferences;

  Future<bool> isOnBoardingDone() async {
    sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getBool(ONBOARDING_DONE) ?? false;
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
