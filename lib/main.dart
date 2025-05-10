import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const TriGardeningApp());
}

class TriGardeningApp extends StatelessWidget {
  const TriGardeningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // iPhone 13-like design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tri Gardening',
          initialRoute: AppRoutes.home,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
