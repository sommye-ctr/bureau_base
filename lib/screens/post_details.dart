import 'package:bureau_base/components/rounded_image.dart';
import 'package:bureau_base/components/spacing.dart';
import 'package:bureau_base/models/job_post.dart';
import 'package:bureau_base/resources/constants.dart';
import 'package:bureau_base/resources/strings.dart';
import 'package:bureau_base/resources/style.dart';
import 'package:bureau_base/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class PostDetailsScreen extends StatelessWidget {
  static const String route = "/post-details";

  final JobPost jobPost;
  const PostDetailsScreen({required this.jobPost, super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      footer: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FCard(
          child: FButton(
            onPress: () {
              //TODO - mark as interested
            },
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
                  image: jobPost.image,
                  width: ScreenSize.getPercentOfWidth(context, 0.3),
                  ratio: Constants.postImageRatio,
                ),
                const Spacing(),
                Column(
                  children: [
                    Text(
                      jobPost.title.length > 20
                          ? "${jobPost.title.substring(0, 20)}..."
                          : jobPost.title,
                      style: context.theme.typography.xl2.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacing(),
                    Text(
                      jobPost.employer.companyName,
                      style: context.theme.typography.sm,
                    ),
                    Text(
                      "Posted on ${Style.getDayMonthYear(date: jobPost.datePosted)}",
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
                    Text(jobPost.qualification),
                  ],
                )),
                FBadge(
                    label: Row(
                  children: [
                    FAssets.icons.indianRupee(height: 16),
                    const SizedBox(width: 4),
                    Text(jobPost.quotation),
                  ],
                )),
                FBadge(
                  label: Row(
                    children: [
                      FAssets.icons.pin(height: 16),
                      const SizedBox(width: 4),
                      Text(jobPost.city),
                    ],
                  ),
                ),
              ],
            ),
            const Spacing(large: true),
            FCard(
              title: const Text(Strings.description),
              subtitle: Text(jobPost.description),
            ),
            const Spacing(large: true),
            FCard(
              title: const Text(Strings.aboutEmployer),
              subtitle: Column(
                children: [
                  Text(
                      "Name - ${jobPost.employer.user.firstName} ${jobPost.employer.user.lastName}"),
                  Text("Company - ${jobPost.employer.companyName}"),
                  Text("Address - ${jobPost.employer.address}"),
                  Text("Email - ${jobPost.employer.user.email}")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
