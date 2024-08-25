import 'package:bureau_base/components/carousel_card.dart';
import 'package:bureau_base/components/spacing.dart';
import 'package:bureau_base/models/job_post.dart';
import 'package:bureau_base/resources/strings.dart';
import 'package:bureau_base/resources/style.dart';
import 'package:bureau_base/screens/post_details.dart';
import 'package:bureau_base/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class HomeEmployee extends StatefulWidget {
  const HomeEmployee({super.key});

  @override
  State<HomeEmployee> createState() => _HomeEmployeeState();
}

class _HomeEmployeeState extends State<HomeEmployee> {
  late List<JobPost> cityJobs;
  late List<JobPost> skillJobs;

  @override
  void initState() {
    super.initState();
    _fetchJobs();
  }

  void _fetchJobs() async {
    //TODO - FETCH JOBS
  }

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
                    itemCount: cityJobs.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const Spacing(),
                    itemBuilder: (context, index) {
                      JobPost jobPost = cityJobs[index];
                      return CarouselCard(
                        imageUrl: jobPost.image,
                        title: jobPost.title,
                        subtitle: jobPost.employer.companyName,
                        postDate: jobPost.datePosted,
                        onClick: () {
                          Navigator.pushNamed(
                            context,
                            PostDetailsScreen.route,
                            arguments: jobPost,
                          );
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
          itemCount: skillJobs.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            JobPost jobPost = cityJobs[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(jobPost.title),
                subtitle: Text(jobPost.employer.companyName),
                tileColor: context.theme.cardStyle.decoration.color,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    PostDetailsScreen.route,
                    arguments: jobPost,
                  );
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
