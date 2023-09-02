part of 'slides_navigation_cubit.dart';

@immutable
abstract class SlidesNavigationState {}

class SlidesNavigationSuccess extends SlidesNavigationState {
  final PageController pageController;
  final List<Widget> pages = [
    const FirstSlide(),
    const SecondSLide(),
    const ThirdSlide(),
  ];
  SlidesNavigationSuccess({required this.pageController});
}
