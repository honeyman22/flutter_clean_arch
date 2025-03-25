import 'package:clean_arch/core/configs/routes/routes_name.dart';
import 'package:clean_arch/presentation/presentation.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.signin:
        return MaterialPageRoute(
          builder: (_) => SigninScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => PageNotFound(),
        );
    }
  }
}
