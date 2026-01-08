import 'package:flutter/material.dart';
import 'package:widget_lab/common/styles/app_color_styles.dart';
import 'package:widget_lab/common/styles/app_text_styles.dart';
import 'package:widget_lab/common/widgets/demo_header.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          toolbarHeight: 70,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: DemoHeader(
            iconData: Icons.person,
            titleHeader: "Avatar",
            backgroundColor: AppColorStyles.secondaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView( // Para evitar overflow en pantallas pequeñas
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Alineación más natural
            children: [
              SizedBox(height: 16),
              Text(
                "¿Qué es un Avatar?",
                style: AppTextStyles.titleText,
              ),
              SizedBox(height: 24),
              Center(
                child: Image.asset(
                  "assets/images/user.png",
                  height: 200, // Reducido un poco
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Avatar es un widget utilizado para representar la imagen de un usuario, generalmente en perfiles, listas o encabezados. Puede mostrar imágenes, íconos o iniciales dentro de una forma circular.",
                style: AppTextStyles.bodyText,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
              
              // Sección de ejemplos con título
              Divider(height: 40),
              Text(
                "Ejemplos",
                style: AppTextStyles.titleText.copyWith(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                "A continuación se muestran ejemplos de avatares utilizando diferentes fuentes de imágenes:",
                style: AppTextStyles.bodyText,
              ),
              SizedBox(height: 100),
              
              // Ejemplos mejorados con etiquetas
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildAvatarExample(
                    "Red",
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage("https://i.pravatar.cc/200"),
                    ),
                  ),
                  _buildAvatarExample(
                    "Local",
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage("assets/images/user.png"),
                    ),
                  ),
                  _buildAvatarExample(
                    "Iniciales",
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: AppColorStyles.primaryColor,
                      child: Text(
                        "JD",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper para ejemplos
  Widget _buildAvatarExample(String label, Widget avatar) {
    return Column(
      children: [
        avatar,
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}