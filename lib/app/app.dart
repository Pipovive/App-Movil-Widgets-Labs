import 'package:flutter/material.dart';
import 'package:widget_lab/home/avatar_screen.dart';
import 'package:widget_lab/home/home_screen.dart';
import 'package:widget_lab/home/input_screen.dart';
import 'package:widget_lab/home/layout_screen.dart';
import 'package:widget_lab/home/settings_screen.dart';
import 'package:widget_lab/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.avatarRoute: (context) => AvatarScreen(),
        AppRoutes.inputRoute: (context) => InputScreen(),
        AppRoutes.layoutRoute: (context) => LayoutScreen(),
        AppRoutes.settingsRoute: (context) => SettingsScreen()
      },
      title: 'Laboratorio de Widgets',
      debugShowCheckedModeBanner: false,
      home: HomeScreen());
  }
}
