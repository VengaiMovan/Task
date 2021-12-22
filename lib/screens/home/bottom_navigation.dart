
import 'package:flutter/material.dart';

Widget bottomBar(context, color) {
    return  Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50))
        ),
        height: MediaQuery.of(context).size.width / 8.5,
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("₹8,50,000 / ", style: TextStyle(color: Colors.black87, fontSize: 26, fontWeight: FontWeight.w800)),
                  Text("Adult", style: TextStyle(color: Colors.black87)),
                ],
              ),
            ),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45.0),
                ),
                child: Container(
                  color: color,
                  alignment: Alignment.center,
                  child: Text("BOOK NOW", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      );
}
