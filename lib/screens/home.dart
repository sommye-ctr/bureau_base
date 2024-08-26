import 'package:bureau_base/components/home_employee.dart';
import 'package:bureau_base/components/home_employer.dart';
import 'package:bureau_base/components/spacing.dart';
import 'package:bureau_base/models/user.dart';
import 'package:bureau_base/screens/create_post.dart';
import 'package:bureau_base/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "/home";
  final int userId;
  const HomeScreen({required this.userId, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User user;

  @override
  void initState() {
    super.initState();
    _fetchUser();
  }

  void _fetchUser() async {
    // TODO - fetches the user object
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        floatingActionButton: user.isEmployer
            ? FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pushNamed(context, CreatePostScreen.route);
                },
                icon: FAssets.icons.filePlus2(),
                label: const Text("Create a Job Post"),
              )
            : null,
        body: SizedBox(
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
                          child: Text(
                              "${user.firstName.characters.first}${user.lastName.characters.first}"),
                        ),
                        const Spacing(),
                        Text(
                          "Hello ${user.firstName} ${user.lastName}",
                          style: context.theme.typography.lg
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pushNamed(
                              context, SettingsScreen.route),
                          icon: FAssets.icons.settings(),
                        ),
                        const Spacing(),
                        IconButton(
                            onPressed: () {}, icon: FAssets.icons.logOut()),
                      ],
                    )
                  ],
                ),
              ),
              const Spacing(large: true),
              if (user.isEmployer) const HomeEmployer(),
              if (user.isEmployee) const HomeEmployee(),
            ],
          ),
        ),
      ),
    );
  }
}
