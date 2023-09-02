import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../presentation/screens/help/help_screen.dart';
import '../../../presentation/screens/home/home_screen.dart';
import '../../../presentation/screens/scan/scan_screen.dart';
part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationSuccess(screen: const HomeScreen()));

  final List<Widget> _screens = [
    const HomeScreen(),
    const ScanScreen(),
    const HelpScreen(),
  ];

  void updateIndex({required int index}) {
    emit(NavigationSuccess(index: index, screen: _screens[index]));
  }
}
