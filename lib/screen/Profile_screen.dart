import 'package:flutter/material.dart';
import 'package:travel_manager/screen/bootom_nav.dart';
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
      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image:AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Container(
              child: RaisedButton(onPressed:() {
               AuthHelper.signOut() ;
              },
              child: Text(
                "Sign Out"
                
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