import 'package:flutter/material.dart';

class IconBar extends StatelessWidget {
  Widget custombutton(Widget icont) {
    return FlatButton(
      onPressed: () {},
      child: icont,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: custombutton(Icon(
            Icons.assignment,
            size: 30.0,
          )),
        ),
        Expanded(
          child: custombutton(Icon(
            Icons.museum,
            size: 30.0,
          )),
        ),
        Expanded(
          child: custombutton(Icon(
            Icons.hotel,
            size: 30.0,
          )),
        ),
        Expanded(
          child: custombutton(Icon(
            Icons.restaurant,
            size: 30.0,
          )),
        ),
        Expanded(
          child: custombutton(Icon(
            Icons.shopping_bag,
            size: 30.0,
          )),
        ),
        Expanded(
          child: custombutton(Icon(
            Icons.train,
            size: 30.0,
          )),
        ),
      ],
    );
  }
}
