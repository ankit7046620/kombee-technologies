import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kombee_demo/common_export/bottom_nav_export.dart';

class BottomNavController extends GetxController {
  //TODO: Implement BottomNavController

  final count = 0.obs;

  void increment() => count.value++;

  int selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> screens = <Widget>[
    HomeView(),
    const CategoryView(),
    const CurateView(),
    const SaleView(),
    const MoreView(),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}
