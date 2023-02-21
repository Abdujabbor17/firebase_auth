import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_test/pages/home_page.dart';
import 'package:firebase_test/pages/loginPage.dart';
import 'package:firebase_test/pages/sign_up.dart';
import 'package:firebase_test/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
      routes: {
        '/SignUp' : (context) => const SignUpPage(),
        '/SignIn' : (context) => const LoginPage(),
        '/HomePage' : (context) => const HomePage(),
      },
    );
  }
}