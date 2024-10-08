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
        return PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) {
            return const GuideScreen();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(0.0, 1.0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.ease),
                ),
              ),
              child: child,
            );
          },
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/scan':
        return PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) {
            return const ScanScreen();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(0.0, 1.0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.ease),
                ),
              ),
              child: child,
            );
          },
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
