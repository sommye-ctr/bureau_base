import 'package:bureau_base/resources/style.dart';
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
      home: const FScaffold(
        contentPad: false,
        content: Text("data"),
      ),
    );
  }
}
