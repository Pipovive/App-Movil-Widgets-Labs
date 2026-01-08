import 'package:flutter/material.dart';
import 'package:widget_lab/common/styles/app_color_styles.dart';
import 'package:widget_lab/common/styles/app_text_styles.dart';
import 'package:widget_lab/common/widgets/demo_header.dart';

class ToggleScreen extends StatefulWidget {
  const ToggleScreen({super.key});

  @override
  State<ToggleScreen> createState() => _ToggleScreenState();
}

class _ToggleScreenState extends State<ToggleScreen> {
  // Estados para cada toggle
  bool _basicToggle = false;
  bool _customToggle = true;
  bool _disabledToggle = false;
  bool _notificationToggle = true;
  bool _darkModeToggle = false;

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
            iconData: Icons.toggle_on,
            titleHeader: "Toggle",
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
              Text("¿Qué es un Toggle?", style: AppTextStyles.titleText),
              SizedBox(height: 24),
              Center(
                child: Image.asset("assets/images/toggle.png", width: 200),
              ),
              SizedBox(height: 24),
              Text(
                "Un Toggle o Switch es un widget que permite al usuario alternar entre dos estados: activado (ON) y desactivado (OFF). Es ideal para configuraciones, activar/desactivar funciones, o cualquier opción binaria.",
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

              // Ejemplos de toggles
              _buildToggleExample(
                title: "Switch básico",
                description: "Toggle simple con estado activo/inactivo",
                toggleWidget: Switch(
                  value: _basicToggle,
                  onChanged: (value) {
                    setState(() {
                      _basicToggle = value;
                    });
                  },
                ),
                value: _basicToggle,
              ),

              _buildToggleExample(
                title: "Switch personalizado",
                description: "Toggle con colores personalizados",
                toggleWidget: Switch(
                  value: _customToggle,
                  onChanged: (value) {
                    setState(() {
                      _customToggle = value;
                    });
                  },
                  activeColor: Colors.green,
                  activeTrackColor: Colors.green.withOpacity(0.5),
                ),
                value: _customToggle,
              ),

              _buildToggleExample(
                title: "Switch deshabilitado",
                description: "Toggle que no puede ser modificado",
                toggleWidget: Switch(
                  value: _disabledToggle,
                  onChanged: null, // null deshabilita el switch
                ),
                value: _disabledToggle,
              ),

              // Casos de uso prácticos
              Divider(height: 40),
              Text(
                "Casos de uso",
                style: AppTextStyles.titleText.copyWith(fontSize: 18),
              ),
              SizedBox(height: 16),

              _buildPracticalToggle(
                icon: Icons.notifications,
                title: "Notificaciones",
                description: "Recibir alertas y notificaciones",
                value: _notificationToggle,
                onChanged: (value) {
                  setState(() {
                    _notificationToggle = value;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          Icon(
                            value ? Icons.check_circle : Icons.cancel,
                            color: Colors.white,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              value
                                  ? "Notificaciones activdas Correctamente"
                                  : "Notificaciones desactivadas",
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: value ? Colors.green : Colors.orange,
                      duration: Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ), 
                    ),
                  );
                },
              ),

              _buildPracticalToggle(
                icon: Icons.dark_mode,
                title: "Modo oscuro",
                description: "Cambiar el tema de la aplicación",
                value: _darkModeToggle,
                onChanged: (value) {
                  setState(() {
                    _darkModeToggle = value;
                  });
                },
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Helper para ejemplos de toggle básicos
  Widget _buildToggleExample({
    required String title,
    required String description,
    required Widget toggleWidget,
    required bool value,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.titleText.copyWith(fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: AppTextStyles.bodyText.copyWith(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              toggleWidget,
            ],
          ),
          SizedBox(height: 8),
          Text(
            "Estado: ${value ? 'Activado' : 'Desactivado'}",
            style: TextStyle(
              fontSize: 12,
              color: value ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Helper para casos de uso prácticos
  Widget _buildPracticalToggle({
    required IconData icon,
    required String title,
    required String description,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: value
              ? AppColorStyles.primaryColor.withOpacity(0.3)
              : Colors.grey.shade300,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: value
                  ? AppColorStyles.primaryColor.withOpacity(0.1)
                  : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: value ? AppColorStyles.primaryColor : Colors.grey,
              size: 24,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.titleText.copyWith(fontSize: 16),
                ),
                SizedBox(height: 2),
                Text(
                  description,
                  style: AppTextStyles.bodyText.copyWith(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColorStyles.primaryColor,
          ),
        ],
      ),
    );
  }
}
