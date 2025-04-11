import 'package:get/get.dart';

import '../modules/BottomNav/bindings/bottom_nav_binding.dart';
import '../modules/BottomNav/views/bottom_nav_view.dart';
import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_view.dart';
import '../modules/curate/bindings/curate_binding.dart';
import '../modules/curate/views/curate_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/internet/bindings/internet_binding.dart';
import '../modules/internet/views/internet_view.dart';
import '../modules/more/bindings/more_binding.dart';
import '../modules/more/views/more_view.dart';
import '../modules/sale/bindings/sale_binding.dart';
import '../modules/sale/views/sale_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV,
      page: () => const BottomNavView(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => const CategoryView(),
      binding: CategoryBinding(),
      children: [
        GetPage(
          name: _Paths.CATEGORY,
          page: () => const CategoryView(),
          binding: CategoryBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.CURATE,
      page: () => const CurateView(),
      binding: CurateBinding(),
    ),
    GetPage(
      name: _Paths.SALE,
      page: () => const SaleView(),
      binding: SaleBinding(),
    ),
    GetPage(
      name: _Paths.MORE,
      page: () => const MoreView(),
      binding: MoreBinding(),
    ),
    GetPage(
      name: _Paths.INTERNET,
      page: () => const InternetView(),
      binding: InternetBinding(),
    ),
  ];
}
