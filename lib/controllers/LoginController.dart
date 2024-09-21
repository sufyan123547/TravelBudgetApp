import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // TextEditingControllers for the form fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  // Method for logging in the user
  Future<void> loginUser() async {
    if (validateForm()) {
      try {
        isLoading.value = true;

        // Sign in the user
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Navigate to the main screen or home screen after successful login
        Get.offAllNamed('/home'); // Adjust the route as needed
      } on FirebaseAuthException catch (e) {
        Get.snackbar("Error", e.message ?? "Login failed");
      } finally {
        isLoading.value = false;
      }
    }
  }

  // Form validation logic
  bool validateForm() {
    if (emailController.text.trim().isEmpty) {
      Get.snackbar("Error", "Email is required");
      return false;
    }
    if (!GetUtils.isEmail(emailController.text.trim())) {
      Get.snackbar("Error", "Enter a valid email");
      return false;
    }
    if (passwordController.text.trim().length < 6) {
      Get.snackbar("Error", "Password must be at least 6 characters long");
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
