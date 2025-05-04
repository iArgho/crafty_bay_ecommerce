import 'package:crafty_bay_ecommerce_flutter/presentation/utility/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/ui/screens/splash_screen.dart';
import 'package:get/route_manager.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CraftyBay',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF07ADAE)),
        useMaterial3: true,
        primaryColor: const Color(0xFF07ADAE),
        primarySwatch:
            MaterialColor(AppColor.primaryColor.value, AppColor().color),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF07ADAE),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF07ADAE)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF07ADAE)),
          ),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color(0xFF07ADAE),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
