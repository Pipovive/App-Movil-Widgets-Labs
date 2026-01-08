import 'package:flutter/material.dart';
import 'package:widget_lab/common/styles/app_text_styles.dart';

class ButtonImageComponent extends StatelessWidget {
  final String title;
  final String routeName;

  const ButtonImageComponent({
    super.key,
    required this.title,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: SizedBox(
        height: 160,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset("assets/images/file.png", width: 100),
              Text(title, style: AppTextStyles.subTitleText),
            ],
          ),
        ),
      ),
    );
  }
}
