import 'package:bureau_base/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forui/forui.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  const OnboardingWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: ScreenSize.getPercentOfHeight(context, 0.15),
          ),
          SvgPicture.asset(
            image,
            height: ScreenSize.getPercentOfHeight(context, 0.4),
          ),
          Center(
            child: Text(
              title,
              style: context.theme.typography.xl4.copyWith(),
              textAlign: TextAlign.center,
            ),
          ),
          Text(subtitle)
        ],
      ),
    );
  }
}
