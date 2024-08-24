import 'dart:async';

import 'package:bureau_base/components/spacing.dart';
import 'package:bureau_base/resources/assets.dart';
import 'package:bureau_base/resources/constants.dart';
import 'package:bureau_base/resources/strings.dart';
import 'package:bureau_base/resources/style.dart';
import 'package:bureau_base/screens/user_info_form.dart';
import 'package:bureau_base/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forui/forui.dart';

class OtpVerificationScreen extends StatefulWidget {
  static const String route = "/otp-verify";

  final String phone;
  const OtpVerificationScreen({required this.phone, super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  Timer? _timer;
  int _currentSecond = Constants.otpResendDuration;
  String? otp;

  void _startCountdown() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_currentSecond <= 0) {
          _timer?.cancel();
          setState(() {});
        } else {
          _currentSecond--;
          setState(() {});
        }
      },
    );
  }

  bool isTimerRunning() {
    return _timer != null && _timer!.isActive;
  }

  void onProceed() {
    if (otp == null) return;
    // Style.showLoadingDialog(context: context);
    /* try {
      //Auth.verifyOtp(otp!, widget.phone);
    } on AuthException catch (e) {
      Style.dismisLoadingDialog(context: context);
      Style.showToast(context: context, text: e.message);
    } catch (e) {
      Style.dismisLoadingDialog(context: context);
      Style.showToast(context: context, text: Strings.unexpectedError);
    }
    Style.dismisLoadingDialog(context: context); */
    //Navigator.pushNamed(context, UserInfoScreen.route);
  }

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            Assets.verifyOtp,
            height: ScreenSize.getPercentOfHeight(context, 0.5),
          ),
          const Spacing(),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.verificationCode,
                        style: context.theme.typography.xl4,
                      ),
                      Text(
                        Strings.verificationHeading,
                        style: context.theme.typography.sm,
                      ),
                      const Spacing(
                        large: true,
                      ),
                      OtpTextField(
                        numberOfFields: 6,
                        showFieldAsBox: true,
                        borderRadius:
                            BorderRadius.circular(Style.smallRoundEdgeRadius),
                        focusedBorderColor: Theme.of(context).primaryColor,
                        onSubmit: (value) => otp = value,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: isTimerRunning()
                              ? null
                              : () {
                                  //Style.showToast(
                                  //  context: context, text: "heyyy");
                                },
                          child: Text(isTimerRunning()
                              ? "Resend OTP in $_currentSecond s"
                              : "Resend OTP"),
                        ),
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
                              Navigator.pushNamed(
                                  context, UserInfoScreen.route);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
