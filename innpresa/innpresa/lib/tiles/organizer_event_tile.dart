import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:innpresa/events_details/event_details_page.dart';
import 'package:innpresa/form_editar_evento/form_editar_screen.dart';

class OrganizerEventTile extends StatefulWidget {
  final DocumentSnapshot snapshot;
  const OrganizerEventTile({Key key, this.snapshot}) : super(key: key);

  @override
  _OrganizerEventTileState createState() => _OrganizerEventTileState();
}

class _OrganizerEventTileState extends State<OrganizerEventTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EventDetailsPage(
                  snapshot: widget.snapshot,
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
                child: Image.network(widget.snapshot.get("image")),
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
                            widget.snapshot.get("nome"),
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
                                Text(widget.snapshot.get("local"),
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
                    Padding(
                      padding: EdgeInsets.only(top: 15, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(widget.snapshot.get("dia"),
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w800)),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.watch_later_outlined, size: 20),
                              SizedBox(width: 3),
                              Text(
                                widget.snapshot.get("hora"),
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RawMaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FormEditarEvento(
                                  widget.snapshot,
                                )));
                      },
                      elevation: 1.0,
                      fillColor: Color.fromRGBO(143, 148, 251, 1),
                      child: Icon(
                        Icons.create_rounded,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection("eventos")
                            .doc(widget.snapshot.id)
                            .delete();
                      },
                      elevation: 1.0,
                      fillColor: Colors.red,
                      child: Icon(
                        Icons.delete,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
