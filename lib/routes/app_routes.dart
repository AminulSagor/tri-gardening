import 'package:get/get.dart';
import 'package:tri_gerdening/message/message_view.dart';
import 'package:tri_gerdening/nursery/nursery_view.dart';
import 'package:tri_gerdening/profile/profile_view.dart';
import 'package:tri_gerdening/tool_shop/tool_shop_view.dart';

import '../find_gardener/gardener_view.dart';
import '../home/home_view.dart';


class AppRoutes {
  static const String home = '/';
  static const String gardener = '/gardener';
  static const String nursery = '/nursery';
  static const String toolShop = '/tool-shop';
  static const String profile = '/profile';
  static const String message = '/message';

  static final routes = [
    GetPage(name: home, page: () => const HomeView()),
    GetPage(name: gardener, page: () => const GardenerView()),
    GetPage(name: nursery, page: () => const NurseryView()),
    GetPage(name: toolShop, page: () => const ToolShopView()),
    GetPage(name: profile, page: () => const ProfileView()),
    GetPage(name: message , page: () => MessageView()),

  ];
}
