import 'package:get/get.dart';

import '../controllers/curate_controller.dart';

class CurateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CurateController>(
      () => CurateController(),
    );
  }
}
