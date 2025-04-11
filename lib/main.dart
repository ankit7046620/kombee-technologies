// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(
    ScreenUtilInit(
        designSize: MediaQueryData.fromView(WidgetsBinding.instance.window).size,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            builder: EasyLoading.init(),
            theme: ThemeData(
              useMaterial3: false,
              primaryColor: Colors.white,
            ),
            title: "EasternInterview",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        }),
  );
}
