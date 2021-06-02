import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:innpresa/categories/category.dart';
import 'package:innpresa/categories/category_widget.dart';
import 'package:innpresa/events_page/events_page_background.dart';
import 'package:innpresa/form_cadastro_evento/form_evento_screen.dart';
import 'package:innpresa/login/login_page.dart';
import 'package:innpresa/tiles/event_tile.dart';
import 'package:innpresa/tiles/organizer_event_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventsPage extends StatefulWidget {
  String id;
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  int idSelected = 0;
  String title;
  var users = [];
  void getId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      widget.id = preferences.getString("id");
    });
  }

  @override
  void initState() {
    super.initState();
    getId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FormEvento()));
        },
        child: Icon(Icons.add_rounded, size: 30),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
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
                          "Inn",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.amber),
                        ),
                        Text("Presa",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            )),
                        Spacer(),
                        InkWell(
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginPage()));
                          },
                          child: Icon(
                            Icons.exit_to_app_rounded,
                            color: Colors.white60,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
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
                  get_all_events()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  FutureBuilder<QuerySnapshot> get_all_events() {
    print(widget.id);
    if (idSelected == 0) {
      return FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection("eventos").get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            else
              return Column(
                  children: List.generate(
                      snapshot.data.docs.length,
                      (index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child:
                                EventTile(snapshot: snapshot.data.docs[index]),
                          )));
          });
    } else if (idSelected == 1) {
      return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection("eventos")
            .where("idOrganizador", isEqualTo: widget.id)
            .get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else
            return Column(
                children: List.generate(
                    snapshot.data.docs.length,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: OrganizerEventTile(snapshot: snapshot.data.docs[index]),
                        )));
        },
      );
    }
  }
}
