import 'package:kombee_demo/constant/model_key.dart';

class CategoryModel {
  List<Categories>? categories;
  String? bannerImage;
  String? status;
  String? message;

  CategoryModel({this.categories, this.bannerImage, this.status, this.message});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json[kCategories] != null) {
      categories = <Categories>[];
      json[kCategories].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    bannerImage = json[kBannerImage];
    status = json[kStatus];
    message = json[kMessage];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data[kCategories] = categories!.map((v) => v.toJson()).toList();
    }
    data[kBannerImage] = bannerImage;
    data[kStatus] = status;
    data[kMessage] = message;
    return data;
  }
}

class Categories {
  String? categoryId;
  String? categoryName;
  String? parentId;
  List<Child>? child;

  Categories({this.categoryId, this.categoryName, this.parentId, this.child});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json[kCategoryId];
    categoryName = json[kCategoryName];
    parentId = json[kParentId];
    if (json[kChild] != null) {
      child = <Child>[];
      json[kChild].forEach((v) {
        child!.add(Child.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[kCategoryId] = categoryId;
    data[kCategoryName] = categoryName;
    data[kParentId] = parentId;
    if (child != null) {
      data[kChild] = child!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Child {
  String? categoryId;
  String? categoryName;
  String? parentId;

  Child({this.categoryId, this.categoryName, this.parentId});

  Child.fromJson(Map<String, dynamic> json) {
    categoryId = json[kCategoryId];
    categoryName = json[kCategoryName];
    parentId = json[kParentId];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[kCategoryId] = categoryId;
    data[kCategoryName] = categoryName;
    data[kParentId] = parentId;
    return data;
  }
}
