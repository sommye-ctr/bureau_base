import 'package:bureau_base/components/spacing.dart';
import 'package:bureau_base/resources/strings.dart';
import 'package:bureau_base/resources/style.dart';
import 'package:bureau_base/screens/residence.dart';
import 'package:bureau_base/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class UserInfoScreen extends StatefulWidget {
  static const String route = "/user-info-form";

  final bool isEmployer;
  const UserInfoScreen({required this.isEmployer, super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime? userDob;
  String gender = Strings.male;

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
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 2) {
                            return Strings.firstNameError;
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
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 2) {
                            return Strings.lastNameError;
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
                        gender = Strings.male;
                        break;
                      case 1:
                        gender = Strings.female;
                        break;
                      case 2:
                        gender = Strings.others;
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
                Hero(
                  tag: Strings.proceed,
                  child: FButton(
                    label: const Text(Strings.proceed),
                    onPress: () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate() &&
                          userDob != null) {
                        Navigator.pushNamed(context, ResidenceInfoScreen.route);
                        return;
                      }
                      if (userDob == null) {
                        Style.showToast(
                            context: context, text: "Enter your Date of Birth");
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
