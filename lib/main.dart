import 'package:bureau_base/resources/style.dart';
import 'package:bureau_base/respository/local_repository.dart';
import 'package:bureau_base/screens/get_started.dart';
import 'package:bureau_base/screens/home.dart';
import 'package:bureau_base/screens/otp_verification.dart';
import 'package:bureau_base/screens/post_details.dart';
import 'package:bureau_base/screens/residence.dart';
import 'package:bureau_base/screens/settings.dart';
import 'package:bureau_base/screens/signup.dart';
import 'package:bureau_base/screens/user_info_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:forui/forui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "lib/.env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? "",
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? "",
  );

  runApp(MyApp(
    userId: await LocalRepository().getLoggedInUserId(),
  ));
}

class MyApp extends StatelessWidget {
  final int? userId;
  const MyApp({
    super.key,
    this.userId,
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
      home: FScaffold(
        contentPad: false,
        content: userId == null
            ? const GetStartedScreen()
            : HomeScreen(
                userId: userId!,
              ),
      ),
    );
  }

  Route<dynamic>? _handleRoutes(settings) {
    switch (settings.name) {
      case SignupScreen.route:
        return MaterialPageRoute(
          builder: (context) => SignupScreen(
            isEmployer: settings.arguments,
          ),
        );
      case OtpVerificationScreen.route:
        return MaterialPageRoute(
          builder: (context) => OtpVerificationScreen(
            email: settings.arguments['email'],
            isEmployer: settings.arguments['isEmployer'],
          ),
        );
      case UserInfoScreen.route:
        return MaterialPageRoute(
          builder: (context) => UserInfoScreen(
            isEmployer: settings.arguments,
          ),
        );
      case ResidenceInfoScreen.route:
        dynamic object = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => ResidenceInfoScreen(
            isEmployer: object['isEmployer'],
            dob: object['dob'],
            firstName: object['firstName'],
            lastName: object['lastName'],
            gender: object['gender'],
          ),
        );
      case PostDetailsScreen.route:
        return MaterialPageRoute(
          builder: (context) => PostDetailsScreen(
            jobPost: settings.arguments,
          ),
        );
      case SettingsScreen.route:
        return MaterialPageRoute(
          builder: (context) => const SettingsScreen(),
        );
      case HomeScreen.route:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            userId: settings.arguments,
          ),
        );
      default:
        return null;
    }
  }
}
