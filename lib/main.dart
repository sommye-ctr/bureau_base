import 'package:bureau_base/resources/style.dart';
import 'package:bureau_base/respository/local_repository.dart';
import 'package:bureau_base/screens/otp_verification.dart';
import 'package:bureau_base/screens/residence.dart';
import 'package:bureau_base/screens/signup.dart';
import 'package:bureau_base/screens/user_info_form.dart';
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
      onGenerateRoute: _handleRoutes,
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
        content: SignupScreen(),
      ),
    );
  }

  Route<dynamic>? _handleRoutes(settings) {
    switch (settings.name) {
      case SignupScreen.route:
        return MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        );
      case OtpVerificationScreen.route:
        return MaterialPageRoute(
          builder: (context) => OtpVerificationScreen(
            phone: settings.arguments,
          ),
        );
      case UserInfoScreen.route:
        return MaterialPageRoute(
          builder: (context) => const UserInfoScreen(),
        );
      case ResidenceInfoScreen.route:
        return MaterialPageRoute(
          builder: (context) => ResidenceInfoScreen(),
        );
      default:
        return null;
    }
  }
}
