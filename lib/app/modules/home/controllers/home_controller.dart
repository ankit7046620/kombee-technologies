import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:kombee_demo/app/modules/internet/controllers/internet_controller.dart';
import 'package:kombee_demo/constant/api.dart';
import 'package:kombee_demo/models/bottom_model.dart';
import 'package:kombee_demo/models/middle_model.dart';
import 'package:kombee_demo/models/top_model.dart';
import 'package:kombee_demo/network/api_services.dart';

class HomeController extends GetxController {
  TopModel? materialData;
  MiddleModel? shopByCategoryData;
  BottomModel? rangeOfPatternData;

  int current = 0;
  final CarouselController controller = CarouselController();

  bool isLoading = true;

  final internet = Get.find<InternetController>(); // ✅ Injected here

  @override
  void onInit() {
    super.onInit();
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    if (!internet.isConnected.value) {
      EasyLoading.showError("No Internet Connection");
      return;
    }

    try {
      isLoading = true;
      update();

      EasyLoading.show(status: 'Loading...');

      await Future.wait([
        getMaterialData(),
        getShopByCategoryData(),
        getRangeOfPatternData(),
      ]);
    } catch (e) {
      EasyLoading.showError('Failed: $e');
    } finally {
      isLoading = false;
      EasyLoading.dismiss();
      update(); // refresh UI
    }
  }

  Future<void> getMaterialData() async {
    final response = await APIServices.getMethodWithoutHeaderDio(
      apiUrl: ConstApiUrl.topDataUrl,
    );

    final data = TopModel.fromJson(response.data);
    data.mainStickyMenu?.sort((a, b) => a.sortOrder!.compareTo(b.sortOrder!));
    materialData = data;
  }

  Future<void> getShopByCategoryData() async {
    final response = await APIServices.getMethodWithoutHeaderDio(
      apiUrl: ConstApiUrl.middleDataUrl,
    );

    final data = MiddleModel.fromJson(response.data);
    data.shopByCategory?.sort((a, b) => a.sortOrder!.compareTo(b.sortOrder!));
    shopByCategoryData = data;
  }

  Future<void> getRangeOfPatternData() async {
    final response = await APIServices.getMethodWithoutHeaderDio(
      apiUrl: ConstApiUrl.bottomUDataUrl,
    );

    rangeOfPatternData = BottomModel.fromJson(response.data);
  }
}
