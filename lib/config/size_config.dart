import 'package:flutter/material.dart';

class SizeConfig {
  static late double width;
  static late double height;

  void init(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
  }
}

double getProportionalHeight(double input) {
  return (input / 804) * SizeConfig.height;
}

double getProportionalWidth(int input) {
  return (input / 360) * SizeConfig.width;
}
