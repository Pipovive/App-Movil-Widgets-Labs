import 'package:flutter/material.dart';
import 'package:widget_lab/common/styles/app_color_styles.dart';
import 'package:widget_lab/common/styles/app_text_styles.dart';
import 'package:widget_lab/common/widgets/demo_header.dart';

class ScrollChildScreen extends StatelessWidget {
  const ScrollChildScreen({super.key});

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
            iconData: Icons.swap_vert,
            titleHeader: "Scroll",
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
              Text(
                "¿Qué es SingleChildScrollView?",
                style: AppTextStyles.titleText,
              ),
              SizedBox(height: 24),
              Center(
                child: Icon(
                  Icons.unfold_more,
                  size: 150,
                  color: AppColorStyles.primaryColor,
                ),
              ),
              SizedBox(height: 24),
              Text(
                "SingleChildScrollView es un widget que permite hacer scroll cuando el contenido excede el tamaño de la pantalla. Es útil para formularios, páginas de información, o cualquier contenido que pueda ser más largo que la pantalla.",
                style: AppTextStyles.bodyText,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
              
              Divider(height: 40),
              Text(
                "Ejemplos",
                style: AppTextStyles.titleText.copyWith(fontSize: 18),
              ),
              SizedBox(height: 16),
              
              // Ejemplo 1: Scroll Vertical
              _buildScrollExample(
                title: "Scroll Vertical",
                description: "Desplazamiento hacia arriba y abajo (predeterminado)",
                scrollWidget: _buildVerticalScrollDemo(),
              ),
              
              // Ejemplo 2: Scroll Horizontal
              _buildScrollExample(
                title: "Scroll Horizontal",
                description: "Desplazamiento hacia los lados",
                scrollWidget: _buildHorizontalScrollDemo(),
              ),
              
              // Ejemplo 3: Scroll con padding
              _buildScrollExample(
                title: "Scroll con Padding",
                description: "Agrega espaciado interno al contenido scrolleable",
                scrollWidget: _buildPaddingScrollDemo(),
              ),
              
              // Sección de propiedades
              Divider(height: 40),
              Text(
                "Propiedades importantes",
                style: AppTextStyles.titleText.copyWith(fontSize: 18),
              ),
              SizedBox(height: 16),
              
              _buildPropertyCard(
                icon: Icons.swap_vert,
                property: "scrollDirection",
                description: "Define la dirección del scroll: vertical u horizontal",
                example: "Axis.vertical o Axis.horizontal",
              ),
              
              _buildPropertyCard(
                icon: Icons.space_bar,
                property: "padding",
                description: "Agrega espacio interno al contenido scrolleable",
                example: "EdgeInsets.all(16)",
              ),
              
              _buildPropertyCard(
                icon: Icons.expand,
                property: "physics",
                description: "Controla el comportamiento del scroll (rebote, siempre scrolleable, etc.)",
                example: "BouncingScrollPhysics()",
              ),
              
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Helper para ejemplos de scroll
  Widget _buildScrollExample({
    required String title,
    required String description,
    required Widget scrollWidget,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.titleText.copyWith(fontSize: 16),
        ),
        SizedBox(height: 8),
        Text(
          description,
          style: AppTextStyles.bodyText.copyWith(
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 12),
        scrollWidget,
        SizedBox(height: 24),
      ],
    );
  }

  // Demo de scroll vertical
  Widget _buildVerticalScrollDemo() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: AppColorStyles.primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            10,
            (index) => Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.arrow_downward, size: 20),
                  SizedBox(width: 8),
                  Text(
                    "Item ${index + 1}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Demo de scroll horizontal
  Widget _buildHorizontalScrollDemo() {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        border: Border.all(color: AppColorStyles.primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            8,
            (index) => Container(
              width: 100,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.primaries[index % Colors.primaries.length],
                    Colors.primaries[index % Colors.primaries.length].withOpacity(0.5),
                  ],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_forward, color: Colors.white, size: 30),
                  SizedBox(height: 8),
                  Text(
                    "Card ${index + 1}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Demo de scroll con padding
  Widget _buildPaddingScrollDemo() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        border: Border.all(color: AppColorStyles.primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Este contenido tiene padding interno de 16px en todos los lados.",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "El padding se mantiene mientras haces scroll.",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Útil para mantener espaciado consistente.",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper para tarjetas de propiedades
  Widget _buildPropertyCard({
    required IconData icon,
    required String property,
    required String description,
    required String example,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColorStyles.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: AppColorStyles.primaryColor,
              size: 24,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property,
                  style: AppTextStyles.titleText.copyWith(
                    fontSize: 16,
                    fontFamily: 'monospace',
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: AppTextStyles.bodyText.copyWith(fontSize: 13),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    example,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'monospace',
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}