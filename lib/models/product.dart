import 'package:flutter/foundation.dart' show immutable;

@immutable
class Product {
  final String id;
  final String name;
  final int calories;

  const Product({
    required this.id,
    required this.name,
    required this.calories,
  });
}
