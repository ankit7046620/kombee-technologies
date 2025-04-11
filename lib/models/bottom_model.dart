import 'package:kombee_demo/constant/model_key.dart';

class BottomModel {
  List<RangeOfPattern>? rangeOfPattern;
  List<DesignOccasion>? designOccasion;
  String? status;
  String? message;

  BottomModel({this.rangeOfPattern, this.designOccasion, this.status, this.message});

  BottomModel.fromJson(Map<String, dynamic> json) {
    if (json[kRangeOfPattern] != null) {
      rangeOfPattern = <RangeOfPattern>[];
      json[kRangeOfPattern].forEach((v) {
        rangeOfPattern!.add(RangeOfPattern.fromJson(v));
      });
    }
    if (json[kDesignOccasion] != null) {
      designOccasion = <DesignOccasion>[];
      json[kDesignOccasion].forEach((v) {
        designOccasion!.add(DesignOccasion.fromJson(v));
      });
    }
    status = json[kStatus];
    message = json[kMessage];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rangeOfPattern != null) {
      data[kRangeOfPattern] = rangeOfPattern!.map((v) => v.toJson()).toList();
    }
    if (designOccasion != null) {
      data[kDesignOccasion] = designOccasion!.map((v) => v.toJson()).toList();
    }
    data[kStatus] = status;
    data[kMessage] = message;
    return data;
  }
}

class RangeOfPattern {
  String? productId;
  String? image;
  String? name;

  RangeOfPattern({this.productId, this.image, this.name});

  RangeOfPattern.fromJson(Map<String, dynamic> json) {
    productId = json[kProductId];
    image = json[kImage];
    name = json[kName];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[kProductId] = productId;
    data[kImage] = image;
    data[kName] = name;
    return data;
  }
}

class DesignOccasion {
  String? productId;
  String? name;
  String? image;
  String? subName;
  String? cta;

  DesignOccasion({this.productId, this.name, this.image, this.subName, this.cta});

  DesignOccasion.fromJson(Map<String, dynamic> json) {
    productId = json[kProductId];
    name = json[kName];
    image = json[kImage];
    subName = json[kSubName];
    cta = json[kCta];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[kProductId] = productId;
    data[kName] = name;
    data[kImage] = image;
    data[kSubName] = subName;
    data[kCta] = cta;
    return data;
  }
}
