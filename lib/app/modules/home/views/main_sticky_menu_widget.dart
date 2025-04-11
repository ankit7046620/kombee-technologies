// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kombee_demo/common_export/common_export.dart';
import 'package:kombee_demo/common_widgets/custom_image.dart';
import 'package:kombee_demo/models/top_model.dart';

class MainStickyMenuWidget extends StatelessWidget {
  TopModel materialList;

  MainStickyMenuWidget({super.key, required this.materialList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: EdgeInsetType.s.w, vertical: EdgeInsetType.xxxxxs.h),
            itemBuilder: (context, index) {
              return Container(
                width: 180.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(RadiusType.xxxxs.r),
                    boxShadow: const [BoxShadow(offset: Offset(1, 2), blurRadius: 4, color: Colors.grey, spreadRadius: 1)]),
                child: Column(
                  children: [
                    CustomImageWidget(
                        radius: BorderRadius.circular(RadiusType.xxxxs.r),
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imagePath: materialList.mainStickyMenu![index].image ?? "http://via.placeholder.com/350x150"),
                    Padding(
                      padding: EdgeInsets.only(top: EdgeInsetType.xxxxxs.h),
                      child: AppText(text: materialList.mainStickyMenu![index].title ?? ''),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return 10.w.horizontalSpace;
            },
            itemCount: materialList.mainStickyMenu!.length,
          )),
        ],
      ),
    );
  }
}
