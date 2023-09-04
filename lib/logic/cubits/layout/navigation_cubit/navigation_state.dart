part of 'navigation_cubit.dart';

@immutable
abstract class NavigationState {}

class NavigationSuccess extends NavigationState {
  final int index;
  final Widget screen;

  NavigationSuccess({this.index = 0, required this.screen});
}
