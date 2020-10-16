import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/horizontalList.dart';
import 'package:travel_manager/screen/home/headingList.dart';
import 'package:travel_manager/screen/home/iconbar.dart';
import 'package:travel_manager/screen/home/stack.dart';
import 'package:travel_manager/screen/bootom_nav.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Travel Manager",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          child: ListView(
            children: [
              StackBar(), //map and search bar
              IconBar(), // bar witch icons
              HeadingList(
                  heading: "Places to visit"), //heading of places to visit list
              HorizontalList(), //places to visit list
              HeadingList(heading: "Hotels"), //heading of hotels list
              HorizontalList(), //second list
              HeadingList(heading: "Restaurent"), //heading of restaurents list
              HorizontalList(), //restaurents list
              HeadingList(
                  heading: "Shopping Bags"), //heading of shopping bag list
              HorizontalList(), //shopping bag list
              HeadingList(heading: "Transport"), //heading of transport list
              HorizontalList(), //transport list
            ],
          ),
        ),
        bottomNavigationBar: BottomNav(), //bottom navigatio bar
      ),
    );
  }
}
