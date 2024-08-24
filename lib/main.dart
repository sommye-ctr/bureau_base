import 'package:bureau_base/resources/style.dart';
import 'package:bureau_base/respository/local_repository.dart';
import 'package:bureau_base/screens/home.dart';
import 'package:bureau_base/screens/onboard.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool onBoarding = await LocalRepository().isOnBoardingDone();

  runApp(MyApp(
    onBoardingDone: onBoarding,
  ));
}

class MyApp extends StatelessWidget {
  final bool onBoardingDone;
  const MyApp({
    super.key,
    this.onBoardingDone = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => FTheme(
        data: FThemeData.inherit(
          colorScheme: FThemes.blue.light.colorScheme.copyWith(
            primary: Style.primaryColor,
          ),
          typography: FThemes.blue.light.typography.copyWith(
            defaultFontFamily: 'Roboto',
          ),
        ),
        child: child!,
      ),
      home: FScaffold(
        contentPad: false,
        content: onBoardingDone ? const HomeScreen() : const OnBoardScreen(),
      ),
    );
  }
}
