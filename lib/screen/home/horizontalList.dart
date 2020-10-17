import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  Widget starrow() {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.green),
        Icon(Icons.star, color: Colors.green),
        Icon(Icons.star, color: Colors.green),
      ],
    );
  }

  Widget customlist() {
    return Container(
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
            child: Image.asset(
              'assets/images/lucknow_image.jpg',
              height: 100,
              width: 150,
            ),
          ),
          Text("Hotel1"),
          starrow(),
        ],
      ),
    );
  }

  Widget listre() {
    return Container(
      height: 150.0,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          customlist(),
          customlist(),
          customlist(),
          customlist(),
          customlist(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return listre();
  }
}
