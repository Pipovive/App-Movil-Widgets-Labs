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
            onAvatarTap: () {
              Navigator.pushNamed(context, AppRoutes.profileRoute);
            },
            avatarUrl: 'https://i.pravatar.cc/200',
            onMenuSelected: (option) {
              if (option == "settings") {
                Navigator.pushNamed(context, AppRoutes.settingsRoute);
              } else if (option == "profile") {
                Navigator.pushNamed(context, AppRoutes.profileRoute);
              }
            },
          ),
        ),
        backgroundColor: AppColorStyles.backgroundColor,
        elevation: 0, // Sin sombra para diseño más limpio
      ),
      backgroundColor: AppColorStyles.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sección de encabezado
              _buildSectionHeader(
                title: AppStrings.menuWidgets,
                subtitle: AppStrings.daleClick,
              ),

              const SizedBox(height: 12),

              // Botones de categorías
              _buildCategoryButtons(),
              Divider(height: 20),
              const SizedBox(height: 24),

              // Título de componentes
              Text(
                AppStrings.utilizandoLibreria,
                style: AppTextStyles.titleText,
              ),

              const SizedBox(height: 16),

              // Grid de widgets con altura dinámica
              _buildWidgetsGrid(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para el encabezado de sección
  Widget _buildSectionHeader({
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title, style: AppTextStyles.titleText),
          Text(
            subtitle,
            style: AppTextStyles.bodyText.copyWith(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  // Widget para los botones de categorías
  Widget _buildCategoryButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonImageComponent(
            title: AppStrings.avatar,
            routeName: AppRoutes.avatarRoute,
          ),

          const SizedBox(width: 12),

          ButtonImageComponent(
            title: AppStrings.layout,
            routeName: AppRoutes.layoutRoute,
          ),

          const SizedBox(width: 12),

          ButtonImageComponent(
            title: AppStrings.input,
            routeName: AppRoutes.inputRoute,
          ),

          const SizedBox(width: 12),

          ButtonImageComponent(
            title: AppStrings.scrollchild,
            routeName: AppRoutes.scrollChildRoute,
          ),

          const SizedBox(width: 12),

          ButtonImageComponent(
            title: AppStrings.toogle,
            routeName: AppRoutes.toogleRoute,
          ),
        ],
      ),
    );
  }

  // Widget para el grid de widgets con altura dinámica
  Widget _buildWidgetsGrid() {
    return MasonryGridView.count(
      physics: const NeverScrollableScrollPhysics(), // Evita scroll interno
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      itemCount: AppListWidgets.listWidgets.length,
      itemBuilder: (context, index) {
        final widget = AppListWidgets.listWidgets[index];
        return ContainerWidgetsComponent(
          bodyContainer: widget['description'].toString(),
          urlImage: widget['image'].toString(),
          titleContainer: widget['title'].toString(),
        );
      },
    );
  }
}
