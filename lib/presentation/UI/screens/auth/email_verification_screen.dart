import 'package:crafty_bay_ecommerce_flutter/data/services/network_caller.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/utility/path_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _sendVerification() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    bool result = await NetworkCaller().sendEmailVerification(email);

    if (result) {
      Get.to(const OtpVerificationScreen());
    } else {
      Get.snackbar("Error", "Failed to send verification email");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 100),
                Center(child: SvgPicture.asset(ImagePath().logo)),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 24,
                      ),
                ),
                Text(
                  'Please Enter Your Email Address',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Email Address',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  validator: (String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter Your Email Address';
                    } else if (!GetUtils.isEmail(text!)) {
                      return 'This Is Not An Email Address.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Enter Password',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  validator: (String? text) {
                    if (text == null || text.isEmpty) {
                      return 'Enter Your Password';
                    } else if (text.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
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
                      if (_formKey.currentState!.validate()) {
                        _sendVerification();
                      }
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
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have a profile? "),
                    GestureDetector(
                      onTap: () {
                        // TODO: Replace with your registration screen
                        // Example: Get.to(() => const RegistrationScreen());
                        Get.snackbar(
                            "Notice", "Navigate to registration screen");
                      },
                      child: const Text(
                        "Create one",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
