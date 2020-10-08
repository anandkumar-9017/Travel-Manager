import 'package:flutter/material.dart';

class UserProfie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.settings), onPressed: (){}),
        ],
        title:Text(
          'Profile',
          style:TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image:AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children:[
              SizedBox(height: 20.0,),
              Center(
                child: Text(
                  "Travel Manager ",
                  style:TextStyle(
                    fontSize: 40.0,
                    color: Colors.white, 
                    fontWeight: FontWeight.w900,                
                  ),
                ),
              ),
              SizedBox(height: 18),
              Text(
                "User Information ",
                style:TextStyle(
                  fontSize: 28.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/tm_logo_small.png',   
                  ),
                  radius: 60.0,
                  backgroundColor: Colors.transparent,
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Name',
                      style:TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      'Anand kumar',
                      style:TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}