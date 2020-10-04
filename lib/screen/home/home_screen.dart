import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text(
          "Travel Manager",
          style: TextStyle(
          fontSize:28.0,
          
          ),
        ),
      ),
        
      body:Stack(
        fit: StackFit.expand,   
        children: [
          Image.asset(
            "assets/images/homescreen.jpeg",
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

