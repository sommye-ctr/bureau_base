import 'package:bureau_base/resources/style.dart';
import 'package:bureau_base/screens/home.dart';
import 'package:bureau_base/screens/otp_verification.dart';
import 'package:bureau_base/screens/post_details.dart';
import 'package:bureau_base/screens/residence.dart';
import 'package:bureau_base/screens/settings.dart';
import 'package:bureau_base/screens/signup.dart';
import 'package:bureau_base/screens/user_info_form.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
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
        content: HomeScreen(),
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
          builder: (context) => const ResidenceInfoScreen(),
        );
      case PostDetailsScreen.route:
        return MaterialPageRoute(
          builder: (context) => const PostDetailsScreen(),
        );
      case SettingsScreen.route:
        return MaterialPageRoute(
          builder: (context) => const SettingsScreen(),
        );
      default:
        return null;
    }
  }
}
