import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const TriGardeningApp());
}

class TriGardeningApp extends StatelessWidget {
  const TriGardeningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tri Gardening',
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.routes,
    );
  }
}
