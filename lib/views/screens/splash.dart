import 'package:flutter/material.dart';
import 'package:meal_planner/config/size_config.dart';
import 'package:meal_planner/constants/extensions.dart';
import 'package:meal_planner/theme/strings.dart';
import 'package:meal_planner/views/screens/home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      // TODO: replace with Duration.zero for the case when initilizing
      // services and singletons or future calls
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreeen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.food_bank_outlined,
            size: getProportionalHeight(200),
            color: context.colorScheme.primary,
          ),
          const SizedBox(height: 12),
          const Text(
            Strings.appName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 54,
            ),
          ),
        ],
      ),
    );
  }
}
