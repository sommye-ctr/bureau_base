import 'package:bureau_base/components/spacing.dart';
import 'package:bureau_base/resources/assets.dart';
import 'package:bureau_base/resources/strings.dart';
import 'package:bureau_base/screens/signup.dart';
import 'package:bureau_base/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forui/forui.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SvgPicture.asset(
            Assets.getStarted,
            height: ScreenSize.getPercentOfHeight(context, 0.5),
          ),
          const Spacing(large: true),
          Text(
            Strings.useAppQ,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const Spacing(large: true),
          FButton(
            onPress: () => Navigator.pushNamed(context, SignupScreen.route,
                arguments: false),
            label: const Text(Strings.wantJobs),
          ),
          const Spacing(large: true),
          FButton(
            onPress: () => Navigator.pushNamed(context, SignupScreen.route,
                arguments: true),
            label: const Text(Strings.wantEmployees),
          ),
        ],
      ),
    );
  }
}
