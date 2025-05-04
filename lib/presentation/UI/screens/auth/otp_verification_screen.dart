import 'package:crafty_bay_ecommerce_flutter/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/utility/color_palette.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/utility/path_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: SvgPicture.asset(ImagePath().logo),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Enter Your OTP Code',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 24,
                  ),
            ),
            Text(
              '4 Digit OTP Code Has Been Sent',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            PinCodeTextField(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                activeColor: AppColor.primaryColor,
                selectedColor: AppColor.primaryColor,
                inactiveColor: AppColor.primaryColor,
                selectedFillColor: Colors.white,
                inactiveFillColor: Colors.white,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              appContext: context,
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  Get.to(const CompleteProfileScreen());
                },
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: Colors.grey,
                ),
                children: [
                  TextSpan(
                    text: 'This code will expire in ',
                  ),
                  TextSpan(
                      text: '120s',
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                
              },
              child: const Text(
                'Resent Code',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
