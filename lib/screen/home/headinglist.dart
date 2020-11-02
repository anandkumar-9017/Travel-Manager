import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/placeprofile.dart';
import 'package:travel_manager/screen/home/seemorehotel.dart';
import 'package:travel_manager/screen/home/seemoreplaces.dart';
import 'package:travel_manager/screen/home/seemorerestaurent.dart';
import 'package:travel_manager/screen/home/seemoreshops.dart';
import 'package:travel_manager/screen/home/seemoretrans.dart';

class HeadingList extends StatelessWidget {
  String heading;
  HeadingList({this.heading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$heading",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
              onPressed: () {
                if (heading == "About") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PlaceProfile();
                      },
                    ),
                  );
                }
                if (heading == "Hotel") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SeeMoreHotel(name: "$heading");
                      },
                    ),
                  );
                }
                if (heading == "Places to visit") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SeeMorePlaces(name: "$heading");
                      },
                    ),
                  );
                }
                if (heading == "Shopping Places") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SeeMoreShopes(name: "$heading");
                      },
                    ),
                  );
                }
                if (heading == "Restaurents") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SeeMoreRes(name: "$heading");
                      },
                    ),
                  );
                }
                if (heading == "Transport") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SeeMoretrans(
                          name: "$heading",
                          show: 4,
                        );
                      },
                    ),
                  );
                }
              },
              child: Text("See All",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  )))
        ],
      ),
    );
  }
}
