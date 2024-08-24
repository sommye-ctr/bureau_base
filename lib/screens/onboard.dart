import 'package:bureau_base/components/onboarding_widget.dart';
import 'package:bureau_base/resources/assets.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

class OnBoardScreen extends StatelessWidget {
  static const String routeName = "/onboard";
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Onboarding(
      swipeableBody: const [
        OnboardingWidget(
          title: "Find Jobs",
          subtitle: "Find job vacancies in your hometown by various employers.",
          image: Assets.findJobs,
        ),
      ],
    );
  }
}
