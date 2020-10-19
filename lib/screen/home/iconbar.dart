import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/placeprofile.dart';
import 'package:travel_manager/screen/home/seemore.dart';

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
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SeeMore(name: "$screen");
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
            "Place to Visit",
            context,
          ),
        ),
        Expanded(
          child: custombutton(
            Icon(
              Icons.hotel,
              size: 30.0,
            ),
            "Hotels",
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
