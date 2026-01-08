import 'package:flutter/material.dart';
import 'package:widget_lab/common/constants/app_strings.dart';

class ProfileHeader extends StatelessWidget {
  final String avatarUrl;
  final void Function(String option) onMenuSelected;

  const ProfileHeader({
    super.key,
    required this.avatarUrl,
    required this.onMenuSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 26, // un poco más grande
          backgroundColor: const Color(0xFF727272), // borde
          child: CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(avatarUrl),
          ),
        ),
        PopupMenuButton<String>(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onSelected: onMenuSelected,
          itemBuilder: (context) => const [
            PopupMenuItem(value: 'profile', child: Text(AppStrings.verPerfil)),

            PopupMenuItem(
              value: 'settings',
              child: Text(AppStrings.verOpciones),
            ),
            PopupMenuItem(
              value: 'logout',
              child: Text(AppStrings.cerrarCesion),
            ),
          ],
        ),
      ],
    );
  }
}
