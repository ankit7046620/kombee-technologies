import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kombee_demo/app/modules/home/controllers/home_controller.dart';
import 'package:kombee_demo/common_export/common_export.dart';
import 'package:kombee_demo/models/middle_model.dart';

class BoutiqueCollectionView extends StatefulWidget {
  final List<BoutiqueCollection>? boutiqueCollectionData;

  const BoutiqueCollectionView({super.key, this.boutiqueCollectionData});

  @override
  State<BoutiqueCollectionView> createState() => _BoutiqueCollectionViewState();
}

class _BoutiqueCollectionViewState extends State<BoutiqueCollectionView> {
  var homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: EdgeInsetType.xxxxs.h),
      child: Column(
        children: [
          SizedBox(
            // height: 400.h,
            child: CarouselSlider.builder(
              itemCount: widget.boutiqueCollectionData!.length,
              options: CarouselOptions(
                viewportFraction: 1,
                height: 500.h,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  // setState(() {
                  homeController.current = index;
                  homeController.update();
                  // });
                },
              ),
              itemBuilder: (context, index, realIdx) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(widget.boutiqueCollectionData![index].bannerImage ?? "http://via.placeholder.com/350x150"), fit: BoxFit.cover),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: EdgeInsetType.xxxxxxs.h, left: EdgeInsetType.s.w, right: EdgeInsetType.s.w, bottom: EdgeInsetType.xxxxxxs.h),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: AppText(
                                text: widget.boutiqueCollectionData![index].name ?? "",
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: EdgeInsetType.s.w, right: EdgeInsetType.s.w, bottom: EdgeInsetType.s.h),
                          child: AppText(
                            text: widget.boutiqueCollectionData![index].cta ?? "",
                            fontSize: 16.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.boutiqueCollectionData!.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () {
                  // => homeController.controller!.animateToPage(entry.key),
                },
                child: Container(
                  width: homeController.current == entry.key ? 12.h : 8.h,
                  height: homeController.current == entry.key ? 12.h : 8.h,
                  margin: EdgeInsets.symmetric(vertical: EdgeInsetType.xxxxxs.h, horizontal: EdgeInsetType.xxxxxxs.h),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black).withValues(alpha: homeController.current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
