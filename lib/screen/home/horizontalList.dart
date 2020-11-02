import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/hotelprofilehome.dart';
import 'package:travel_manager/screen/home/placeprofile.dart';
import 'package:travel_manager/screen/home/placesprofilehome.dart';
import 'package:travel_manager/screen/home/resprofilehome.dart';
import 'package:travel_manager/screen/home/shopprofilehome.dart';

class HorizontalList extends StatefulWidget {
  List<Map> list;
  var name;
  HorizontalList({this.list, this.name});
  @override
  _HorizontalListState createState() =>
      _HorizontalListState(list: list, checkname: name);
}

class _HorizontalListState extends State<HorizontalList> {
  List<Map> list;
  var checkname;

  _HorizontalListState({this.list, this.checkname});
  Widget starrow() {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.green),
        Icon(Icons.star, color: Colors.green),
        Icon(Icons.star, color: Colors.green),
      ],
    );
  }

  Widget customlist(String name, String image, var keydata) {
    return GestureDetector(
      onTap: () {
        if (checkname == 'Hotel') {
          print(keydata);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HotelProfile(keydata);
              },
            ),
          );
        } else if (checkname == 'Places to visit') {
          print(keydata);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PlacesProfile(keydata);
              },
            ),
          );
        } else if (checkname == 'Restaurents') {
          print(keydata);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ResProfile(keydata);
              },
            ),
          );
        } else if (checkname == 'Shopping Places') {
          print(keydata);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ShopProfile(keydata);
              },
            ),
          );
        } else {
          print(checkname);
          print("fucking shit happened again");
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Image.network(
                image,
                height: 100,
                width: 150,
              ),
            ),
            Text("$name"),
            starrow(),
          ],
        ),
      ),
    );
  }

  Widget listre() {
    return Container(
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, int index) {
          return customlist(list[index]['name'], list[index]['imagelink'],
              list[index]['key']);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return listre();
  }
}
