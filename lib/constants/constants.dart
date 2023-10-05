import 'package:flutter/material.dart';

import 'package:meal_planner/models/meal.dart';
import 'package:meal_planner/models/product.dart';

abstract class Constants {
  static const dummyProducts = [
    Product(
      id: '1',
      name: 'Spicy Bacon Cheese Toast',
      calories: 312,
    ),
    Product(
      id: '2',
      name: 'Almond Milk',
      calories: 312,
    ),
    Product(
      id: '3',
      name: 'Grilled Chicken Salad',
      calories: 400,
    ),
    Product(
      id: '4',
      name: 'Spaghetti with Marinara Sauce',
      calories: 350,
    ),
    Product(
      id: '5',
      name: 'Veggie Stir-Fry',
      calories: 300,
    ),
    Product(
      id: '6',
      name: 'Margherita Pizza',
      calories: 250,
    ),
    Product(
      id: '7',
      name: 'Pasta',
      calories: 300,
    ),
    Product(
      id: '8',
      name: 'Chicken Tikka Pizza',
      calories: 250,
    ),
  ];

  static const dummyMeals = [
    Meal(
      title: 'Meal One',
      icon: Icons.food_bank_outlined,
    ),
    Meal(
      title: 'Meal Two',
      icon: Icons.food_bank_outlined,
    ),
    Meal(
      title: 'Meal Three',
      icon: Icons.food_bank_outlined,
    ),
    Meal(
      title: 'Meal Four',
      icon: Icons.food_bank_outlined,
    ),
    Meal(
      title: 'Meal Five',
      icon: Icons.food_bank_outlined,
    ),
    Meal(
      title: 'Meal Six',
      icon: Icons.food_bank_outlined,
    ),
  ];

  static const circularBorder4 = Radius.circular(4);
  static const circularBorder15 = Radius.circular(15);
  static const circularBorder20 = Radius.circular(20);
}
