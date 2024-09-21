import 'package:app/auth/signupscreen.dart';
import 'package:app/controllers/LoginController.dart';
import 'package:app/widgets/CustomButton.dart';
import 'package:app/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; // Import the controller

class LoginScreen extends StatelessWidget {
  // Instantiate the controller

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomTextField(
              controller: controller.emailController, // Use the controller
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(Icons.email),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              controller: controller.passwordController, // Use the controller
              hintText: 'Password',
              isPassword: true,
              prefixIcon: Icon(Icons.lock),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            Obx(() => CustomButton(
                text: controller.isLoading.value ? 'Signing in...' : 'Sign In',
                onPressed: () {
                  controller.isLoading.value
                      ? null
                      : () {
                          controller.loginUser();
                        };
                })),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Handle forgot password logic
              },
              child: Text(
                'Forgot Password?',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .color!
                      .withOpacity(0.64),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => SignupScreen());
              },
              child: Text.rich(
                TextSpan(
                  text: "Don’t have an account? ",
                  children: [
                    TextSpan(
                      text: "Sign Up",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: const Color(0xFF00BF6D),
                      ),
                    ),
                  ],
                ),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .color!
                      .withOpacity(0.64),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
