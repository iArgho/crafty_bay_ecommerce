import 'dart:async';
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
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String _otp = '';
  int _secondsRemaining = 120;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _secondsRemaining = 120;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  void _onResendCode() {
    // TODO: Implement actual resend API call
    _startCountdown();
    Get.snackbar('OTP Sent', 'A new OTP has been sent to your email.');
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _onSubmitOtp() {
    if (_otp.length == 4) {
      // You can verify OTP here before navigating
      Get.to(const CompleteProfileScreen());
    } else {
      Get.snackbar('Invalid OTP', 'Please enter the full 4-digit code');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Center(child: SvgPicture.asset(ImagePath().logo)),
              const SizedBox(height: 8),
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
              const SizedBox(height: 16),
              PinCodeTextField(
                length: 4,
                appContext: context,
                obscureText: false,
                animationType: AnimationType.fade,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onChanged: (value) => _otp = value,
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
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: _onSubmitOtp,
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
              const SizedBox(height: 32),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.grey),
                  children: [
                    const TextSpan(text: 'This code will expire in '),
                    TextSpan(
                      text: '${_secondsRemaining}s',
                      style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: _secondsRemaining == 0 ? _onResendCode : null,
                child: Text(
                  'Resend Code',
                  style: TextStyle(
                    color: _secondsRemaining == 0
                        ? AppColor.primaryColor
                        : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
