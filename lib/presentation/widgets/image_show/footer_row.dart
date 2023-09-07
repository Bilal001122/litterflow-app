import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import 'custom_bottom_sheet.dart';

class FooterRow extends StatelessWidget {
  const FooterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: const Icon(
                  Icons.rotate_right,
                  size: 35,
                  color: AppColors.kSecondaryColor,
                ),
                onPressed: () {},
              ),
              const Text(
                ScanStrings.rotateRightButton,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kSecondaryColor,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: const Icon(
                  Icons.rotate_left,
                  size: 35,
                  color: AppColors.kSecondaryColor,
                ),
                onPressed: () {},
              ),
              const Text(
                ScanStrings.rotateLeftButton,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kSecondaryColor,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: const Icon(
                  Icons.crop,
                  size: 35,
                  color: AppColors.kSecondaryColor,
                ),
                onPressed: () {},
              ),
              const Text(
                ScanStrings.frameButton,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kSecondaryColor,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.kPrimaryColor.withOpacity(0.4),
                  blurRadius: 20.0,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                backgroundColor: AppColors.kPrimaryColor,
                foregroundColor: AppColors.kWhiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => const CustomBottomSheet(),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                );
              },
              child: const Text(
                ScanStrings.continueButton,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kWhiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
