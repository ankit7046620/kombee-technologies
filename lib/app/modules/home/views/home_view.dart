import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kombee_demo/app/modules/internet/controllers/internet_controller.dart';
import 'package:kombee_demo/common_export/common_export.dart';
import 'package:kombee_demo/common_export/home_common_export.dart';
import 'package:kombee_demo/common_widgets/no_internet.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final internet = Get.find<InternetController>();
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: CommonAppBar(
            title: Image.asset(AssetsConst.logo, width: 120),
            isCenter: false,
            action: _actionWidgets(),
          ),
          body: Obx(() {
            final isConnected = internet.isConnected.value;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!isConnected) ...[
                  NoInternetWidget(),
                ],
                if (isConnected)
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async => controller.onInit(),
                      child: _buildContent(controller),
                    ),
                  ),
              ],
            );
          }),
        );
      },
    );
  }

  Widget _buildContent(HomeController controller) {
    final hasNoData = controller.materialData == null && controller.shopByCategoryData == null && controller.rangeOfPatternData == null && controller.isLoading == false;

    if (hasNoData) {
      return NoDataFoundWidget();
    }

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_isNotEmpty(controller.materialData?.mainStickyMenu)) ...[
            MainStickyMenuWidget(materialList: controller.materialData!),
            BannerListView(isUnStitched: false, slidingImage: controller.materialData!.mainStickyMenu!, unStitchedList: []),
          ],
          if (_isNotEmpty(controller.shopByCategoryData?.shopByCategory))
            _buildSection(
                title: LabelConstant.shopByCategoryLabel, child: CategoryView(shopByCategoryList: controller.shopByCategoryData!.shopByCategory!, rangeOfPatternList: [])),
          if (_isNotEmpty(controller.shopByCategoryData?.shopByFabric))
            _buildSection(
              title: LabelConstant.shopByCategoryLabel,
              child: FabricMaterialView(shopByFabricList: controller.shopByCategoryData!.shopByFabric!, designOccasionList: [], designOccasion: false),
            ),
          if (_isNotEmpty(controller.shopByCategoryData?.unstitched))
            _buildSection(
              title: LabelConstant.unstitchedLabel,
              child: BannerListView(
                isUnStitched: true,
                slidingImage: [],
                unStitchedList: controller.shopByCategoryData!.unstitched!,
              ),
            ),
          if (_isNotEmpty(controller.shopByCategoryData?.boutiqueCollection))
            _buildSection(
              title: LabelConstant.boutiqueCollectionLabel,
              child: BoutiqueCollectionView(
                boutiqueCollectionData: controller.shopByCategoryData!.boutiqueCollection!,
              ),
            ),
          if (_isNotEmpty(controller.rangeOfPatternData?.rangeOfPattern))
            _buildSection(
              title: LabelConstant.rangeOfPatternLabel,
              child: CategoryView(
                isRangeOfPatternList: true,
                rangeOfPatternList: controller.rangeOfPatternData!.rangeOfPattern!,
                shopByCategoryList: [],
              ),
            ),
          if (_isNotEmpty(controller.rangeOfPatternData?.designOccasion))
            _buildSection(
              title: LabelConstant.designAsPerOccasionLabel,
              child: FabricMaterialView(
                shopByFabricList: [],
                designOccasion: true,
                designOccasionList: controller.rangeOfPatternData!.designOccasion!,
              ),
            ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(title),
        const SizedBox(height: 10),
        child,
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: AppText(
        text: title,
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
      ),
    );
  }

  List<Widget> _actionWidgets() {
    return [
      Icon(Icons.search, color: AppColors.greyColor),
      _cartIconWithBadge(),
    ];
  }

  Widget _cartIconWithBadge() {
    return Stack(
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
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: AppText(
                text: "1", // TODO: Replace with dynamic value
                fontSize: 13.sp,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool _isNotEmpty(List? list) => list != null && list.isNotEmpty;
}
