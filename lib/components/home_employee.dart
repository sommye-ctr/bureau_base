import 'package:bureau_base/components/carousel_card.dart';
import 'package:bureau_base/components/spacing.dart';
import 'package:bureau_base/resources/strings.dart';
import 'package:bureau_base/resources/style.dart';
import 'package:bureau_base/screens/post_details.dart';
import 'package:bureau_base/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class HomeEmployee extends StatelessWidget {
  const HomeEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        Card(
          color: Style.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.popularJobsIn,
                  style: context.theme.typography.lg,
                ),
                const Spacing(),
                SizedBox(
                  height: ScreenSize.getPercentOfHeight(context, 0.45),
                  child: ListView.separated(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const Spacing(),
                    itemBuilder: (context, index) {
                      return CarouselCard(
                        imageUrl:
                            "https://marketplace.canva.com/EAFioYQ67Mg/1/0/1131w/canva-beige-and-yellow-modern-job-vacancy-we-are-hiring-poster-9ODt6omvLJs.jpg",
                        title: "Lead Construction Worker",
                        subtitle: "XYZ Corporate LTD",
                        postDate: DateTime.now(),
                        onClick: () {
                          Navigator.pushNamed(context, PostDetailsScreen.route);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacing(large: true),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            Strings.jobsForYou,
            style: context.theme.typography.xl2,
          ),
        ),
        ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: const Text("Lead Construction Worker"),
                subtitle: const Text("XYZ Corporate LTD"),
                tileColor: context.theme.cardStyle.decoration.color,
                onTap: () {
                  Navigator.pushNamed(context, PostDetailsScreen.route);
                },
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Style.smallRoundEdgeRadius),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
