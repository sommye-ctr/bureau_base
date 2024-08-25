import 'package:bureau_base/components/spacing.dart';
import 'package:bureau_base/resources/strings.dart';
import 'package:bureau_base/resources/style.dart';
import 'package:bureau_base/screens/post_details.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class HomeEmployer extends StatelessWidget {
  const HomeEmployer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            Strings.yourJobPosts,
            style: context.theme.typography.xl2,
          ),
        ),
        const Spacing(large: true),
        ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: const Text(
                  "Lead Construction Worker",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Posted on 15 Mar 2024"),
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
