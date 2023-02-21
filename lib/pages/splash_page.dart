import 'dart:async';
import 'package:flutter/material.dart';
import '../service/auth_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  void _initTimer(){
    Timer(const Duration(seconds: 3),(){
      _callNextPage();
    });
  }
  _callNextPage(){
    if(AuthService.isLoggedIn()){
      Navigator.pushReplacementNamed(context, '/HomePage');
    }else{
      Navigator.pushReplacementNamed(context,'/SignUp');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(193, 53, 132, 1),
              Color.fromRGBO(131, 58, 180, 1)
            ]
          )
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Expanded(
            child: Center(
              child: Text("Welcome",style: TextStyle(color: Colors.white,fontSize: 35),),
            ),
          ),
          Text("from META",style: TextStyle(color: Colors.white, fontSize: 16),),
          SizedBox(height: 20,),
        ],
      ),
      ),
    );
  }
}
