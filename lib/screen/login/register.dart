import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/Home_screen.dart';
import 'package:travel_manager/screen/login/Sign_In.dart';

import 'auth_helper.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();

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
        });
  }

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[900],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
            children: [
              SizedBox(
                height: 80.0,
              ),
              Center(
                child: Text(
                  "Travel Mania ",
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/tm_logo_small.png',
                ),
                backgroundColor: Colors.transparent,
                radius: 60.0,
              ),
              SizedBox(height: 25.0),
              Text(
                "Register Yourself Here!",
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Form(
                    child: Column(
                      children: [
                        SizedBox(height: 15.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 7),
                          child: TextFormField(
                            controller: _emailController,
                            cursorColor: Colors.red,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                size: 28.0,
                              ),
                              labelText: 'Email Id',
                              hintText: 'Enter your email i\'d',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 7),
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            cursorColor: Colors.red,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                size: 26.0,
                              ),
                              labelText: 'Password',
                              hintText: 'Enter your password',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 7),
                          child: TextFormField(
                            obscureText: true,
                            controller: _confirmPasswordController,
                            cursorColor: Colors.red,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                size: 26.0,
                              ),
                              labelText: 'Confirm Password',
                              hintText: 'Re-Enter your password',
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 0.0,
                            horizontal: 50,
                          ),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36),
                            ),
                            color: Colors.black,
                            onPressed: () async {
                              if (_emailController.text.isEmpty ||
                                  _passwordController.text.isEmpty) {
                                print("Email and password cannot be empty");
                                showError('Email and password cannot be empty');
                                return;
                              }
                              if (_confirmPasswordController.text.isEmpty ||
                                  _passwordController.text !=
                                      _confirmPasswordController.text) {
                                print("confirm password does not match");
                                showError('Passwords do not match');
                                return;
                              }
                              if (!_emailController.text.contains("@") ||
                                  !_emailController.text.contains(".")) {
                                showError('Enter a valid email');
                                return;
                              }
                              try {
                                final user = await AuthHelper.signupWithEmail(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                                if (user != null) {
                                  print("signup successful");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Home();
                                      },
                                    ),
                                  );
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              alignment: Alignment.center,
                              width: double.infinity,
                              child: Text(
                                "Sign UP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Login();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Already registered? Sign In Here',
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
}
