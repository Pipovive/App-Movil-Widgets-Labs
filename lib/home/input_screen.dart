import 'package:flutter/material.dart';
import 'package:widget_lab/common/styles/app_color_styles.dart';
import 'package:widget_lab/common/styles/app_text_styles.dart';
import 'package:widget_lab/common/widgets/demo_header.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

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
            iconData: Icons.edit,
            titleHeader: "Input",
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
                "¿Qué es un Input?",
                style: AppTextStyles.titleText,
              ),
              SizedBox(height: 24),
              Center(
                child: Image.asset("assets/images/input.png", height: 200,),
              ),
              SizedBox(height: 24),
              Text(
                "Los widgets de Input en Flutter permiten al usuario ingresar y editar texto. El más común es TextField, que ofrece múltiples opciones de personalización como iconos, validaciones, y diferentes tipos de teclado.",
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
              
              // Ejemplos usando los helpers
              _buildInputExample(
                title: "TextField básico",
                description: "Campo de texto simple para entrada de datos",
                inputWidget: _buildBasicTextField(),
              ),
              
              _buildInputExample(
                title: "TextField con icono",
                description: "Campo con icono decorativo al inicio",
                inputWidget: _buildIconTextField(),
              ),
              
              _buildInputExample(
                title: "TextField de contraseña",
                description: "Campo que oculta el texto por seguridad",
                inputWidget: _buildPasswordTextField(),
              ),
              
              _buildInputExample(
                title: "TextField con etiqueta",
                description: "Campo con etiqueta flotante",
                inputWidget: _buildLabelTextField(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // HELPER PRINCIPAL - Estructura de cada ejemplo
  Widget _buildInputExample({
    required String title,
    required String description,
    required Widget inputWidget,
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
        inputWidget,
        SizedBox(height: 24),
      ],
    );
  }

  // HELPERS ESPECÍFICOS - Cada tipo de TextField
  
  Widget _buildBasicTextField() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Escribe algo...",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildIconTextField() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Buscar...",
        prefixIcon: Icon(Icons.search, color: AppColorStyles.primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Contraseña",
        prefixIcon: Icon(Icons.lock, color: AppColorStyles.primaryColor),
        suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildLabelTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Nombre completo",
        labelStyle: TextStyle(color: AppColorStyles.primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColorStyles.primaryColor, width: 2),
        ),
      ),
    );
  }
}