import 'package:flutter/material.dart';
import 'package:travel_manager/screen/bootom_nav.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      bottomNavigationBar:BottomNav(),
    );
  }
}