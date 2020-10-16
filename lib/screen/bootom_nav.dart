import 'package:flutter/material.dart';
import 'package:travel_manager/screen/Forum_screen.dart';
<<<<<<< HEAD
import 'package:travel_manager/screen/Home_screen.dart';
=======
import 'package:travel_manager/screen/home/Home_screen.dart';
>>>>>>> 57ffd4d7e30001aade4b90dd2a3e3c0b98e011d6
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
<<<<<<< HEAD
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
=======
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
>>>>>>> 57ffd4d7e30001aade4b90dd2a3e3c0b98e011d6
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
<<<<<<< HEAD
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Trip()));
=======
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Trip()));
>>>>>>> 57ffd4d7e30001aade4b90dd2a3e3c0b98e011d6
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
<<<<<<< HEAD
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Forum()));
=======
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Forum()));
>>>>>>> 57ffd4d7e30001aade4b90dd2a3e3c0b98e011d6
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
<<<<<<< HEAD
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile()));
=======
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
>>>>>>> 57ffd4d7e30001aade4b90dd2a3e3c0b98e011d6
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
<<<<<<< HEAD
}
=======
}
>>>>>>> 57ffd4d7e30001aade4b90dd2a3e3c0b98e011d6
