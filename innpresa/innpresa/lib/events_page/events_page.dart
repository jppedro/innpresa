import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:innpresa/categories/category.dart';
import 'package:innpresa/categories/category_widget.dart';
import 'package:innpresa/events_page/events_page_background.dart';
import 'package:innpresa/tiles/event_tile.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  int idSelected = 0;
  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_rounded, size: 30),
        backgroundColor: Color(0xff29404E),
      ),
      body: Stack(
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
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 24.0, 10.0, 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (final category in categories)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                idSelected = category.categoryId;
                              });
                            },
                            child: CategoryWidget(
                              category: category,
                              isSelected: idSelected == category.categoryId,
                            ),
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
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
                          return Column(
                              children: List.generate(
                                  snapshot.data.documents.length,
                                  (index) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: EventTile(
                                            snapshot:
                                                snapshot.data.documents[index]),
                                      )));
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
