import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kombee_demo/app/modules/internet/controllers/internet_controller.dart';
import 'package:kombee_demo/common_export/common_export.dart';
import 'package:kombee_demo/common_widgets/no_internet.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());

    return GetBuilder<CategoryController>(
      builder: (_) {
        return Scaffold(
            appBar: CommonAppBar(
              title: AppText(
                text: LabelConstant.categoryTitleLabel,
                color: AppColors.greyColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
              isCenter: true,
              action: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: AppColors.greyColor),
                ),
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_bag_outlined, color: AppColors.greyColor),
                    ),
                    Positioned(
                      right: 8,
                      top: 2,
                      child: Container(
                        height: 20.h,
                        width: 20.h,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.circular(RadiusType.xxxxxl.r),
                        ),
                        child: Center(
                          child: AppText(
                            text: "1",
                            fontSize: 14.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            body: Obx(() {
              final isConnected = Get.find<InternetController>().isConnected.value;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (!isConnected) ...[NoInternetWidget()],
                  if (isConnected)
                    Expanded(
                      child: controller.isLoading
                          ? _buildShimmerSingleCell()
                          : (controller.categoryList == null || controller.categoryList!.isEmpty)
                              ? NoDataFoundWidget()
                              : ListView.separated(
                                  padding: EdgeInsets.symmetric(vertical: EdgeInsetType.xxxxs.h),
                                  itemBuilder: (context, index) {
                                    final category = controller.categoryList![index];
                                    return ExpandableNotifier(
                                      initialExpanded: true,
                                      child: ExpandablePanel(
                                        header: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                height: 150.h,
                                                width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      controller.categoryData?.bannerImage ?? "http://via.placeholder.com/350x150",
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 0,
                                              child: Center(
                                                child: Container(
                                                  height: 210.h,
                                                  width: 240.w,
                                                  decoration: BoxDecoration(
                                                    color: Colors.deepPurple.shade100,
                                                    borderRadius: BorderRadius.only(
                                                      topRight: Radius.circular(RadiusType.xxxxxl.r),
                                                      bottomRight: Radius.circular(RadiusType.xxxxxl.r),
                                                    ),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.black26,
                                                        blurRadius: 6,
                                                        spreadRadius: 4,
                                                        offset: Offset(-1, 1),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: EdgeInsetType.s.w),
                                                child: AppText(
                                                  text: category.categoryName ?? "",
                                                  textAlign: TextAlign.start,
                                                  fontSize: 22.sp,
                                                  color: AppColors.blackColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        collapsed: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListView.separated(
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              padding: EdgeInsets.symmetric(horizontal: EdgeInsetType.xxxxs.w, vertical: EdgeInsetType.xxxxxxs.h),
                                              itemBuilder: (context, idx) {
                                                final child = category.child?[idx];
                                                return AppText(
                                                  text: child?.categoryName ?? "",
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w700,
                                                  overflow: TextOverflow.ellipsis,
                                                );
                                              },
                                              separatorBuilder: (context, index) => const Divider(),
                                              itemCount: category.child?.length ?? 0,
                                            ),
                                          ],
                                        ),
                                        expanded: const SizedBox(),
                                        theme: const ExpandableThemeData(
                                          headerAlignment: ExpandablePanelHeaderAlignment.center,
                                          hasIcon: false,
                                          tapHeaderToExpand: true,
                                          fadeCurve: Curves.bounceInOut,
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) => const Divider(height: 1),
                                  itemCount: controller.categoryList!.length,
                                ),
                    ),
                ],
              );
            }));
      },
    );
  }

  Widget _buildShimmerSingleCell() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: EdgeInsetType.xxxxs.h),
      itemCount: 5, // show shimmer for only the first item
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: EdgeInsetType.xxxs.w, vertical: EdgeInsetType.xxxxxs.h),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 150.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(RadiusType.m.r),
              ),
            ),
          ),
        );
      },
    );
  }
}
