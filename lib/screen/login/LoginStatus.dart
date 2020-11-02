import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../home/Home_screen.dart';
import 'Sign_In.dart';

class LoginStatus extends StatelessWidget {
  List<Map> hotels;
  List<Map> restaurents;
  List<Map> places;
  List<Map> shops;
  LoginStatus({this.hotels, this.restaurents, this.places, this.shops});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Home(
              hotels: hotels,
              restaurents: restaurents,
              places: places,
              shops: shops,
            );
          }
          return Login();
        });
    throw UnimplementedError();
  }
}
