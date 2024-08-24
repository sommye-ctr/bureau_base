import 'package:bureau_base/components/spacing.dart';
import 'package:bureau_base/resources/assets.dart';
import 'package:bureau_base/resources/strings.dart';
import 'package:bureau_base/screens/otp_verification.dart';
import 'package:bureau_base/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forui/forui.dart';

class SignupScreen extends StatefulWidget {
  static const String route = "/signup";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _validated = true;

  static bool _validatePhone(String phone) {
    RegExp numeric = RegExp(r'^-?[0-9]+$');
    return (phone.length == 10 && numeric.hasMatch(phone));
  }

  void _proceed() async {
    if (_validatePhone(_controller.text) == false) {
      _validated = false;
      setState(() {});
      return;
    }
    //Style.showLoadingDialog(context: context);

    /* try {
      await Auth.getOtp(_controller.text);

      Style.dismisLoadingDialog(context: context);
      Navigator.pushNamed(context, OtpVerificationScreen.routeName,
          arguments: _controller.text);
    } on AuthException catch (error) {
      Style.dismisLoadingDialog(context: context);
      Style.showToast(context: context, text: error.message);
    } catch (error) {
      Style.dismisLoadingDialog(context: context);
      Style.showToast(context: context, text: Strings.unexpectedError);
    } */
    Navigator.pushNamed(
      context,
      OtpVerificationScreen.route,
      arguments: _controller.text,
    );
  }

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
          FTextField(
            enabled: true,
            label: const Text(Strings.mobileNo),
            hint: Strings.mobileHint,
            keyboardType: TextInputType.phone,
            maxLength: 10,
            controller: _controller,
            error: _validated ? null : const Text(Strings.mobileNumberError),
          ),
          const Spacing(
            large: true,
          ),
          FButton(
            onPress: () {
              _proceed();
            },
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
