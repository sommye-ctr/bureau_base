import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

class OnBoardScreen extends StatelessWidget {
  static const String routeName = "/onboard";
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Onboarding(
      swipeableBody: [
        _buildPage1(),
      ],
    );
  }

  Widget _buildPage1() {
    return Container();
  }
}
