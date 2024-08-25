import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatelessWidget {
  static const String route = "/settings";
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      platform: DevicePlatform.iOS,
      sections: [
        SettingsSection(
          title: Text("General"),
          tiles: [
            SettingsTile(title: Text("hEY")),
          ],
        ),
      ],
    );
  }
}
