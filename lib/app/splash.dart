import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vivriti_app/core/resources/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, Routes.homeRoute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CachedNetworkImage(
          imageUrl:
              'https://cdn-images-1.medium.com/v2/resize:fit:184/1*OmMk5vql6JUhLctEQfYR4w@2x.png',
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
