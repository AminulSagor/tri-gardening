import 'package:get/get.dart';

import '../home/home_view.dart';


class AppRoutes {
  static const String home = '/';

  static final routes = [
    GetPage(name: home, page: () => const HomeView()),

  ];
}
