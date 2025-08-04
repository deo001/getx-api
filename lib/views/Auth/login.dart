// screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/views/Auth/widgets/custom_text_field.dart';

import '../../controllers/login_controller.dart';

class Login extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    // TODO: implement login logic
    Get.snackbar("Info", "Login logic goes here");
  }
}

class LoginScreen extends StatelessWidget {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(controller: controller.emailController, label: "Email"),
            const SizedBox(height: 16),
            CustomTextField(controller: controller.passwordController, label: "Password", obscure: true),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => LoginController(),
              child: const Text("Login"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            TextButton(
              onPressed: () => Get.toNamed("/register"),
              child: const Text("Don't have an account? Register"),
            ),
          ],
        ),
      ),
    );
  }
}
