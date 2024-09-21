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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Full name is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Email',
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.email),
                    validator: (value) {
                      if (!GetUtils.isEmail(value ?? "")) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Obx(() => CustomTextField(
                        hintText: 'Password',
                        controller: controller.passwordController,
                        isPassword: true,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            controller.isPasswordVisible.value =
                                !controller.isPasswordVisible.value;
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      )),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Phone Number',
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icon(Icons.phone),
                    validator: (value) {
                      if (value == null || value.length != 10) {
                        return 'Enter a valid 10-digit phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      hintText: 'Gender',
                    ),
                    value: controller.genderController.text.isEmpty
                        ? null
                        : controller.genderController.text,
                    items: ['Male', 'Female', 'Other'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      controller.genderController.text = newValue!;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'NIC Number',
                    controller: controller.nicController,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icon(Icons.badge),
                    validator: (value) {
                      if (value == null || value.length != 13) {
                        return 'Enter a valid 13-digit NIC number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Passport Number',
                    controller: controller.passportController,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icon(Icons.airplanemode_active),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Passport number is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Where do you live?',
                    controller: controller.locationController,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icon(Icons.location_on),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Location is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                      text: "Sign Up",
                      onPressed: () {
                        controller.signUpUser();
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
