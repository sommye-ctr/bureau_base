import 'package:bureau_base/components/spacing.dart';
import 'package:bureau_base/resources/assets.dart';
import 'package:bureau_base/resources/strings.dart';
import 'package:bureau_base/screens/otp_verification.dart';
import 'package:bureau_base/utils/screen_size.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forui/forui.dart';

class SignupScreen extends StatefulWidget {
  static const String route = "/signup";
  final bool isEmployer;
  const SignupScreen({required this.isEmployer, super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _validated = true;

  static bool _validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  void _proceed() async {
    if (_validateEmail(_controller.text) == false) {
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
      arguments: {
        "email": _controller.text,
        "isEmployer": widget.isEmployer,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
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
              Strings.enterEmailToProceed,
              style: context.theme.typography.sm,
            ),
            const Spacing(
              large: true,
            ),
            FTextField.email(
              enabled: true,
              hint: Strings.mailHint,
              controller: _controller,
              error: _validated ? null : const Text(Strings.emailError),
            ),
            const Spacing(
              large: true,
            ),
            Hero(
              tag: Strings.proceed,
              child: Center(
                child: FButton(
                  label: const Text(Strings.proceed),
                  onPress: () {
                    _proceed();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
