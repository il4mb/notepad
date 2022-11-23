import 'package:flutter/material.dart';
import 'package:notepad/constants/theme.dart';
import 'package:notepad/routes/app_routes.dart';
import 'package:notepad/routes/route_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NOTEPAD',
      theme: appTheme,
      routes: AppRoutes.routes,
      initialRoute: RouteNames.splashScreen,
      debugShowCheckedModeBanner: false,
    );
  }
}