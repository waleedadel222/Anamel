import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/styling/theme_notifier.dart';

class AppSettingsScreen extends StatelessWidget {
  const AppSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final currentMode = themeNotifier.themeMode;

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text("Light"),
            value: ThemeMode.light,
            groupValue: currentMode,
            onChanged: (mode) => themeNotifier.setAppTheme(mode!),
          ),
          RadioListTile<ThemeMode>(
            title: const Text("Dark"),
            value: ThemeMode.dark,
            groupValue: currentMode,
            onChanged: (mode) => themeNotifier.setAppTheme(mode!),
          ),
          RadioListTile<ThemeMode>(
            title: const Text("System"),
            value: ThemeMode.system,
            groupValue: currentMode,
            onChanged: (mode) => themeNotifier.setAppTheme(mode!),
          ),
        ],
      ),
    );
  }
}
