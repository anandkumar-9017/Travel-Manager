import 'package:flutter/material.dart';
import 'package:travel_manager/screen/bootom_nav.dart';

class Forum extends StatefulWidget {
  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      bottomNavigationBar:BottomNav(),
    );
  }
}