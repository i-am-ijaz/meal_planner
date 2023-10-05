import 'package:flutter/material.dart';

import 'package:meal_planner/config/size_config.dart';
import 'package:meal_planner/theme/colors.dart';

class NoProductsWidget extends StatelessWidget {
  const NoProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        height: getProportionalHeight(22),
        child: ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              AppColors.disabledColor,
            ),
          ),
          child: const Text(
            'No Products',
            style: TextStyle(
              fontSize: 10,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
