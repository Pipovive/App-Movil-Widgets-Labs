import 'package:flutter/material.dart';
import 'package:widget_lab/common/components/button_image_component.dart';
import 'package:widget_lab/common/components/container_widgets_component.dart';
import 'package:widget_lab/common/constants/app_list_widgest.dart';
import 'package:widget_lab/common/constants/app_strings.dart';
import 'package:widget_lab/common/styles/app_color_styles.dart';
import 'package:widget_lab/common/styles/app_text_styles.dart';
import 'package:widget_lab/common/widgets/profile_header/profile_header.dart';
import 'package:widget_lab/routes/app_routes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ProfileHeader(
            avatarUrl: 'https://i.pravatar.cc/200',
            onMenuSelected: (option) {
              if (option == "settings") {
                Navigator.pushNamed(context, AppRoutes.settingsRoute);
              } else if (option == "perfil") {}
            },
          ),
        ),
        backgroundColor: AppColorStyles.backgroundColor,
      ),

      backgroundColor: AppColorStyles.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 16,
            right: 16,
            bottom: 8,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.menuWidgets,
                      style: AppTextStyles.titleText,
                    ),
                    Text(
                      AppStrings.categorizadoPor,
                      style: AppTextStyles.bodyText,
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonImageComponent(
                    title: AppStrings.avatar,
                    routeName: AppRoutes.avatarRoute,
                  ),
                  ButtonImageComponent(
                    title: AppStrings.layout,
                    routeName: AppRoutes.layoutRoute,
                  ),
                  ButtonImageComponent(
                    title: AppStrings.input,
                    routeName: AppRoutes.inputRoute,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.componentesPorImagenes,
                  style: AppTextStyles.titleText,
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 600,
                child: MasonryGridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemCount: AppListWidgets.listWidgets.length,
                  itemBuilder: (context, index) {
                    return ContainerWidgetsComponent(
                      bodyContainer: AppListWidgets.listWidgets[index]['description'].toString(),
                      urlImage: 'https://picsum.photos/seed/button/200/200',
                      titleContainer: AppListWidgets.listWidgets[index]['title'].toString(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
