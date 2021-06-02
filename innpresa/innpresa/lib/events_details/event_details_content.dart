import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventDetailsContent extends StatelessWidget {
  final DocumentSnapshot snapshot;

  const EventDetailsContent({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(alignment: Alignment.topLeft, children: [
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
              child: Text(
                snapshot.get("nome"),
                style: TextStyle(
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.24),
              child: FittedBox(
                child: Row(
                  children: [
                    Text("-",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        )),
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(snapshot.get("local"),
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, top: 10),
              child: Text(
                "PARTICIPANTES",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ClipOval(
                      child: Image.network(
                        "https://pbs.twimg.com/profile_images/1396450345593802752/AVaQ1oQP_400x400.jpg",
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Text(
                "DIA",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 12.0, top: 2),
                child: Text(
                  snapshot.get("dia"),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Text(
                "HORÁRIO",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 12.0, top: 2),
                child: Text(
                  snapshot.get("hora"),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Text(
                "DESCRIÇÃO",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 12.0, top: 2),
                child: Text(
                  snapshot.get("tipo"),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Text(
                "ORGANIZADOR",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 20, left: 8),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      )
    ]);
  }
}
