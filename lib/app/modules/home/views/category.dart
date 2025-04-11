import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kombee_demo/common_method/richtext.dart';
import 'package:kombee_demo/common_widgets/custom_image.dart';
import 'package:kombee_demo/constant/local_const.dart';
import 'package:kombee_demo/core/app_theme.dart';
import 'package:kombee_demo/models/bottom_model.dart';
import 'package:kombee_demo/models/middle_model.dart';
import 'package:kombee_demo/utils/app.dart';
import 'package:kombee_demo/utils/app_funcation.dart';
import 'package:kombee_demo/utils/app_text.dart';

class CategoryView extends StatelessWidget {
  final List<ShopByCategory> shopByCategoryList;
  final List<RangeOfPattern> rangeOfPatternList;
  final bool isRangeOfPatternList;

  const CategoryView({
    super.key,
    required this.shopByCategoryList,
    required this.rangeOfPatternList,
    this.isRangeOfPatternList = false,
  });

  @override
  Widget build(BuildContext context) {
    final itemCount = isRangeOfPatternList ? rangeOfPatternList.length : shopByCategoryList.length;

    return SizedBox(
      height: 340.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemCount: itemCount,
        itemBuilder: (_, index) {
          return isRangeOfPatternList ? _RangeOfPatternItem(pattern: rangeOfPatternList[index]) : _ShopByCategoryItem(category: shopByCategoryList[index]);
        },
      ),
    );
  }
}

class _RangeOfPatternItem extends StatelessWidget {
  final RangeOfPattern pattern;

  const _RangeOfPatternItem({required this.pattern});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 130.h,
          width: 130.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            image: DecorationImage(
              image: NetworkImage(pattern.image ?? "http://via.placeholder.com/350x150"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(EdgeInsetType.xxxxxs),
          child: AppText(
            text: pattern.name ?? "",
            maxLines: 2,
            fontSize: 14.sp,
            color: AppColors.whiteColor,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class _ShopByCategoryItem extends StatelessWidget {
  final ShopByCategory category;

  const _ShopByCategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    final bgColor = AppFunction.hexToColor(category.tintColor ?? "#FFFFFF");

    return Container(
      width: 160.w,
      decoration: BoxDecoration(color: bgColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageWidget(
            radius: BorderRadius.circular(4),
            height: 110.h,
            width: double.infinity,
            fit: BoxFit.cover,
            imagePath: category.image ?? "http://via.placeholder.com/350x150",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: EdgeInsetType.xxxxs.w, vertical: EdgeInsetType.xxxxxxs.h),
            child: getRichText(category.name ?? ""),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: EdgeInsetType.xxxxs.w),
            child: AppText(
              text: LabelConstant.exploreLabel,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
