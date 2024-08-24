import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository {
  final String ONBOARDING_DONE = "ONBOARDING_DONE";

  late SharedPreferences sharedPreferences;

  Future<bool> isOnBoardingDone() async {
    sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getBool(ONBOARDING_DONE) ?? false;
  }
}
