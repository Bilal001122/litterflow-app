import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/logic/cubits/navigation_cubit/navigation_cubit.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  final NavigationSuccess state;
  final int index;
  final IconData icon;
  final int iconSize;
  final String label;

  const CustomBottomNavBarItem({
    super.key,
    required this.state,
    required this.index,
    required this.icon,
    this.iconSize = 30,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      animationDuration: const Duration(milliseconds: 1000),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        splashColor: AppColors.kPrimaryColor.withOpacity(0.2),
        onTap: () {
          BlocProvider.of<NavigationCubit>(context).updateIndex(index: index);
        },
        child: SizedBox(
          height: 70,
          width: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              state.index == index
                  ? Icon(
                icon,
                color: AppColors.kPrimaryColor,
                size: 30,
              )
                  : Icon(
                icon,
                color: AppColors.kSecondaryColor,
                size: 30,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                label,
                style: TextStyle(
                  color: state.index == index
                      ? AppColors.kPrimaryColor
                      : AppColors.kSecondaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavBarItemPainter extends CustomPainter {
  final double opacity;
  final double radiusController;

  CustomBottomNavBarItemPainter(
      {required this.opacity, required this.radiusController});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.kPrimaryColor.withOpacity(opacity)
      ..style = PaintingStyle.fill;

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width * radiusController;

    canvas.drawCircle(Offset(centerX, centerY), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}