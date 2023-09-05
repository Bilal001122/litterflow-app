import 'package:flutter/material.dart';
import 'package:litterflow_app/presentation/screens/home/home_screen.dart';
import 'package:litterflow_app/presentation/screens/image_show/image_show_screen.dart';
import 'package:litterflow_app/presentation/screens/layout/app_layout.dart';
import 'package:litterflow_app/presentation/screens/splash/splash_screen.dart';
import '../screens/guide/guide_screen.dart';
import '../screens/scan/scan_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case '/layout':
        return MaterialPageRoute(
          builder: (_) => const AppLayout(),
        );
      case '/guide':
        return MaterialPageRoute(
          builder: (_) => const GuideScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/scan':
        return MaterialPageRoute(
          builder: (_) => const ScanScreen(),
        );
      case '/image_show':
        return MaterialPageRoute(
          builder: (_) => const ImageShowScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
  }
}
