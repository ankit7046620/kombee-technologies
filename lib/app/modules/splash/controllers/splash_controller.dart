import 'package:get/get.dart';
import 'package:kombee_demo/app/routes/app_pages.dart';
import 'package:kombee_demo/utils/app_funcation.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    gotoBottomBar();
  }

  void increment() => count.value++;

  gotoBottomBar() {
    Future.delayed(const Duration(seconds: 2), () {
      AppFunction.goToAndReplace(Routes.BOTTOM_NAV);
    });
  }
}
