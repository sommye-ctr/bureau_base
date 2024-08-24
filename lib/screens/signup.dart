import 'package:bureau_base/components/spacing.dart';
import 'package:bureau_base/resources/assets.dart';
import 'package:bureau_base/resources/strings.dart';
import 'package:bureau_base/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forui/forui.dart';

class SignupScreen extends StatelessWidget {
  static const String route = "/signup";
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            Assets.welcome,
            width: double.infinity,
            height: ScreenSize.getPercentOfHeight(
              context,
              0.4,
            ),
          ),
          const Spacing(
            large: true,
          ),
          Text(
            Strings.getStarted,
            style: context.theme.typography.xl4,
          ),
          Text(
            Strings.enterMobileToProceed,
            style: context.theme.typography.sm,
          ),
          const Spacing(
            large: true,
          ),
          const FTextField(
            enabled: true,
            label: Text(Strings.mobileNo),
            hint: Strings.mobileHint,
            keyboardType: TextInputType.phone,
            maxLength: 10,
          ),
          const Spacing(
            large: true,
          ),
          FButton(
            onPress: () {},
            label: const Text(Strings.next),
            suffix: FButtonIcon(
              icon: FAssets.icons.chevronRight,
            ),
          ),
        ],
      ),
    );
  }
}
