// ignore_for_file: non_constant_identifier_names

import 'package:kombee_demo/constant/model_key.dart';

class TopModel {
  final List<MainStickyMenu>? mainStickyMenu;
  final String? message;
  final String? status;

  TopModel({this.mainStickyMenu, this.message, this.status});

  factory TopModel.fromJson(Map<String, dynamic> json) {
    return TopModel(
      mainStickyMenu: json[kMainStickyMenu] != null ? (json[kMainStickyMenu] as List).map((i) => MainStickyMenu.fromJson(i)).toList() : null,
      message: json[kMessage],
      status: json[kStatus],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[kMessage] = message;
    data[kStatus] = status;
    if (mainStickyMenu != null) {
      data[kMainStickyMenu] = mainStickyMenu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainStickyMenu {
  final String? image;
  final List<SliderImage>? slider_images;
  final String? sortOrder;
  final String? title;

  MainStickyMenu({this.image, this.slider_images, this.sortOrder, this.title});

  factory MainStickyMenu.fromJson(Map<String, dynamic> json) {
    return MainStickyMenu(
      image: json[kImage],
      slider_images: json[kSliderImages] != null ? (json[kSliderImages] as List).map((i) => SliderImage.fromJson(i)).toList() : null,
      sortOrder: json[kSortOrder],
      title: json[kTitle],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[kImage] = image;
    data[kSortOrder] = sortOrder;
    data[kTitle] = title;
    if (slider_images != null) {
      data[kSliderImages] = slider_images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OfferCodeBanner {
  final String? bannerImage;
  final String? type;

  OfferCodeBanner({this.bannerImage, this.type});

  factory OfferCodeBanner.fromJson(Map<String, dynamic> json) {
    return OfferCodeBanner(
      bannerImage: json[kBannerImage],
      type: json[kType],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[kBannerImage] = bannerImage;
    data[kType] = type;
    return data;
  }
}

class SliderImage {
  final String? cta;
  final String? image;
  final String? sortOrder;
  final String? title;

  SliderImage({this.cta, this.image, this.sortOrder, this.title});

  factory SliderImage.fromJson(Map<String, dynamic> json) {
    return SliderImage(
      cta: json[kCta],
      image: json[kImage],
      sortOrder: json[kSortOrder],
      title: json[kTitle],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[kCta] = cta;
    data[kImage] = image;
    data[kSortOrder] = sortOrder;
    data[kTitle] = title;
    return data;
  }
}
