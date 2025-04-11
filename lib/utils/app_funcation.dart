import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AppFunction {
  static void goToAndReplace(String routeName, {dynamic arguments}) {
    Get.offNamed(routeName, arguments: arguments);
  }

  static Color hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

enum ImageType { svg, png, network, file, jpg, unknown }

extension ImageTypeExtension on String {
  ImageType get imageType {
    if (startsWith('http://') || startsWith('https://')) {
      return ImageType.network;
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (startsWith('file://')) {
      return ImageType.file;
    } else if (endsWith('.jpg')) {
      return ImageType.jpg;
    } else {
      return ImageType.png;
    }
  }
}

// extension HexColorExtension on String {
//   /// Usage: "#FFFFFF".toColor() or "FFFFFF".toColor()
//   Color toColor() {
//     final hex = replaceFirst('#', '');
//     final buffer = StringBuffer();
//     if (hex.length == 6) buffer.write('ff');
//     buffer.write(hex);
//     return Color(int.parse(buffer.toString(), radix: 16));
//   }
// }
