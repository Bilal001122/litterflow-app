import 'package:flutter/material.dart';
import 'package:litterflow_app/constants/colors.dart';
class ScanButton extends StatelessWidget {
  const ScanButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.kWhiteColor,
          width: 2,
        ),
      ),
      child: Transform.scale(
        scale: 0.9,
        child: Material(
          color: AppColors.kWhiteColor,
          type: MaterialType.circle,
          child: InkWell(
            onTap: () {},
            splashColor: AppColors.kPrimaryColor
                .withOpacity(0.2),
            customBorder: const CircleBorder(),
            child: Container(
              margin: const EdgeInsets.all(3),
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
