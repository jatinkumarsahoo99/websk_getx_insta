import 'package:get/get.dart';

import '../modules/detailscreen/bindings/detailscreen_binding.dart';
import '../modules/detailscreen/views/detailscreen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/homescreen/bindings/homescreen_binding.dart';
import '../modules/homescreen/views/homescreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOMESCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOMESCREEN,
      page: () => HomescreenView(),
      binding: HomescreenBinding(),
    ),
    GetPage(
      name: _Paths.DETAILSCREEN,
      page: () =>  DetailscreenView(),
      binding: DetailscreenBinding(),
    ),
  ];
}
