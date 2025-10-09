import 'package:flutter/material.dart';

class MediaUtil {
  static double scaleText(BuildContext context, double value) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return screenWidth * value;
  }

  MediaUtil._();
}
