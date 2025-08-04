import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/app/app_theme.dart';
import 'package:getx_api/views/Auth/login.dart';
import 'package:getx_api/views/Auth/register.dart';
import 'views/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/login', page: () =>  LoginScreen()),
        GetPage(name: '/register', page: () =>  RegisterScreen()),
        GetPage(name: '/home', page: () =>  Homepage()),
      ],
    );
  }
}
