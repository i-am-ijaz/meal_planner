import 'package:flutter/material.dart';

import 'package:meal_planner/config/size_config.dart';
import 'package:meal_planner/constants/constants.dart';
import 'package:meal_planner/constants/extensions.dart';
import 'package:meal_planner/models/meal.dart';
import 'package:meal_planner/models/meal_data.dart';
import 'package:meal_planner/models/product.dart';
import 'package:meal_planner/theme/colors.dart';

import 'components/home_app_bar.dart';
import 'components/meals_cart_section.dart';

class HomeScreeen extends StatefulWidget {
  const HomeScreeen({super.key});

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  final List<MealData> _mealDataList = [
    const MealData(
      meal: Meal(
        title: 'Meal One',
        icon: Icons.food_bank_outlined,
      ),
      products: [],
    ),
    const MealData(
      meal: Meal(
        title: 'Meal Two',
        icon: Icons.food_bank_outlined,
      ),
      products: [],
    ),
    const MealData(
      meal: Meal(
        title: 'Meal Three',
        icon: Icons.food_bank_outlined,
      ),
      products: [],
    ),
    const MealData(
      meal: Meal(
        title: 'Meal Four',
        icon: Icons.food_bank_outlined,
      ),
      products: [],
    ),
    const MealData(
      meal: Meal(
        title: 'Meal Five',
        icon: Icons.food_bank_outlined,
      ),
      products: [],
    ),
    const MealData(
      meal: Meal(
        title: 'Meal Six',
        icon: Icons.food_bank_outlined,
      ),
      products: [],
    ),
  ];

  final Map<int, bool> _editModeMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primaryContainer,
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBar(),
            MealsCartSection(
              mealDataList: _mealDataList,
              editModeMap: _editModeMap,
              onAdd: _showAddProductsSheet,
              onEdit: _toggleEditMode,
              onDeleteProduct: _deleteMealProduct,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAddProductsSheet({
    required MealData mealData,
    required int index,
  }) async {
    final product = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            Center(
              child: SizedBox(
                width: getProportionalWidth(50),
                child: const Divider(
                  thickness: 4,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 8,
                  bottom: 12,
                ),
                child: Text(
                  'Select Product',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: Constants.dummyProducts.length,
                itemBuilder: (context, i) {
                  final product = Constants.dummyProducts[i];
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).pop(product);
                    },
                    leading: const Icon(
                      Icons.adb_sharp,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                    title: Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    trailing: Text(
                      "Cals ${product.calories.toString()}",
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    );

    if (product == null) return;
    debugPrint(product.toString());
    if (index >= 0 && index < _mealDataList.length) {
      setState(() {
        _mealDataList[index] = mealData.copyWith(
          products: [
            ...mealData.products,
            product,
          ],
        );
      });
    } else {
      debugPrint('ERROR: Incorrect item selected');
    }
  }

  void _toggleEditMode({required int index}) {
    setState(() {
      _editModeMap[index] =
          !(_editModeMap[index] ?? false); // Toggle edit mode.
    });
  }

  void _deleteMealProduct({
    required int index,
    required Product product,
  }) {
    setState(() {
      _mealDataList[index].products.remove(product);
    });

    if (_mealDataList[index].products.isNotEmpty) return;
    _toggleEditMode(index: index);
  }
}
