import 'package:flutter/material.dart';

import 'package:meal_planner/config/size_config.dart';
import 'package:meal_planner/constants/constants.dart';
import 'package:meal_planner/constants/extensions.dart';
import 'package:meal_planner/theme/colors.dart';

class CustomAddBtn extends StatelessWidget {
  const CustomAddBtn({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: getProportionalHeight(84),
            width: getProportionalWidth(64),
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                topRight: Constants.circularBorder20,
                bottomLeft: Constants.circularBorder20,
              ),
            ),
          ),
          Container(
            height: getProportionalHeight(80),
            width: getProportionalWidth(60),
            decoration: const BoxDecoration(
              color: AppColors.blackColor,
              borderRadius: BorderRadius.only(
                topRight: Constants.circularBorder20,
                topLeft: Constants.circularBorder4,
                bottomLeft: Constants.circularBorder15,
                bottomRight: Constants.circularBorder4,
              ),
            ),
            child: const Icon(
              Icons.add,
              size: 40,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
