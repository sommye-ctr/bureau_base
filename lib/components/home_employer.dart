import 'package:bureau_base/components/spacing.dart';
import 'package:bureau_base/models/job_post.dart';
import 'package:bureau_base/resources/strings.dart';
import 'package:bureau_base/resources/style.dart';
import 'package:bureau_base/screens/post_details.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class HomeEmployer extends StatefulWidget {
  const HomeEmployer({super.key});

  @override
  State<HomeEmployer> createState() => _HomeEmployerState();
}

class _HomeEmployerState extends State<HomeEmployer> {
  late List<JobPost> jobs;

  @override
  void initState() {
    super.initState();
    _fetchJobs();
  }

  void _fetchJobs() async {
    // TODO - FETCH EMPLOYERS POSTS
  }

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
          itemCount: jobs.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  jobs[index].title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    "Posted on ${Style.getDayMonthYear(date: jobs[index].datePosted)}"),
                tileColor: context.theme.cardStyle.decoration.color,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    PostDetailsScreen.route,
                    arguments: jobs[index],
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
