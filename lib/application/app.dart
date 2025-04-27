import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iargho_ecommerce_flutter/presentation/UI/screens/splash_screen.dart';
import 'package:iargho_ecommerce_flutter/presentation/utility/color_palette.dart';

class IArgho extends StatelessWidget {
  const IArgho({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CraftyBay',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        useMaterial3: true,
        primaryColor: AppColor.primaryColor,
        primarySwatch: MaterialColor(
          AppColor.primaryColor.value,
          AppColor().color, // Ensure this returns a Map<int, Color>
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.primaryColor),
          ),
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: AppColor.primaryColor,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
