import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:innpresa/app_state.dart';
import 'package:innpresa/categories/category.dart';
import 'package:innpresa/categories/category_widget.dart';
import 'package:innpresa/events_page/events_page_background.dart';
import 'package:innpresa/tiles/event_tile.dart';
import 'package:provider/provider.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_rounded, size: 30),
        backgroundColor: Color(0xff29404E),
      ),
      body:
          /*ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: */
          Stack(
        children: [
          EventsPageBackground(
            screenHeight: MediaQuery.of(context).size.height,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(32.0, 10.0, 32.0, 0),
                    child: Row(
                      children: [
                        Text(
                          "InnPresa",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Spacer(),
                        Icon(
                          Icons.person_outline,
                          color: Colors.white60,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text("Eventos",
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(32.0, 24.0, 10.0, 12.0),
                    /*child: Consumer<AppState>(
                          builder: (context, appState, _) =>*/
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (final category in categories)
                            CategoryWidget(category: category)
                        ],
                      ),
                    ),
                  ),
                  /*Consumer<AppState>(
                      builder: (context, appState, _) => */
                  /*Column(
                    children: [*/
                  FutureBuilder<QuerySnapshot>(
                      future: Firestore.instance
                          .collection("eventos")
                          .getDocuments(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        else
                          return ListView.builder(
                              padding: EdgeInsets.all(4.0),
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                return EventTile(
                                    snapshot: snapshot.data.documents[index]);
                              });
                      })
                  //],
                  //),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
