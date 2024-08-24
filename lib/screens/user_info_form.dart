import 'package:bureau_base/components/spacing.dart';
import 'package:bureau_base/resources/strings.dart';
import 'package:bureau_base/resources/style.dart';
import 'package:bureau_base/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class UserInfoScreen extends StatefulWidget {
  static const String route = "/user-info-form";
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime? userDob;
  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      content: ListView(
        children: [
          Center(
            child: Text(
              Strings.personalInfo,
              style: context.theme.typography.xl4,
            ),
          ),
          const Spacing(
            large: true,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: ScreenSize.getPercentOfWidth(context, 0.45),
                      child: FTextField(
                        enabled: true,
                        label: const Text(Strings.firstName),
                        hint: Strings.lorem,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 2) {
                            return "First Name must have atleast 2 characters";
                          }
                          return null;
                        },
                      ),
                    ),
                    const Spacing(),
                    SizedBox(
                      width: ScreenSize.getPercentOfWidth(context, 0.45),
                      child: FTextField(
                        enabled: true,
                        label: const Text(Strings.lastName),
                        hint: Strings.ipsum,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 2) {
                            return "Last Name must have atleast 2 characters";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const Spacing(
                  large: true,
                ),
                FTabs(
                  tabs: [
                    FTabEntry(
                        content: Container(), label: const Text(Strings.male)),
                    FTabEntry(
                        content: Container(),
                        label: const Text(Strings.female)),
                    FTabEntry(
                      content: Container(),
                      label: const Text(Strings.others),
                    )
                  ],
                  onPress: (index) {
                    switch (index) {
                      case 0:
                        gender = "Male";
                        break;
                      case 1:
                        gender = "Female";
                        break;
                      case 2:
                        gender = "Others";
                      default:
                    }
                  },
                ),
                const Spacing(
                  large: true,
                ),
                const Text(
                  Strings.dob,
                  style: TextStyle(
                    color: Style.primaryColor,
                  ),
                ),
                const Spacing(),
                FCalendar(
                  controller: FCalendarController.date(),
                  start: DateTime.utc(1920),
                  end: DateTime.utc(2030),
                  initialType: FCalendarPickerType.yearMonth,
                  onPress: (value) {
                    userDob = value;
                  },
                ),
                const Spacing(
                  large: true,
                ),
                FButton(
                  label: const Text(Strings.proceed),
                  onPress: () {
                    _formKey.currentState?.validate();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
