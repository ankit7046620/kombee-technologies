import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:kombee_demo/constant/api.dart';
import 'package:kombee_demo/models/category_model.dart';
import 'package:kombee_demo/network/api_services.dart';

class CategoryController extends GetxController {
  List<Categories>? categoryList;
  CategoryModel? categoryData;
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    getCategoryData();
  }

  getCategoryData() async {
    dio.Response finalData = await APIServices.getMethodWithoutHeaderDio(
      apiUrl: ConstApiUrl.categoryDataUrl,
    );
    CategoryModel categoryResponse = CategoryModel.fromJson(finalData.data);
    categoryData = categoryResponse;
    categoryList = categoryResponse.categories;
    isLoading = false;
    update();
  }
}
