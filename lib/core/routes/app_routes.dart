import 'package:flutter/material.dart';

import '../../features/home/presentation/home_screen.dart';

class AppRoutes {
  static const String homeScreen = '/homeScreen';


  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No Route Found ${settings.name}'),
            ),
          ),
        );
    }
  }
}

