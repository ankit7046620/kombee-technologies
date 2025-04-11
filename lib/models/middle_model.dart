import 'package:kombee_demo/constant/model_key.dart';

class MiddleModel {
  List<ShopByCategory>? shopByCategory;
  List<ShopByFabric>? shopByFabric;
  List<Unstitched>? unstitched;
  List<BoutiqueCollection>? boutiqueCollection;
  String? status;
  String? message;

  MiddleModel({this.shopByCategory, this.shopByFabric, this.unstitched, this.boutiqueCollection, this.status, this.message});

  MiddleModel.fromJson(Map<String, dynamic> json) {
    if (json[kShopByCategory] != null) {
      shopByCategory = <ShopByCategory>[];
      json[kShopByCategory].forEach((v) {
        shopByCategory!.add(ShopByCategory.fromJson(v));
      });
    }
    if (json[kShopByFabric] != null) {
      shopByFabric = <ShopByFabric>[];
      json[kShopByFabric].forEach((v) {
        shopByFabric!.add(ShopByFabric.fromJson(v));
      });
    }
    if (json[kUnstitched] != null) {
      unstitched = <Unstitched>[];
      json[kUnstitched].forEach((v) {
        unstitched!.add(Unstitched.fromJson(v));
      });
    }
    if (json[kBoutiqueCollection] != null) {
      boutiqueCollection = <BoutiqueCollection>[];
      json[kBoutiqueCollection].forEach((v) {
        boutiqueCollection!.add(BoutiqueCollection.fromJson(v));
      });
    }
    status = json[kStatus];
    message = json[kMessage];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (shopByCategory != null) {
      data[kShopByCategory] = shopByCategory!.map((v) => v.toJson()).toList();
    }
    if (shopByFabric != null) {
      data[kShopByFabric] = shopByFabric!.map((v) => v.toJson()).toList();
    }
    if (unstitched != null) {
      data[kUnstitched] = unstitched!.map((v) => v.toJson()).toList();
    }
    if (boutiqueCollection != null) {
      data[kBoutiqueCollection] = boutiqueCollection!.map((v) => v.toJson()).toList();
    }
    data[kStatus] = status;
    data[kMessage] = message;
    return data;
  }
}

class ShopByCategory {
  String? categoryId;
  String? name;
  String? tintColor;
  String? image;
  String? sortOrder;

  ShopByCategory({this.categoryId, this.name, this.tintColor, this.image, this.sortOrder});

  ShopByCategory.fromJson(Map<String, dynamic> json) {
    categoryId = json[kCategoryId];
    name = json[kName];
    tintColor = json[kTintColor];
    image = json[kImage];
    sortOrder = json[kSortOrder];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[kCategoryId] = categoryId;
    data[kName] = name;
    data[kTintColor] = tintColor;
    data[kImage] = image;
    data[kSortOrder] = sortOrder;
    return data;
  }
}

class ShopByFabric {
  String? fabricId;
  String? name;
  String? tintColor;
  String? image;
  String? sortOrder;

  ShopByFabric({this.fabricId, this.name, this.tintColor, this.image, this.sortOrder});

  ShopByFabric.fromJson(Map<String, dynamic> json) {
    fabricId = json[kFabricId];
    name = json[kName];
    tintColor = json[kTintColor];
    image = json[kImage];
    sortOrder = json[kSortOrder];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[kFabricId] = fabricId;
    data[kName] = name;
    data[kTintColor] = tintColor;
    data[kImage] = image;
    data[kSortOrder] = sortOrder;
    return data;
  }
}

class Unstitched {
  String? rangeId;
  String? name;
  String? description;
  String? image;

  Unstitched({this.rangeId, this.name, this.description, this.image});

  Unstitched.fromJson(Map<String, dynamic> json) {
    rangeId = json[kRangeId];
    name = json[kName];
    description = json[kDescription];
    image = json[kImage];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[kRangeId] = rangeId;
    data[kName] = name;
    data[kDescription] = description;
    data[kImage] = image;
    return data;
  }
}

class BoutiqueCollection {
  String? bannerImage;
  String? name;
  String? cta;
  String? bannerId;

  BoutiqueCollection({this.bannerImage, this.name, this.cta, this.bannerId});

  BoutiqueCollection.fromJson(Map<String, dynamic> json) {
    bannerImage = json[kBannerImage];
    name = json[kName];
    cta = json[kCta];
    bannerId = json[kBannerId];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[kBannerImage] = bannerImage;
    data[kName] = name;
    data[kCta] = cta;
    data[kBannerId] = bannerId;
    return data;
  }
}
