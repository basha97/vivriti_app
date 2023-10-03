import 'package:flutter/material.dart';
import 'package:vivriti_app/app/splash.dart';
import 'package:vivriti_app/features/home/view/home.dart';

class Routes {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No routes found')),
        body: const Center(child: Text('No routes found')),
      ),
    );
  }
}
