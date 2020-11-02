import 'package:cloud_firestore/cloud_firestore.dart';

class Fetchdata {
  getdata(String city) async {
    DocumentSnapshot snaps = await FirebaseFirestore.instance
        .collection('fetch detaials')
        .doc(city)
        .get();
    if (snaps != null) {
      print('$city mein kuch hai');
    } else
      print('$city mein kuch nahi hai');
  }
}
