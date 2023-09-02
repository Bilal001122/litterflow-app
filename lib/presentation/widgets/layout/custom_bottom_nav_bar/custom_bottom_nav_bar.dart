import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:litterflow_app/logic/cubits/navigation_cubit/navigation_cubit.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/icons.dart';
import '../../../../constants/strings.dart';
import 'custom_bottom_nav_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final NavigationSuccess state;

  const CustomBottomNavigationBar({
    super.key,
    required this.state,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      _animationController,
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      decoration: const BoxDecoration(
        color: AppColors.kWhiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomBottomNavBarItem(
            state: widget.state,
            index: 0,
            icon: MyIcons.home,
            label: AppGlobalStrings.homeButton,
          ),
          Transform.translate(
            offset: const Offset(0, -20),
            child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return CustomPaint(
                    painter: CustomBottomNavBarItemPainter(
                      opacity: _animation.value * 0.4,
                      radiusController: _animation.value * 0.8,
                    ),
                    child: Material(
                      color: AppColors.kPrimaryColor,
                      shape: const CircleBorder(),
                      animationDuration: const Duration(milliseconds: 1000),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        splashColor: AppColors.kSecondaryColor.withOpacity(0.2),
                        onTap: () {
                          BlocProvider.of<NavigationCubit>(context)
                              .updateIndex(index: 1);
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          padding: const EdgeInsets.all(6),
                          child: const Icon(
                            MyIcons.scan,
                            color: AppColors.kWhiteColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          CustomBottomNavBarItem(
            state: widget.state,
            index: 2,
            icon: MyIcons.help,
            label: AppGlobalStrings.helpButton,
          ),
        ],
      ),
    );
  }
}
