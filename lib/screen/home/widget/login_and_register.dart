import 'package:flutter/material.dart';
import 'package:travel_manager/screen/login/LogIn_screen.dart';
import 'package:travel_manager/screen/login/Register_screen.dart';

import '../../../constraint.dart';

class LogInRegister extends StatelessWidget {
  const LogInRegister({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical:30,),
      child:Row(
        children: [
          
          Expanded(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(36),
              ),
              color: mSecondaryTextColor,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Register();
                },),);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical:16),
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  "Register",
                  style: TextStyle(
                     color: Colors.white,
                     fontSize: 18.0,
                     fontWeight: FontWeight.w300
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width:30),
          Expanded(
          
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(36),
                side: BorderSide(color: mSecondaryTextColor),
              ),
              
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return LogIN();
                },),);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical:16),
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  "Log In",
                  style: TextStyle(
                     color: Colors.red,
                     fontSize: 18.0,
                     fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width:30),
        ],
      )
    );
  }
}

