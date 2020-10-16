import 'package:flutter/material.dart';
import 'package:travel_manager/screen/Forum_screen.dart';
import 'package:travel_manager/screen/Home_screen.dart';
import 'package:travel_manager/screen/Profile_screen.dart';
import 'package:travel_manager/screen/Trip_screen.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 60.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home),
                    Text("Home"),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 60.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Trip()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.traffic),
                    Text("Trip"),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 60.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Forum()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.message),
                    Text("Forum"),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 60.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    Text("Profile"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}