import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:innpresa/events_details/event_details_background.dart';
import 'package:innpresa/events_details/event_details_content.dart';

class EventDetailsPage extends StatelessWidget {
  final DocumentSnapshot snapshot;

  const EventDetailsPage({Key key, this.snapshot}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          EventDetailsBackground(snapshot.get("image")),
          EventDetailsContent(snapshot),
        ],
      ),
    );
  }
}
