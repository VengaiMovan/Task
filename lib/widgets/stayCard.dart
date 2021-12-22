import 'package:flutter/material.dart';

class StayCard extends StatefulWidget {
  late final String date, description, address;

  StayCard({required this.date, required this.description, required this.address});

  @override
  _StayCardState createState() => _StayCardState();
}

class _StayCardState extends State<StayCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.date),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.home_work_outlined, color: Color(0xff00a651)),
                  title: Text(widget.description, style: TextStyle(color: Colors.black87),),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.amber,),
                      Text("4.5")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 15),
                  child: Text(widget.address),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Checkin"),
                            Text("15 Apr - 20:35"),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset("images/hotel.jpg", width: 105,),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Check Out"),
                            Text("15 Apr - 20:35"),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset("images/hotel.jpg", width: 105,),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}