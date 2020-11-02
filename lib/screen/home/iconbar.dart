import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/placeprofile.dart';
import 'package:travel_manager/screen/home/seemorehotel.dart';
import 'package:travel_manager/screen/home/seemoreplaces.dart';
import 'package:travel_manager/screen/home/seemorerestaurent.dart';
import 'package:travel_manager/screen/home/seemoreshops.dart';
import 'package:travel_manager/screen/home/seemoretrans.dart';

class IconBar extends StatelessWidget {
  Widget custombutton(Widget icont, String screen, BuildContext context) {
    return FlatButton(
      onPressed: () {
        if (screen == "About") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PlaceProfile();
              },
            ),
          );
        }
        if (screen == "Hotel") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SeeMoreHotel(name: "$screen");
              },
            ),
          );
        }
        if (screen == "Places to visit") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SeeMorePlaces(name: "$screen");
              },
            ),
          );
        }
        if (screen == "Shopping Places") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SeeMoreShopes(name: "$screen");
              },
            ),
          );
        }
        if (screen == "Restaurents") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SeeMoreRes(name: "$screen");
              },
            ),
          );
        }
        if (screen == "Transport") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SeeMoretrans(
                  name: "$screen",
                  show: 4,
                );
              },
            ),
          );
        }
      },
      child: icont,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: custombutton(
            Icon(
              Icons.assignment,
              size: 30.0,
            ),
            "About",
            context,
          ),
        ),
        Expanded(
          child: custombutton(
            Icon(
              Icons.museum,
              size: 30.0,
            ),
            "Places to visit",
            context,
          ),
        ),
        Expanded(
          child: custombutton(
            Icon(
              Icons.hotel,
              size: 30.0,
            ),
            "Hotel",
            context,
          ),
        ),
        Expanded(
          child: custombutton(
            Icon(
              Icons.restaurant,
              size: 30.0,
            ),
            "Restaurents",
            context,
          ),
        ),
        Expanded(
          child: custombutton(
            Icon(
              Icons.shopping_bag,
              size: 30.0,
            ),
            "Shopping Places",
            context,
          ),
        ),
        Expanded(
          child: custombutton(
            Icon(
              Icons.train,
              size: 30.0,
            ),
            "Transport",
            context,
          ),
        ),
      ],
    );
  }
}
