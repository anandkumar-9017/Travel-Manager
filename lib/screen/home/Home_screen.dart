import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/transportlist.dart';
import 'package:travel_manager/screen/home/headinglist.dart';
import 'package:travel_manager/screen/home/horizontalList.dart';
import 'package:travel_manager/screen/home/seemorehotel.dart';
import 'package:travel_manager/screen/home/iconbar.dart';
import 'package:travel_manager/screen/home/stack.dart';
import 'package:travel_manager/screen/bootom_nav.dart';

class Home extends StatelessWidget {
  List<Map> hotels;
  List<Map> restaurents;
  List<Map> places;
  List<Map> shops;
  Home({this.hotels, this.restaurents, this.places, this.shops});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        hotels: hotels,
        restaurents: restaurents,
        places: places,
        shops: shops,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  List<Map> hotels;
  List<Map> restaurents;
  List<Map> places;
  List<Map> shops;
  MyHomePage({this.hotels, this.restaurents, this.places, this.shops});

  @override
  _MyHomePageState createState() => _MyHomePageState(
        hotels: hotels,
        restaurents: restaurents,
        places: places,
        shops: shops,
      );
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map> hotels;
  List<Map> restaurents;
  List<Map> places;
  List<Map> shops;

  _MyHomePageState({this.hotels, this.restaurents, this.places, this.shops});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: ListView(
          children: [
            StackBar(),
            IconBar(),
            HeadingList(heading: "Places to visit"),
            HorizontalList(
              list: places,
              name: "Places to visit",
            ),
            HeadingList(heading: "Hotel"),
            HorizontalList(list: hotels, name: 'Hotel'),
            HeadingList(heading: "Restaurents"),
            HorizontalList(list: restaurents, name: 'Restaurents'),
            HeadingList(heading: "Shopping Places"),
            HorizontalList(
              list: shops,
              name: 'Shopping Places',
            ),
            HeadingList(heading: "Transport"),
            TransportList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
