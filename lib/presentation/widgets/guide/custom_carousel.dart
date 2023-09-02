import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:litterflow_app/logic/cubits/slides_cubit/slides_navigation_cubit.dart';
import '../../../constants/colors.dart';

class ImageSwipe extends StatefulWidget {
  const ImageSwipe({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageSwipe> createState() => _ImageSwipeState();
}

class _ImageSwipeState extends State<ImageSwipe> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.kPrimaryColor.withOpacity(0.3),
            offset: const Offset(0, 12),
            blurRadius: 50,
          ),
        ],
      ),
      height: 300,
      child: BlocConsumer<SlidesNavigationCubit, SlidesNavigationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is SlidesNavigationSuccess
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: PageView(
                        controller:state.pageController,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (value) {
                          state.pageController.animateToPage(
                            value,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOutCubic,
                          );
                          BlocProvider.of<SlidesNavigationCubit>(context)
                              .changePage(pageController: state.pageController);
                        },
                        children:
                          state.pages,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (int i = 0; i < state.pages.length; i++)
                                FutureBuilder(
                                  future: Future.value(true),
                                  builder: (context,snapshot){
                                    if (!snapshot.hasData) {
                                      return Container();
                                    }
                                    return AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeOutCubic,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 2,
                                      ),
                                      width: state.pageController.page?.round() == i ? 20 : 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.kSecondaryColor,
                                      ),
                                    );
                                  }
                                ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
