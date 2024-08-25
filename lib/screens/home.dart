import 'package:bureau_base/components/carousel_card.dart';
import 'package:bureau_base/components/home_employee.dart';
import 'package:bureau_base/components/home_employer.dart';
import 'package:bureau_base/components/spacing.dart';
import 'package:bureau_base/resources/strings.dart';
import 'package:bureau_base/resources/style.dart';
import 'package:bureau_base/screens/post_details.dart';
import 'package:bureau_base/screens/settings.dart';
import 'package:bureau_base/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8, right: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      FAvatar.raw(
                        child: const Text("SM"),
                      ),
                      const Spacing(),
                      Text(
                        "Hello Somye",
                        style: context.theme.typography.lg
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, SettingsScreen.route),
                      icon: FAssets.icons.settings())
                ],
              ),
            ),
            const Spacing(large: true),
            const HomeEmployer(),
          ],
        ),
      ),
    );
  }
}
