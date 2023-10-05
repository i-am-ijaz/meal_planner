import 'package:flutter/material.dart';

extension ExtColorScheme on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
