import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Sign_In.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final editController = TextEditingController();


  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(

            title: Text('ERROR'),
            content: Text(errormessage),

            actions: <Widget>[
              FlatButton(

                  onPressed: () {
                    Navigator.of(context).pop();
                  },


                  child: Text('OK'))
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[900],
      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image:AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            0.0
          ),
          child: Column(
            children: [
              SizedBox(height: 80.0,),
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
              SizedBox(height:40.0),
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/tm_logo_small.png',   
                  ),
                  radius: 60.0,
                  backgroundColor: Colors.transparent,
              ),
              SizedBox(height:25.0),
              Text(
                "Reset Your Password !",
                style:TextStyle(
                  fontSize: 28.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height:50.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color:Colors.white70,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children:[
                      SizedBox(height:20.0),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                        child: TextField(
                          controller: editController,
                          cursorColor: Colors.red,
                          decoration: InputDecoration(                    
                            border: OutlineInputBorder(
                              borderSide:BorderSide(color:Colors.red),
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              size: 26.0,
                              ),
                            labelText:
                             'Email Id',                          
                            hintText:'Enter your Registered Email Id.',                         
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 50,),
                        child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(36),
                        ),
                        color: Colors.black,
                          onPressed: () {
                            resetPassword(context);
                          },
                        child: Container(
                        padding: const EdgeInsets.symmetric(vertical:16,),
                        alignment: Alignment.center,
                          width: double.infinity,
                          child: Text(
                            "Reset Password",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          ),
                        ),
                      
                      ),
                      SizedBox(height:12.0),
                    ],
                  ),
                ), 
              )

            ],
          ),
        ),
      ),
    );
  }
  void resetPassword(BuildContext context) async {
    if (editController.text.length == 0 || !editController.text.contains("@")) {
      showError('Enter valid email');
      return;
    }
    await FirebaseAuth.instance.sendPasswordResetEmail(email: editController.text);
    showError('Reset password link has sent your mail please use it to change the password');
    Navigator.push(context, MaterialPageRoute(builder: (context){return Login();},),);
    Navigator.pop(context);
  }
}