import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:meal_planner/theme/theme.dart';
import 'package:meal_planner/theme/strings.dart';
import 'package:meal_planner/config/size_config.dart';
import 'package:meal_planner/views/screens/splash.dart';

class MealPlannerApp extends StatelessWidget {
  const MealPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SizeConfig().init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
