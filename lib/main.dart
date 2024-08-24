import 'package:bureau_base/screens/onboard.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => FTheme(
        data: FThemes.blue.light,
        child: child!,
      ),
      home: const FScaffold(
        content: OnBoardScreen(),
      ),
    );
  }
}
