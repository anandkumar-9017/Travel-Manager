import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_manager/screen/splash/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  QuerySnapshot hotelquery;
  QuerySnapshot placesquery;
  QuerySnapshot restquery;
  QuerySnapshot shopsquery;

  hotelquery = await FirebaseFirestore.instance
      .collection("fetch details")
      .doc("Allahabad")
      .collection('Hotels')
      .get();

  placesquery = await FirebaseFirestore.instance
      .collection("fetch details")
      .doc("Allahabad")
      .collection('Places To Visit')
      .get();

  restquery = await FirebaseFirestore.instance
      .collection("fetch details")
      .doc("Allahabad")
      .collection('Restaurents')
      .get();

  shopsquery = await FirebaseFirestore.instance
      .collection("fetch details")
      .doc("Allahabad")
      .collection('Shopping Places')
      .get();
  print('yahan tak aya');
  print(hotelquery.docs[0].data());
  List<Map> hotels = List();
  List<Map> restaurents = List();
  List<Map> places = List();
  List<Map> shops = List();

  for (int i = 0; i < 4; i++) {
    print('test');
    hotels.add(hotelquery.docs[i].data());
    print('test1');
    restaurents.add(restquery.docs[i].data());
    print('test2');
    places.add(placesquery.docs[i].data());
    print('test3');
    shops.add(shopsquery.docs[i].data());
    print('test4');
  }

  runApp(MyApp(
    hotels: hotels,
    restaurents: restaurents,
    places: places,
    shops: shops,
  ));
}

class MyApp extends StatelessWidget {
  List<Map> hotels;
  List<Map> restaurents;
  List<Map> places;
  List<Map> shops;

  MyApp({this.hotels, this.restaurents, this.places, this.shops});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Travel Manager",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[900],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(
        hotels: hotels,
        restaurents: restaurents,
        places: places,
        shops: shops,
      ),
    );
  }
}
