import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kombee_demo/app/modules/BottomNav/controllers/bottom_nav_controller.dart';
import 'package:kombee_demo/common_export/common_export.dart';

class BottomNavView extends GetView<BottomNavController> {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavController());
    return GetBuilder<BottomNavController>(builder: (_) {
      return Scaffold(
        body: Center(child: controller.screens.elementAt(controller.selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: Colors.amberAccent),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: LabelConstant.bottomNavHomeLabel),
            BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted), label: LabelConstant.bottomNavCategoryLabel),
            BottomNavigationBarItem(icon: Icon(Icons.business), label: LabelConstant.bottomNavCurateLabel),
            BottomNavigationBarItem(icon: Icon(Icons.bolt_outlined), label: LabelConstant.bottomNavSaleLabel),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz_outlined), label: LabelConstant.bottomNavMoreLabel),
          ],
          currentIndex: controller.selectedIndex,
          selectedItemColor: Colors.amberAccent,
          onTap: controller.onItemTapped,
        ),
      );
    });
  }

  BottomNavigationBarItem buildBottomNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
