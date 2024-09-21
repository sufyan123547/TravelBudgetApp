import 'package:app/controllers/SingupController.dart';
import 'package:app/widgets/CustomButton.dart';
import 'package:app/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final SignupController controller = Get.put(SignupController());

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 500, // Set a max width for the fields
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    hintText: 'Full Name',
                    controller: controller.fullNameController,
                    keyboardType: TextInputType.name,
                    prefixIcon: Icon(Icons.person),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Email',
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.email),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Password',
                    controller: controller.passwordController,
                    isPassword: true,
                    prefixIcon: Icon(Icons.lock),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Phone Number',
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icon(Icons.phone),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Gender',
                    controller: controller.genderController,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'NIC Number',
                    controller: controller.nicController,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icon(Icons.badge),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Passport Number',
                    controller: controller.passportController,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icon(Icons.airplanemode_active),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Where do you live?',
                    controller: controller.locationController,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  const SizedBox(height: 32),
                  Obx(() => CustomButton(
                        text: controller.isLoading.value
                            ? 'Signing up...'
                            : 'Sign up',
                        onPressed: controller.signUpUser,
                        backgroundColor: const Color(0xFF00BF6D),
                        textColor: Colors.white,
                        width: double.infinity,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
