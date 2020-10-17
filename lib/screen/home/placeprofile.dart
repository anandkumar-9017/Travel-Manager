import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/seemore.dart';

class PlaceProfile extends StatefulWidget {
  @override
  _PlaceProfileState createState() => _PlaceProfileState();
}

class _PlaceProfileState extends State<PlaceProfile> {
  Widget starrow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: Colors.green,
          size: 12.0,
        ),
        Icon(
          Icons.star,
          color: Colors.green,
          size: 12.0,
        ),
        Icon(
          Icons.star,
          color: Colors.green,
          size: 12.0,
        ),
        Icon(
          Icons.star,
          color: Colors.grey,
          size: 12.0,
        ),
        Icon(
          Icons.star,
          color: Colors.grey,
          size: 12.0,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView(
        children: [
          Stack(
            children: [
              Image.asset('asset/images/lucknow_image.jpg'),
              Positioned(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SeeMore();
                        },
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                left: 5.0,
                top: 10.0,
              ),
              Positioned(
                  child: Text(
                    "Star hotel",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  left: 10.0,
                  bottom: 15.0)
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("About",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                    child: Text(
                        "Star Hotel is 5 star hotel with all the facilities like free wifi and swimming pool"),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Location",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                    child: Text(
                        "118/22 Plot No. 2, Opposite HDFC Bank, Ambedkar Road"),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Rating and Reviews",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("3",
                          style: TextStyle(
                              fontSize: 55.0, fontWeight: FontWeight.w300)),
                      starrow(),
                      Text("35 reviews")
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
