import 'package:aic_planner/pages/about/about_page.dart';
import 'package:aic_planner/pages/aic_planner/aic_planner_page.dart';
import 'package:aic_planner/pages/home/home_page.dart';
import 'package:aic_planner/pages/save_slots/save_slot_page.dart';
import 'package:aic_planner/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';

class RoutingService {
  static final RoutingService _instance = RoutingService._internal();
  factory RoutingService() => _instance;
  RoutingService._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String homePage = '/';
  static const String aboutPage = '/about';
  static const String aciPlannerPage = '/aic_planner';
  static const String saveSlotPage = '/save_slot';
  static const String settingsPage = '/settings';

  Future<dynamic>? navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic>? navigateWithoutAnimationTo(String routeName) {
    final routeBuilder = routes[routeName];
    if (routeBuilder == null) return null;

    return navigatorKey.currentState?.push(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => routeBuilder(context),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  void goBack() {
    navigatorKey.currentState?.pop();
  }

  Map<String, WidgetBuilder> get routes => {
    homePage: (context) => const HomePage(),
    aboutPage: (context) => const AboutPage(),
    aciPlannerPage: (context) => const AciPlannerPage(),
    saveSlotPage: (context) => const SaveSlotPage(),
    settingsPage: (context) => const SettingsPage(),
  };
}
