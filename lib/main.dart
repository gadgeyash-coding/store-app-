import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/dashboard/bindings/dashboard_binding.dart';
import 'features/splash/presentation/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      initialBinding: DashboardBinding(),
      home: const SplashScreen(),
    );
  }
}
