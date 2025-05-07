import 'package:crafty_bay_ecommerce_flutter/data/auth%20services/auth_service.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/UI/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/utility/path_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _register() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final result = await AuthService().register(email, password);

    if (result != null) {
      Get.to(() => const MainBottomNavScreen());
    } else {
      Get.snackbar(
          "Registration Failed", "Try again with different credentials");
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
            child: ListView(
              children: [
                const SizedBox(height: 50),
                Center(child: SvgPicture.asset(ImagePath().logo)),
                const SizedBox(height: 8),
                Text('Complete Profile',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 24)),
                Text('Get Started With Us With Your Profile',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey)),
                const SizedBox(height: 16),
                TextFormField(
                    decoration: const InputDecoration(hintText: 'First Name')),
                const SizedBox(height: 16),
                TextFormField(
                    decoration: const InputDecoration(hintText: 'Last Name')),
                const SizedBox(height: 16),
                TextFormField(
                    decoration: const InputDecoration(hintText: 'Mobile No')),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                  validator: (value) => value != null && value.contains('@')
                      ? null
                      : 'Enter valid email',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Password'),
                  validator: (value) =>
                      value != null && value.length >= 6 ? null : 'Min 6 chars',
                ),
                const SizedBox(height: 16),
                TextFormField(
                    obscureText: true,
                    decoration:
                        const InputDecoration(hintText: 'Confirm Password')),
                const SizedBox(height: 16),
                TextFormField(
                    maxLines: 2,
                    decoration:
                        const InputDecoration(hintText: 'Shipping Address')),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _register();
                      }
                    },
                    child: const Text('Complete'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
