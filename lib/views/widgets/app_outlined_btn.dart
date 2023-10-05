import 'package:flutter/material.dart';
import 'package:meal_planner/theme/colors.dart';

class AppOutlinedBtn extends StatelessWidget {
  const AppOutlinedBtn({
    Key? key,
    required this.label,
    required this.onTap,
    this.foregroundColor = AppColors.blackColor,
  }) : super(key: key);
  final String label;
  final VoidCallback onTap;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.zero,
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.transparent,
        ),
        foregroundColor: MaterialStateProperty.all(
          foregroundColor,
        ),
        side: MaterialStateProperty.all(
          BorderSide(
            color: foregroundColor,
          ),
        ),
      ),
      child: Text(label),
    );
  }
}
