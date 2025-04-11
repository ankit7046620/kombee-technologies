// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class StickyMenuCardShimmer extends StatelessWidget {
  const StickyMenuCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        _MainStickyMenuWidget(),
      ],
    ));
  }

  Widget _MainStickyMenuWidget() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: 180.w,
        height: 134.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
              offset: Offset(1, 2),
              blurRadius: 4,
              color: Colors.grey,
              spreadRadius: 1,
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.h, left: 8.w, right: 8.w),
              child: Container(
                height: 12.h,
                width: 100.w,
                color: Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
