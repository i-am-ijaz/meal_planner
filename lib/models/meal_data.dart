import 'package:meal_planner/models/meal.dart';
import 'package:meal_planner/models/product.dart';

class MealData {
  final Meal meal;
  final List<Product> products;

  const MealData({
    required this.meal,
    required this.products,
  });

  MealData copyWith({
    Meal? meal,
    List<Product>? products,
  }) {
    return MealData(
      meal: meal ?? this.meal,
      products: products ?? this.products,
    );
  }

   int calculateTotalCalories() {
    int totalCalories = 0;
    for (var product in products) {
      totalCalories += product.calories;
    }
    return totalCalories;
  }
}
