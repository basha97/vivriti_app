import 'package:flutter/material.dart';
import 'package:vivriti_app/core/resources/route_manager.dart';

class VivritiApp extends StatelessWidget {
  const VivritiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Vivriti App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
