import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignInController _signInController = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80),
                // const AppLogoWidget(), // Optional: Uncomment if you have it
                const SizedBox(height: 16),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Please enter your email address',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailTEController,
                  decoration: const InputDecoration(hintText: 'Email Address'),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your email address';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passwordTEController,
                  decoration: const InputDecoration(hintText: 'Password'),
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                GetBuilder<SignInController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ElevatedButton(
                    onPressed: _onTapNextButton,
                    child: const Text('Sign In'),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      bool isSuccess = await _signInController.signIn(
        _emailTEController.text.trim(),
        _passwordTEController.text,
      );
      if (isSuccess) {
        if (mounted) {
          Navigator.pushNamed(
            context,
            '/home', // <-- Temporary or replace with your actual MainBottomNavScreen.name
            arguments: _emailTEController.text.trim(),
          );
        }
      } else {
        if (mounted) {
          showSnackBarMessage(
              context, _signInController.errorMessage ?? 'Sign in failed');
        }
      }
    }
  }

  void showSnackBarMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class SignInController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? errorMessage;

  Future<bool> signIn(String email, String password) async {
    _setInProgress(true);

    try {
      await Future.delayed(const Duration(seconds: 2));

      if (email == 'test@example.com' && password == 'password123') {
        _setInProgress(false);
        return true;
      } else {
        errorMessage = 'Invalid email or password';
        _setInProgress(false);
        return false;
      }
    } catch (e) {
      errorMessage = 'Something went wrong. Please try again.';
      _setInProgress(false);
      return false;
    }
  }

  void _setInProgress(bool value) {
    _inProgress = value;
    update();
  }
}
