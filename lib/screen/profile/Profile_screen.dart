import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_manager/screen/bootom_nav.dart';
import 'package:travel_manager/screen/login/Sign_In.dart';
import 'package:travel_manager/screen/login/auth_helper.dart';
import 'package:travel_manager/screen/profile/profile_edit.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    function();
    super.initState();
  }

  void function() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    print("yahan aaya tha");
    var profiledata = await FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .get();

    print("yahan aaya tha");
    if (profiledata.data().length > 1) {
      print("1 se badi aa gayi");
      name = profiledata.data()["name"];
      phone = profiledata.data()["phone"];
      email = profiledata.data()["email"];
      address = profiledata.data()["address"];
    } else {
      print("1 se chhoti aa gayi");
      name = "  ";
      phone = "  ";
      email = "  ";
      address = "  ";
    }
    setState(() {
      load = 1;
    });
  }

  Widget profilereturn() {
    if (load == 0)
      return Text("loading.....");
    else
      return Column(
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/tm_logo_small.png',
              ),
              backgroundColor: Colors.transparent,
              radius: 140.0,
            ),
          ),
          Container(
            child: Column(
              children: [
                profileDetail(Icon(Icons.person), "Name", name),
                profileDetail(Icon(Icons.email), "Email Id", email),
                profileDetail(Icon(Icons.phone), "Phone Number", phone),
                profileDetail(Icon(Icons.home), "Address", address),
              ],
            ),
          ),
        ],
      );
  }

  var load = 0;
  var name;
  var phone;
  var email;
  var address;
  static const String signout = "SignOut";
  static const List<String> choice = <String>[signout];
  Widget profileDetail(Widget icon, String heading, String info) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$heading",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "$info",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onSelected: menuoption,
            itemBuilder: (BuildContext context) {
              return choice.map((String choice) {
                return PopupMenuItem(
                  child: Text(choice),
                  value: choice,
                );
              }).toList();
            },
          ),
        ],
        backgroundColor: Colors.grey[900],
      ),
      resizeToAvoidBottomPadding: false,
      body: profilereturn(),
      bottomNavigationBar: BottomNav(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProfileEdit();
              },
            ),
          );
        },
      ),
    );
  }

  void menuoption(String value) {
    if (value == "SignOut") {
      print(value);
      AuthHelper.logOut();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Login()),
          (Route<dynamic> route) => false);
    }
  }
}
