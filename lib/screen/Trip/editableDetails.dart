import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/Home_screen.dart';

class EditableDetails extends StatefulWidget {
  List<String> detailtransfer;
  List<Icon> icontransfer;
  EditableDetails(List<String> detailtransfer, List<Icon> icontransfer) {
    this.detailtransfer = detailtransfer;
    this.icontransfer = icontransfer;
  }
  @override
  _EditableDetailsState createState() =>
      _EditableDetailsState(detailtransfer, icontransfer);
}

class _EditableDetailsState extends State<EditableDetails> {
  List<String> detailtransfer;
  List<Icon> icontransfer;
  _EditableDetailsState(List<String> detailtransfer, List<Icon> icontransfer) {
    this.detailtransfer = detailtransfer;
    this.icontransfer = icontransfer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Home();
                    },
                  ),
                );
              })
        ],
        title: Text("26/10/2020"),
      ),
      body: Container(
          child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: detailtransfer.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 50,
              child: Row(
                children: [
                  icontransfer[index],
                  SizedBox(width: 25.0),
                  Text(detailtransfer[index]),
                  new Spacer(),
                  FlatButton(
                    onPressed: () {},
                    child: Text("X"),
                  )
                ],
              ));
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      )),
    );
  }
}
