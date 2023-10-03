import 'package:flutter/material.dart';

class VivritiApp extends StatelessWidget {
  const VivritiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Vivriti App',
      home: FlutterLogo(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
    );
  }
}
