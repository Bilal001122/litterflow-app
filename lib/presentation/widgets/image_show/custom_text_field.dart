import 'package:flutter/material.dart';
import 'package:litterflow_app/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: TextField(
        style: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          color: AppColors.kSecondaryColor,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          fillColor: AppColors.kFourthColor,
          filled: true,
          hintText: 'Ajouter une note',
          hintStyle: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            color: AppColors.kSecondaryColor.withOpacity(0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: AppColors.kFourthColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        maxLength: 500,
        maxLines: 5,
      ),
    );
  }
}