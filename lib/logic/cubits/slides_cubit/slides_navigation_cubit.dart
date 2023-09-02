import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:litterflow_app/presentation/widgets/guide/first_carousel_slide.dart';
import 'package:litterflow_app/presentation/widgets/guide/second_carousel_slide.dart';
import 'package:litterflow_app/presentation/widgets/guide/third_carousel_slide.dart';
import 'package:meta/meta.dart';

part 'slides_navigation_state.dart';

class SlidesNavigationCubit extends Cubit<SlidesNavigationState> {
  SlidesNavigationCubit()
      : super(
          SlidesNavigationSuccess(
            pageController: PageController(initialPage: 0),
          ),
        );

  void changePage({required PageController pageController}) {
    emit(SlidesNavigationSuccess(pageController: pageController));
  }
}
