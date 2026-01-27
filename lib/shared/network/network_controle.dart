import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NetworkControl {
  static String discordUrl = 'https://discord.gg/yourserver';
  static String coffeeUrl = 'https://www.buymeacoffee.com/yourlink';

  // Launch any URL safely
  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  // Convenience methods
  static Future<void> openDiscord() async => openUrl(discordUrl);
  static Future<void> openCoffee() async => openUrl(coffeeUrl);
}
