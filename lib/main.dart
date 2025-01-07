import 'package:authapp/feature/splash/splash_view.dart';
import 'package:authapp/product/initialize/initialize.dart';
import 'package:flutter/material.dart';

void main() async {
  await AppStart.initStartApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashView();
  }
}
