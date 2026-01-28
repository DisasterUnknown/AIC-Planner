import 'package:aci_planner/shared/service/routing_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Force landscape only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  // Enable full-screen immersive mode
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
    overlays: [],
  );

  runApp(const AciPlannerApp());
}

class AciPlannerApp extends StatelessWidget {
  const AciPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routing = RoutingService();

    return MaterialApp(
      title: 'AIC Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      navigatorKey: routing.navigatorKey,
      routes: routing.routes,
      initialRoute: RoutingService.homePage,
    );
  }
}
