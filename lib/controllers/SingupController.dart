import 'package:app/auth/loginscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Form fields controllers
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();
  final nicController = TextEditingController();
  final passportController = TextEditingController();
  final locationController = TextEditingController();

  // Rx variable to observe the loading state
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;

  // Method to handle signup
  Future<void> signUpUser() async {
    if (validateForm()) {
      try {
        isLoading.value = true;

        // Create user with email and password
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        User? user = userCredential.user;

        // Save user data to Firestore
        await _firestore.collection('users').doc(user?.uid).set({
          'fullName': fullNameController.text.trim(),
          'email': emailController.text.trim(),
          'phone': phoneController.text.trim(),
          'gender': genderController.text.trim(),
          'nic': nicController.text.trim(),
          'passport': passportController.text.trim(),
          'location': locationController.text.trim(),
          'uid': user?.uid,
        });

        // Navigate to the next screen after successful signup
        Get.snackbar("Success", "User signed up successfully");
        Get.off(LoginScreen()); // Navigate to login screen
      } on FirebaseAuthException catch (e) {
        Get.snackbar("Error", e.message ?? "Signup failed");
      } finally {
        isLoading.value = false;
      }
    }
  }

  // Form validation logic
  bool validateForm() {
    if (fullNameController.text.trim().isEmpty) {
      Get.snackbar("Error", "Full name is required");
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
    if (phoneController.text.trim().length != 10) {
      Get.snackbar("Error", "Enter a valid 10-digit phone number");
      return false;
    }
    if (genderController.text.trim().isEmpty) {
      Get.snackbar("Error", "Gender is required");
      return false;
    }
    if (nicController.text.trim().length != 13) {
      Get.snackbar("Error", "Enter a valid 13-digit NIC number");
      return false;
    }
    if (passportController.text.trim().isEmpty) {
      Get.snackbar("Error", "Passport number is required");
      return false;
    }
    if (locationController.text.trim().isEmpty) {
      Get.snackbar("Error", "Location is required");
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    genderController.dispose();
    nicController.dispose();
    passportController.dispose();
    locationController.dispose();
    super.dispose();
  }
}
