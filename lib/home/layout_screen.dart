import 'package:flutter/material.dart';
import 'package:widget_lab/common/constants/app_strings.dart';
import 'package:widget_lab/common/styles/app_color_styles.dart';
import 'package:widget_lab/common/styles/app_text_styles.dart';
import 'package:widget_lab/common/widgets/demo_header.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

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
            iconData: Icons.dashboard,
            titleHeader: AppStrings.layout,
            backgroundColor: AppColorStyles.secondaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text("¿Qué es un Layout?", style: AppTextStyles.titleText),
              SizedBox(height: 24),
              Center(
                child: Image.asset(
                  "assets/images/layout.png", // Cambia esta imagen según tengas
                  height: 200,
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Los widgets de Layout en Flutter son componentes que organizan y estructuran otros widgets en la pantalla. Permiten controlar la posición, el tamaño y la disposición de los elementos hijos, como Column, Row, Stack, Container, entre otros.",
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
                "A continuación se muestran ejemplos de layouts comunes en Flutter:",
                style: AppTextStyles.bodyText,
              ),
              SizedBox(height: 24),

              // Ejemplo Column
              _buildLayoutExample(
                "Column",
                "Organiza widgets verticalmente",
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColorStyles.primaryColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildBox(Colors.red, "1"),
                      _buildBox(Colors.green, "2"),
                      _buildBox(Colors.blue, "3"),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24),

              // Ejemplo Row
              _buildLayoutExample(
                "Row",
                "Organiza widgets horizontalmente",
                Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColorStyles.primaryColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildBox(Colors.red, "1"),
                      _buildBox(Colors.green, "2"),
                      _buildBox(Colors.blue, "3"),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24),

              // Ejemplo Stack
              _buildLayoutExample(
                "Stack",
                "Superpone widgets uno sobre otro",
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColorStyles.primaryColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 10,
                        left: 10,
                        child: _buildBox(Colors.red, "1", size: 60),
                      ),
                      Positioned(
                        top: 30,
                        left: 50,
                        child: _buildBox(Colors.green, "2", size: 60),
                      ),
                      Positioned(
                        top: 50,
                        left: 90,
                        child: _buildBox(Colors.blue, "3", size: 60),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper para ejemplos de layout
  Widget _buildLayoutExample(String title, String description, Widget example) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.titleText.copyWith(fontSize: 16)),
        SizedBox(height: 8),
        Text(
          description,
          style: AppTextStyles.bodyText.copyWith(
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 12),
        example,
      ],
    );
  }

  // Widget helper para crear cajas de colores
  Widget _buildBox(Color color, String number, {double size = 40}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          number,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
