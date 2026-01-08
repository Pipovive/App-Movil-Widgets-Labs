import 'package:flutter/material.dart';
import 'package:widget_lab/common/constants/app_strings.dart';
import 'package:widget_lab/common/styles/app_color_styles.dart';
import 'package:widget_lab/common/widgets/demo_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          toolbarHeight: 70,
          title: DemoHeader(
            iconData: Icons.data_usage_sharp,
            titleHeader: AppStrings.menuperfil,
            backgroundColor: AppColorStyles.tertiaryColor,
          ),
        ),
      ),
    );
  }
}
