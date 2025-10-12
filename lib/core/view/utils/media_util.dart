import 'package:flutter/material.dart';

class MediaUtil {
  static double scale(BuildContext context, double value) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return screenWidth * value;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 900;
  }

  static double scaleToDevice(BuildContext context, double value) {
    return isMobile(context)
        ? MediaQuery.sizeOf(context)
              .width //scale(context, 1 - value)
        : scale(context, value);
  }

  MediaUtil._();
}
