import 'package:crafty_bay_ecommerce_flutter/data/auth%20services/auth_service.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/UI/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/UI/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/utility/path_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    final result = await AuthService().login(email, password);

    if (result != null) {
      Get.to(() => const MainBottomNavScreen());
    } else {
      Get.snackbar("Login Failed", "Invalid email or password");
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
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 24),
                ),
                Text(
                  'Please Enter Your Email Address',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration:
                      const InputDecoration(hintText: 'Enter Email Address'),
                  validator: (text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter Your Email Address';
                    }
                    if (!GetUtils.isEmail(text!)) {
                      return 'This Is Not An Email Address.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Enter Password'),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Enter Your Password';
                    }
                    if (text.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) _login();
                    },
                    child: const Text('Next'),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have a profile? "),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const CompleteProfileScreen());
                      },
                      child: const Text(
                        "Create one",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
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
