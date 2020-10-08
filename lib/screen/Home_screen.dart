import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        fit: StackFit.expand,   
        children: [
          Image.asset(
            "assets/images/beach.jpeg",
            fit: BoxFit.fill, 
          ),
        ],
      ), 
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        backgroundColor: Colors.grey[800],
        items:[
          BottomNavigationBarItem(
            
            icon:Icon(
              Icons.home,
              size: 22,
              ),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize:18.0,
              ),
              ),
          ),
           BottomNavigationBarItem(
            
            icon:Icon(
              Icons.search,
              size: 22,
              color: Colors.white,
              ),
            title: Text(
              'Search',
              style: TextStyle(
                color:Colors.white,
                fontSize:18.0,

              ),
              ),
          ),
           BottomNavigationBarItem(
            
            icon:Icon(
              Icons.train,
              size: 22,
              color: Colors.white,
              ),
            title: Text(
              'Trips',
              style: TextStyle(
                color:Colors.white,
                fontSize:18.0,
              ),
              ),
          ),
          BottomNavigationBarItem(
            icon:Icon(
              Icons.person,
               size: 22,
              color: Colors.white,
              ),
            title: Text(
              'Profile',
              style: TextStyle(
                color:Colors.white,
                fontSize:18.0,
              ),
              ),
          ),
        ], 
      ),
    );
  }
}