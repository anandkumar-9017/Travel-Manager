import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/placeprofile.dart';
import 'package:travel_manager/screen/home/seemoretrans.dart';

class TransportList extends StatefulWidget {
  @override
  _TransportListState createState() => _TransportListState();
}

class _TransportListState extends State<TransportList> {
  List<Map> list = List();

  void listbuild() {
    Map<String, String> flights = Map();
    flights["imagelink"] =
        "https://www.thestatesman.com/wp-content/uploads/2020/03/FLIGHTS.jpg";
    flights["name"] = "flights";
    list.add(flights);
    Map<String, String> trains = Map();
    trains["imagelink"] =
        "https://images.assettype.com/swarajya%2F2019-12%2Fe0ae5b78-4f78-43be-90b6-b3b3624a7056%2FManiSudhanshu58_1069069316685889538_20181202_085242_img4.jpg?w=640&q=75&auto=format%2Ccompress";
    trains["name"] = "trains";
    list.add(trains);
    Map<String, String> buses = Map();
    buses["imagelink"] =
        "https://www.sustainable-bus.com/wp-content/uploads/2019/12/Schermata-2019-12-06-alle-09.59.28.png";
    buses["name"] = "Bus";
    list.add(buses);
  }

  Widget customlist(String name, String image) {
    return GestureDetector(
      onTap: () {
        if (name == "flights") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SeeMoretrans(
                  name: "Transport",
                  show: 1,
                );
              },
            ),
          );
        }
        if (name == "trains") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SeeMoretrans(
                  name: "Transport",
                  show: 2,
                );
              },
            ),
          );
        }
        if (name == "Bus") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SeeMoretrans(
                  name: "Transport",
                  show: 3,
                );
              },
            ),
          );
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
        itemCount: 3,
        itemBuilder: (context, int index) {
          return customlist(list[index]['name'], list[index]['imagelink']);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    listbuild();
    return listre();
  }
}
