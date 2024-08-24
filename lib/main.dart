import 'package:bureau_base/resources/style.dart';
import 'package:bureau_base/respository/local_repository.dart';
import 'package:bureau_base/screens/home.dart';
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
    final theme = FThemeData.inherit(
      colorScheme: FThemes.blue.light.colorScheme.copyWith(
        primary: Style.primaryColor,
      ),
      typography: FThemes.blue.light.typography.copyWith(
        defaultFontFamily: 'Roboto',
      ),
      style: FStyle(
        borderRadius: BorderRadius.circular(16),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => FTheme(
        data: theme.copyWith(
          cardStyle: theme.cardStyle.copyWith(
            decoration: theme.cardStyle.decoration.copyWith(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        child: child!,
      ),
      home: const FScaffold(
        contentPad: false,
        //content: onBoardingDone ? const HomeScreen() : const OnBoardScreen(),  //TODO -DO THIS
        content: HomeScreen(),
      ),
    );
  }
}
