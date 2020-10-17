import 'package:flutter/material.dart';
import 'package:travel_manager/screen/bootom_nav.dart';
import 'package:travel_manager/screen/login/Sign_In.dart';
import 'package:travel_manager/screen/login/auth_helper.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.grey[900],
        ),
      
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        
        child: Column(
          
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/tm_logo_small.png',
                ),
                backgroundColor: Colors.transparent,
                radius: 60.0,
              ),
            ),

            
            Container(
              
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: RaisedButton(
                  
                   shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(36),
                    ),
                  onPressed:() {
                 AuthHelper.logOut() ;
                 Navigator.push(context,MaterialPageRoute(builder: (context){return Login();},),);
                },
                child: Text(
                  "Sign Out",
                  style :TextStyle(
                   fontSize: 22,
                  )
                  
                ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:BottomNav(), 
    );
  }
}