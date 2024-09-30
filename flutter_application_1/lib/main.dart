import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/HomePage.dart';
import 'package:flutter_application_1/pages/LoginPage.dart';
import 'package:flutter_application_1/pages/RegisterPage.dart';
import 'package:flutter_application_1/pages/cartPage.dart';
import 'package:flutter_application_1/pages/itemPage.dart';
import 'package:flutter_application_1/pages/chatPage.dart';
import 'package:flutter_application_1/pages/aboutPage.dart'; 

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routes: {
        "/": (context) => const Homepage(),
        "cartPage": (context) => const CartPage(),
        "itemPage": (context) => const ItemPage(),
        "registerPage": (context) => const RegisterPage(),
        "chatPage": (context) => const ChatPage(),
        "aboutPage": (context) => const AboutPage(),
        "loginPage": (context) => const LoginPage(), 
      },
    );
  }
}
