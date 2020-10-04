import 'package:flutter/material.dart';
import 'package:travel_manager/screen/login/Register_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    //delayed for next screen for 3 sec
    var d = Duration(seconds: 3);
    Future.delayed(d,() {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
        return Register();
      }),
       (route) => false, 
      );
      super.initState();

    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/splash.png',
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ],
          ),
        ],        
      ),  
    );
  }
}