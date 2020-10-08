import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:travel_manager/screen/Home_screen.dart';
import 'package:travel_manager/screen/login/forgot_password.dart';
import 'package:travel_manager/screen/login/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email;
  String password;
  GlobalKey<FormState> formkey= GlobalKey<FormState>();

  void login(){
    if(formkey.currentState.validate()){
      formkey.currentState.save();
      signin(email,password,context).then((value){
      if(value!= null){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)=>Home(),)
        );     
      }
      });
          }
        }
        @override
        Widget build(BuildContext context) {
          return Scaffold(
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
                        backgroundColor: Colors.transparent,
                        radius:60.0,
                    ),
                    SizedBox(height:25.0),
                    Text(
                      "Welcome To LogIn Page !",
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
                        
                        child: Form(
                          key: formkey,
                            child: Column(
                            
                            children: [
                              SizedBox(height:10.0),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextFormField(
                                  cursorColor: Colors.red,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide:BorderSide(color:Colors.red),
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    ),
                                     prefixIcon: Icon(
                                      Icons.person,
                                      size: 28.0,
                                      ),
                                    labelText: 'Email Id',
                                    hintText:'Enter your email i\'d'
                                  ),
                                  validator: MultiValidator(
                                    [
                                      RequiredValidator(errorText: 'This Field is Required'),
                                      EmailValidator(errorText: 'Invalid Email Address')
                                    ],
                                  ),
                                  onChanged: (val){
                                    email=val;
                                  },
                                ),
                              ),
                            
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: TextFormField(
                                  cursorColor: Colors.red,
                                  decoration: InputDecoration(
                                    
                                    border: OutlineInputBorder(
                                      borderSide:BorderSide(color:Colors.red),
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),  
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      size: 26.0,
                                    ),
                                    labelText: 'Password',
                                    hintText:'Enter your password',
                                  ),
                                  validator: MultiValidator(
                                    [
                                      RequiredValidator(errorText: 'Password Is Required'),
                                      MinLengthValidator(6, errorText: 'Minimum 6 Character'),
                                    ],
                                  ),
                                  onChanged: (val){
                                    password=val;
                                  },
                                ),
                              ),
                              FlatButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return ForgotPassword();
                                  },),);
                                },
                                child:Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 50.0,),
                                child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius:BorderRadius.circular(36),
                                ),
                                color: Colors.black,
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return Home();
                                  },),);
                                },
                                child: Container(
                                padding: const EdgeInsets.symmetric(vertical:16),
                                alignment: Alignment.center,
                                  width: double.infinity,
                                  child: Text(
                                    "Log in",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  ),
                                ),
                              
                              ),
                              FlatButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return Register();
                                  },),);
                                },
                                child:Text(
                                  'Not Registered? Register Here!',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      
        signin(String email, String password, BuildContext context) {}
}