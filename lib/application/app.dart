import 'package:flutter/material.dart';

import '../presentation/screens/home_screen.dart';
import '../presentation/utility/app_color.dart';

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        colorSchemeSeed: AppColor.primaryColor,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Colors.black,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Colors.black,
              )
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Colors.black,
              )
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Colors.black,
              )
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15)
          ),
        )
      ),
    );
  }
}
