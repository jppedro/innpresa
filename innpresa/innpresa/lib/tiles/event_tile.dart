import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:innpresa/events_details/event_details_page.dart';
import 'package:innpresa/selected_event.dart/SelectedEvent.dart';
import 'package:innpresa/style/styleguide.dart';

class EventTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  const EventTile({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EventDetailsPage(
                  snapshot: snapshot,
                )));
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          vertical: 20,
        ),
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Image.network(snapshot.data["image"]),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data["nome"],
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FittedBox(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(snapshot.data["local"],
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xFF000000),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data["dia"],
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w900)),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.watch_later_outlined, size: 20),
                              Text(
                                snapshot.data["hora"],
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
