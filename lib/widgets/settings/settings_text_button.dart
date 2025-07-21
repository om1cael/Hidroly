import 'package:flutter/material.dart';
import 'package:hidroly/theme/app_colors.dart';

class SettingsTextButton extends StatelessWidget {
  final String title;
  final String? description;
  final VoidCallback onPressed;

  const SettingsTextButton({
    super.key,
    required this.title,
    this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.only(top: 6, bottom: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.zero
        ),
        alignment: Alignment.centerLeft,
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            if (description != null)
              Text(
                description!,
                style: TextStyle(
                  color: AppColors.secondaryText,
                ),
              ),
          ],
        ),
      ),
    );
  }
}