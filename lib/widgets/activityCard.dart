import 'package:flutter/material.dart';

class ActivityCard extends StatefulWidget {
  late final String location, title, description;

  ActivityCard({required this.location, required this.title, required this.description});

  @override
  _ActivityCardState createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.location),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(widget.title, style: TextStyle(color: Colors.black87),),
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
                  child: Text(widget.description, style: TextStyle(color: Colors.black54),),
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
                            Text("2 May 20:45", style: TextStyle(color: Colors.black54)),
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
                            Text("2 May - 10:30", style: TextStyle(color: Colors.black54)),
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