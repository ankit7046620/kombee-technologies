import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kombee_demo/utils/app_text.dart';

class NoDataFoundWidget extends StatelessWidget {
  final String message;

  const NoDataFoundWidget({super.key, this.message = "No data found"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(
        text: message,
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        textAlign: TextAlign.center,
      ),
    );
  }
}
