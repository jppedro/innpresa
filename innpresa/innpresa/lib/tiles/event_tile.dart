import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:innpresa/selected_event.dart/SelectedEvent.dart';

class EventTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  const EventTile({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /*Card(
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Container(
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );*/
        Container(
      color: Colors.black,
      height: 50,
      width: 50,
    );
  }
}
