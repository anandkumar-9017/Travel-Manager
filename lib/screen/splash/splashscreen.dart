import 'package:flutter/material.dart';
import 'package:travel_manager/screen/login/LoginStatus.dart';
import 'package:travel_manager/screen/login/Sign_In.dart';

class SplashScreen extends StatefulWidget {
  List<Map> hotels;
  List<Map> restaurents;
  List<Map> places;
  List<Map> shops;

  SplashScreen({this.hotels, this.restaurents, this.places, this.shops});
  @override
  _SplashScreenState createState() => _SplashScreenState(
        hotels: hotels,
        restaurents: restaurents,
        places: places,
        shops: shops,
      );
}

class _SplashScreenState extends State<SplashScreen> {
  List<Map> hotels;
  List<Map> restaurents;
  List<Map> places;
  List<Map> shops;

  _SplashScreenState({this.hotels, this.restaurents, this.places, this.shops});
  @override
  void initState() {
    //delayed for next screen for 3 sec
    var d = Duration(seconds: 3);
    Future.delayed(d, () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) {
          return LoginStatus(
            hotels: hotels,
            restaurents: restaurents,
            places: places,
            shops: shops,
          );
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
            'assets/images/travelmanager.png',
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ],
      ),
    );
  }
}
