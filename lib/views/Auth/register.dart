// screens/register_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/controllers/registration_controller.dart';
import 'package:getx_api/views/Auth/widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  final controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(controller: controller.nameController, label: "Name"),
            const SizedBox(height: 16),
            CustomTextField(controller: controller.emailController, label: "Email"),
            const SizedBox(height: 16),
            CustomTextField(controller: controller.passwordController, label: "Password", obscure: true),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: controller.registerWithEmail,
              child: const Text("Register"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            TextButton(
              onPressed: () => Get.toNamed("/login"),
              child: const Text("Already have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
