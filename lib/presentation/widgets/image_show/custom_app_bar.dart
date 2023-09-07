import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/constants/images.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.kSecondaryColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 15,
                bottom: 15,
                child: SvgPicture.asset(
                  ScanImages.logoBlue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
