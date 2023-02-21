import 'package:firebase_test/service/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage'),),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            AuthService.signOutUser(context);
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
