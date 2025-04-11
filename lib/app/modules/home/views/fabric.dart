import 'package:flutter/material.dart';
import 'package:kombee_demo/common_export/common_export.dart';
import 'package:kombee_demo/common_method/richtext.dart';
import 'package:kombee_demo/models/bottom_model.dart';
import 'package:kombee_demo/models/middle_model.dart';

class FabricMaterialView extends StatelessWidget {
  final List<ShopByFabric> shopByFabricList;
  final List<DesignOccasion>? designOccasionList;
  final bool designOccasion;

  const FabricMaterialView({
    super.key,
    required this.shopByFabricList,
    this.designOccasionList,
    this.designOccasion = false,
  });

  @override
  Widget build(BuildContext context) {
    final itemCount = designOccasion ? designOccasionList?.length ?? 0 : shopByFabricList.length;

    return SizedBox(
      height: 320.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: EdgeInsetType.xxs.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: designOccasion ? 10.h : 8.h,
          crossAxisSpacing: designOccasion ? 10.w : 16.w,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return designOccasion ? _buildDesignOccasionItem(index) : _buildShopByFabricItem(index);
        },
      ),
    );
  }

  Widget _buildDesignOccasionItem(int index) {
    final item = designOccasionList![index];

    return Container(
      decoration: const BoxDecoration(color: AppColors.borderColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Image section
          Container(
            height: 90.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(item.image ?? "http://via.placeholder.com/350x150"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Name with rich text
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: EdgeInsetType.xxxxxs.w),
              child: getRichText(item.name ?? ""),
            ),
          ),

          // Subname and CTA row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: EdgeInsetType.xxxxxs.w),
            child: Row(
              children: [
                Expanded(
                  child: AppText(
                    text: item.subName ?? "",
                    fontSize: 10.sp,
                  ),
                ),
                AppText(
                  text: item.cta ?? "",
                  fontSize: 10.sp,
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),
        ],
      ),
    );
  }

  Widget _buildShopByFabricItem(int index) {
    final item = shopByFabricList[index];

    return Container(
      height: 130.h,
      width: 130.h,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: EdgeInsetType.xxxxs),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(item.image ?? "http://via.placeholder.com/350x150"),
          fit: BoxFit.cover,
        ),
      ),
      child: AppText(
        text: item.name ?? "",
        fontSize: 14,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
