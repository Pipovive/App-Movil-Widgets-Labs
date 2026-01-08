import 'package:flutter/material.dart';
import 'package:widget_lab/common/styles/app_color_styles.dart';

class AppTextStyles {
  static const TextStyle titleText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColorStyles.primaryColor,
  );

  static const TextStyle subTitleText = TextStyle(
    fontSize: 18,
    color: AppColorStyles.primaryColor,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: AppColorStyles.primaryColor,
  );
}
