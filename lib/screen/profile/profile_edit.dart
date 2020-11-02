import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_manager/screen/bootom_nav.dart';
import 'package:travel_manager/screen/profile/Profile_screen.dart';

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  TextEditingController namecontroller = TextEditingController(text: "");
  TextEditingController emailcontroller = TextEditingController(text: "");
  TextEditingController phonecontroller = TextEditingController(text: "");
  TextEditingController address = TextEditingController(text: "");
  void firebaseset() async {
    print("aa gaya");

    var firebaseUser = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .set({
      "check": "kuchh",
      "name": namecontroller.text,
      "phone": phonecontroller.text,
      "email": emailcontroller.text,
      "address": address.text,
    }).then((_) {
      print("likh gaya");

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Profile();
          },
        ),
      );
    });
  }

  Widget profileDetail(
    Widget icon,
    String heading,
    TextEditingController controllerv,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, left: 25.0, right: 25.0),
      child: Container(
        height: 50.0,
        child: Padding(
          padding: EdgeInsets.only(left: 0.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  controller: controllerv,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      prefixIcon: icon,
                      labelText: '$heading',
                      hintText: '$heading'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
      ),
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/tm_logo_small.png',
              ),
              backgroundColor: Colors.transparent,
              radius: 120.0,
            ),
          ),
          Container(
            child: Column(
              children: [
                profileDetail(
                  Icon(Icons.person),
                  "Name",
                  namecontroller,
                ),
                profileDetail(Icon(Icons.email), "Email Id", emailcontroller),
                profileDetail(
                    Icon(Icons.phone), "Phone Number", phonecontroller),
                profileDetail(
                  Icon(Icons.home),
                  "Address",
                  address,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.done,
          color: Colors.white,
        ),
        onPressed: () {
          firebaseset();
        },
      ),
    );
  }
}
