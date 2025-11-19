import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../../core/styling/theme_notifier.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  bool isDarkMode = false;
  String appLanguage = "English";
  String? appVersion;

  @override
  void initState() {
    super.initState();
    loadVersion();
  }

  Future<void> loadVersion() async {
    appVersion = await getAppVersion();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    // final currentMode = themeNotifier.themeMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // go back to previous screen
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: [
          // App Mode
          ListTile(
            leading: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            title: Text(
              "App Mode",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (newModeValue) {
                setState(() {
                  isDarkMode = newModeValue;
                });
                themeNotifier.setAppTheme(
                  newModeValue ? ThemeMode.dark : ThemeMode.light,
                );
              },
            ),
          ),

          // // Language
          // ListTile(
          //   title: Text(
          //     "Language",
          //     style: TextStyle(fontWeight: FontWeight.bold),
          //   ),
          //   leading: Icon(Icons.language),
          //   trailing: DropdownButton<String>(
          //     value: appLanguage,
          //     items: <String>["English", "Arabic"]
          //         .map(
          //           (lang) => DropdownMenuItem(value: lang, child: Text(lang)),
          //         )
          //         .toList(),
          //     onChanged: (newValue) {
          //       setState(() {
          //         appLanguage = newValue!;
          //       });
          //       // Localization notify change
          //     },
          //   ),
          // ),

          // Legal Information
          ListTile(
            title: Text(
              "Legal Information",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.info),
            onTap: () {
              // dialog with legal info
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  scrollable: true,
                  title: Text(
                    "Legal Information",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: Text(legalInformationText),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Close"),
                    ),
                  ],
                ),
              );
            },
          ),

          // Contact Us
          ListTile(
            title: Text(
              "Contact and Support",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.mail),
            subtitle: Text("support@Anamel.com"),
          ),

          // App Version
          ListTile(
            leading: Icon(Icons.update),
            title: Text(
              "App Version",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(appVersion ?? "1.0.0"),
          ),

          // Delete Account
          ListTile(
            leading: Icon(Icons.delete_forever, color: Colors.red),
            title: Text(
              "Delete Account",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  icon: Icon(Icons.warning, color: Colors.red, size: 48),
                  title: Text(
                    "Confirm Delete",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    "Are you sure you want to delete your account?\n This action cannot be undone.",
                  ),
                  actions: [

                    TextButton(
                      onPressed: () => GoRouter.of(context).pop(),
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                        // delete account function
                      },
                      child: const Text(
                        "Delete",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

const String legalInformationText = """
Terms & Conditions
By using this application, you agree to follow all rules related to product purchases, payments, and app usage. Prices, product availability, and features may change without prior notice.

Privacy Policy
We collect basic information such as your name, phone number, email, and delivery address to process your orders. Your data is not shared with third parties except for delivery and payment services. You may request account or data deletion at any time.

Refund & Return Policy
Products can be returned within 14 days of delivery if they are unused and in their original packaging. Some items may not be eligible for return. Refunds are processed within 3–7 business days after the returned product is approved.

Shipping Policy
Orders are delivered within 2–5 business days depending on your location. Delivery fees vary by region. Delivery delays may occur due to courier issues or public holidays.

Disclaimer
The app is not responsible for misuse of products. Some information or prices may contain unintentional errors. All purchases depend on product availability.

Contact Us
For support, please contact us at:
support@Anamel.com
""";

Future<String> getAppVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String versionName = packageInfo.version; // version name ("1.0.0")
  // String buildNumber = packageInfo.buildNumber; // build number ("1")
  // String appVersion = "$versionName+$buildNumber";
  return versionName;
}
