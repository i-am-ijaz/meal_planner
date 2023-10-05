import 'package:flutter/material.dart';
import 'package:meal_planner/constants/extensions.dart';

class MealCardLeading extends StatelessWidget {
  const MealCardLeading({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        color: context.colorScheme.primaryContainer,
      ),
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(8),
      child: Icon(
        icon,
        size: 30,
      ),
    );
  }
}
