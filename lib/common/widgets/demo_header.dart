import 'package:flutter/material.dart';
import 'package:widget_lab/common/styles/app_color_styles.dart';
import 'package:widget_lab/common/styles/app_text_styles.dart';

class DemoHeader extends StatelessWidget {
  final String titleHeader;
  final IconData iconData;
  final Color? backgroundColor;

  const DemoHeader({
    super.key,
    required this.iconData,
    required this.titleHeader,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color _baseColor = Colors.white;

    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_baseColor, backgroundColor ?? Colors.white],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back)),
          Text(titleHeader, style: AppTextStyles.titleText),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(iconData, size: 28, color: AppColorStyles.primaryColor),
          ),
        ],
      ),
    );
  }
}
