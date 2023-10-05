import 'package:flutter/material.dart';

import 'package:meal_planner/config/size_config.dart';
import 'package:meal_planner/constants/extensions.dart';
import 'package:meal_planner/models/meal_data.dart';
import 'package:meal_planner/models/product.dart';
import 'package:meal_planner/theme/colors.dart';
import 'package:meal_planner/theme/strings.dart';
import 'package:meal_planner/views/widgets/app_outlined_btn.dart';
import 'package:meal_planner/views/widgets/custom_add_btn.dart';
import 'package:meal_planner/views/widgets/meal_card_leading.dart';
import 'package:meal_planner/views/widgets/no_products_widget.dart';

class MealsCartSection extends StatelessWidget {
  const MealsCartSection({
    Key? key,
    required this.mealDataList,
    required this.editModeMap,
    required this.onAdd,
    required this.onEdit,
    required this.onDeleteProduct,
  }) : super(key: key);
  final List<MealData> mealDataList;
  final Map<int, bool> editModeMap;
  final void Function({required int index, required MealData mealData}) onAdd;
  final void Function({required int index}) onEdit;
  final void Function({
    required int index,
    required Product product,
  }) onDeleteProduct;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: mealDataList.length,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (context, i) {
          final mealData = mealDataList[i];
          final isEditMode = editModeMap[i] ?? false; // Get edit mode state.
          return Card(
            color: AppColors.whiteColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        MealCardLeading(
                          icon: mealData.meal.icon,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              mealData.meal.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (mealData.products.isNotEmpty)
                              Row(
                                children: [
                                  SizedBox(
                                    height: getProportionalHeight(22),
                                    width: getProportionalWidth(50),
                                    child: AppOutlinedBtn(
                                      label: isEditMode ? 'Save' : 'Edit',
                                      onTap: () {
                                        onEdit(index: i);
                                      },
                                      foregroundColor: isEditMode
                                          ? AppColors.greenColor
                                          : AppColors.blackColor,
                                    ),
                                  ),
                                  const InkWell(
                                    child: Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Icon(Icons.favorite_border),
                                    ),
                                  ),
                                ],
                              )
                            else
                              const NoProductsWidget(),
                          ],
                        )
                      ],
                    ),
                    CustomAddBtn(
                      onTap: () {
                        onAdd(
                          mealData: mealData,
                          index: i,
                        );
                      },
                    ),
                  ],
                ),
                if (mealData.products.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: context.colorScheme.primaryContainer,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: mealData.products
                              .map(
                                (prod) => Column(
                                  children: [
                                    ListTile(
                                      dense: true,
                                      title: Text(
                                        prod.name,
                                        maxLines: 1,
                                        style: const TextStyle(
                                          color: Colors.black26,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      trailing: Wrap(
                                        children: [
                                          Text(
                                            '${prod.calories} ${Strings.cals}',
                                          ),
                                          const SizedBox(width: 8),
                                          InkWell(
                                            onTap: () {
                                              onDeleteProduct(
                                                index: i,
                                                product: prod,
                                              );
                                            },
                                            child: Icon(
                                              isEditMode
                                                  ? Icons.remove_circle
                                                  : Icons.arrow_circle_right,
                                              size: 14,
                                              color: isEditMode
                                                  ? Colors.red
                                                  : AppColors.blackColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Divider(
                                        height: 5,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Strings.total,
                                style: TextStyle(
                                  color: AppColors.greenColor,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "${mealData.calculateTotalCalories()} ${Strings.cals}",
                                style: TextStyle(
                                  color: AppColors.greenColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }
}
