import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kombee_demo/common_export/common_export.dart';
import 'package:kombee_demo/common_widgets/custom_image.dart';
import 'package:kombee_demo/models/middle_model.dart';

class BannerListView extends StatelessWidget {
  final List slidingImage;
  final List<Unstitched> unStitchedList;
  final bool isUnStitched;

  const BannerListView({
    super.key,
    required this.slidingImage,
    required this.unStitchedList,
    this.isUnStitched = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: EdgeInsetType.xxxxs.h),
        child: CarouselSlider.builder(
          itemCount: isUnStitched ? unStitchedList.length : slidingImage.length,
          options: CarouselOptions(height: 400.h, enlargeCenterPage: true),
          itemBuilder: (context, index, realIdx) {
            return isUnStitched ? _buildUnstitchedBanner(unStitchedList[index]) : _buildImageBanner(context, index);
          },
        ),
      ),
    );
  }

  Widget _buildImageBanner(BuildContext context, int index) {
    final item = slidingImage[index].slider_images[index];

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)].shade100,
        borderRadius: BorderRadius.circular(RadiusType.xs.r),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomImageWidget(
              radius: BorderRadius.circular(4), height: 150.h, width: double.infinity, fit: BoxFit.cover, imagePath: item.image ?? "http://via.placeholder.com/350x150"),
          Positioned(
            left: 40,
            right: 40,
            bottom: 20,
            top: 90,
            child: Container(
              width: double.infinity,
              color: AppColors.whiteColor,
              padding: EdgeInsets.symmetric(horizontal: EdgeInsetType.s.w, vertical: 0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppText(
                    text: item.title ?? "",
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppText(
                    text: LabelConstant.staticTextLabel,
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                  AppText(
                    text: item.cta ?? "",
                    fontSize: 10,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnstitchedBanner(Unstitched item) {
    return Stack(
      children: [
        Container(
          height: 400.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(item.image ?? "http://via.placeholder.com/350x150"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: EdgeInsetType.xxxxxxs.h, left: EdgeInsetType.s.w, right: EdgeInsetType.s.w, bottom: EdgeInsetType.xxxxs.h),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AppText(text: item.description ?? "", fontSize: 16, color: AppColors.whiteColor),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: EdgeInsetType.xxxxs.w, right: EdgeInsetType.xxxxs.w, bottom: EdgeInsetType.s.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AppText(
                  text: item.name ?? "",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
