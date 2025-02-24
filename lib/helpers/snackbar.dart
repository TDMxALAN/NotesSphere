import 'package:flutter/material.dart';
import 'package:notes_sphere/utils/colors.dart';
import 'package:notes_sphere/utils/text_styles.dart';

class AppHelpers {
  static void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.kFabColor,
        content: Text(
          message,
          style: AppTextStyles.appButton,
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
