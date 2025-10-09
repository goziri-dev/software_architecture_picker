import 'package:flutter/material.dart';
import 'package:forui/theme.dart';
import 'package:software_architecture_picker/core/view/media_util.dart';

class TypographyUtil {
  static TextStyle header(BuildContext context) {
    final typography = context.theme.typography;
    final headerStyle = typography.xl.copyWith(
      fontSize: MediaUtil.scale(context, 0.05),
    );
    return headerStyle;
  }

  static TextStyle body(BuildContext context) {
    final typography = context.theme.typography;
    final bodyStyle = typography.sm.copyWith(
      fontSize: MediaUtil.scale(context, 0.02),
    );
    return bodyStyle;
  }

  TypographyUtil._();
}
