import 'package:bureau_base/components/rounded_image.dart';
import 'package:bureau_base/components/spacing.dart';
import 'package:bureau_base/resources/constants.dart';
import 'package:bureau_base/resources/strings.dart';
import 'package:bureau_base/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class PostDetailsScreen extends StatelessWidget {
  static const String route = "/post-details";
  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      footer: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FCard(
          child: FButton(
            onPress: () {},
            label: const Text(
              Strings.markAsInterested,
            ),
          ),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RoundedImage(
                  image:
                      "https://marketplace.canva.com/EAFioYQ67Mg/1/0/1131w/canva-beige-and-yellow-modern-job-vacancy-we-are-hiring-poster-9ODt6omvLJs.jpg",
                  width: ScreenSize.getPercentOfWidth(context, 0.3),
                  ratio: Constants.postImageRatio,
                ),
                const Spacing(),
                Column(
                  children: [
                    Text(
                      "Retail Sales Managerr", //TODO SET MAX LENGTH TO 20
                      style: context.theme.typography.xl2.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacing(),
                    Text(
                      "XYZ Kirana Shop",
                      style: context.theme.typography.sm,
                    ),
                    Text(
                      "Posted on 15 Aug 2024",
                      style: context.theme.typography.sm,
                    )
                  ],
                ),
              ],
            ),
            const Spacing(large: true),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FBadge(
                    label: Row(
                  children: [
                    FAssets.icons.notebookPen(height: 16),
                    const SizedBox(width: 4),
                    const Text("Graduate"),
                  ],
                )),
                FBadge(
                    label: Row(
                  children: [
                    FAssets.icons.indianRupee(height: 16),
                    const SizedBox(width: 4),
                    const Text("15k - 30k"),
                  ],
                )),
                FBadge(
                  label: Row(
                    children: [
                      FAssets.icons.pin(height: 16),
                      const SizedBox(width: 4),
                      const Text("Roorkee"),
                    ],
                  ),
                ),
              ],
            ),
            const Spacing(large: true),
            FCard(
              title: const Text(Strings.description),
              subtitle: Text("Lorem Ipsum " * 45),
            ),
            const Spacing(large: true),
            FCard(
              title: const Text(Strings.aboutEmployer),
              subtitle: Text(
                "Name - Somye Mahajan\nCompany - Stark Industries\nAddress - XYZ Road, abc street, pqr city, India\nMobile - 4543454534",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
