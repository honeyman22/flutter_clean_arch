import 'package:clean_arch/core/configs/routes/routes.dart';
import 'package:clean_arch/core/configs/routes/routes_name.dart';
import 'package:clean_arch/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appointment App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFF007AFF), primary: Color(0xFF007AFF)),
        useMaterial3: true,
        textTheme: TextTheme(
          bodySmall: TextStyle(
              color: Color.fromARGB(255, 104, 104, 103),
              fontSize: 12,
              fontWeight: FontWeight.w500),
          headlineLarge: TextStyle(
              color: Color(0xFF0F1828),
              fontSize: 24,
              fontWeight: FontWeight.w600),
          headlineMedium: TextStyle(
              color: Color(0xFF0F1828),
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
      initialRoute: RoutesName.signin,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
