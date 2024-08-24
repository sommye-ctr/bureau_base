import 'package:bureau_base/resources/style.dart';
import 'package:bureau_base/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: ScreenSize.getPercentOfHeight(context, 0.35),
          width: ScreenSize.getPercentOfWidth(context, 1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FCard(
              title: Text("EH"),
              style: context.theme.cardStyle.copyWith(
                decoration: BoxDecoration(
                  color: Style.primaryColor,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            FAssets.icons.mapPinned(),
            const Text('New Delhi'),
          ],
        ),
      ],
    );
  }
}
