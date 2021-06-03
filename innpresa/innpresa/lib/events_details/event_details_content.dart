import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventDetailsContent extends StatefulWidget {
  final DocumentSnapshot snapshot;
  EventDetailsContent(this.snapshot);
  String id;
  @override
  _EventDetailsContentState createState() => _EventDetailsContentState();
}

class _EventDetailsContentState extends State<EventDetailsContent> {
  String nome;
  var guesses = [];
  @override
  Widget build(BuildContext context) {
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
                widget.snapshot.get("nome"),
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
                    Text(widget.snapshot.get("local"),
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
                  children: List.generate(
                      widget.snapshot.get("funcionarios").length,
                      (index) => Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 8),
                            child: ClipOval(
                              child: Image.network(
                                widget.snapshot.get("funcionarios")[index],
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                  /*ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return ClipOval(
                        child: Image.network(
                          images[index],
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),*/
                  ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.0, top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.calendar_today, size: 40),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "DIA",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          widget.snapshot.get("dia"),
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            /*Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Row(
                children: [
                  Icon(Icons.calendar_today),
                  Text(
                    "DIA",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ],
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
                )),*/
            Padding(
              padding: EdgeInsets.only(left: 5.0, top: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.watch_later_outlined, size: 40),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "HORÁRIO",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          widget.snapshot.get("hora"),
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            /*Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.watch_later_rounded),
                        Text(
                          "HORÁRIO",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      snapshot.get("hora"),
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),*/
            Padding(
              padding: EdgeInsets.only(left: 5.0, top: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.description_outlined, size: 40),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "DESCRIÇÃO",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          widget.snapshot.get("tipo"),
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.0, top: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.person_outline_sharp, size: 40),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ORGANIZADOR",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          widget.snapshot.get("nomeOrganizador"),
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            /*Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Row(
                children: [
                  Icon(Icons.person_outline_sharp),
                  Text(
                    "ORGANIZADOR",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),*/
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

  /*String get_organizer_name(id) {
    print(id);
    FutureBuilder<DocumentSnapshot>(
      future:
          FirebaseFirestore.instance.collection("funcionarios").doc(id).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else
          print(nome);
        return nome = snapshot.data.get("nome");
      },
    );
    return nome;
  }*/

  String get_organizer_name() {}

  /*void get_users_images() async {
    print("ENTROUAAAAAAAAAAAAAAAAAA");
    DocumentSnapshot userSnapshot;
    var image;
    guesses = widget.snapshot.get("funcionarios");
    for (int i = 0; i < guesses.length; i++) {
      userSnapshot = await FirebaseFirestore.instance
          .collection("funcionarios")
          .doc(guesses[i])
          .get()
          .then((value) {
        image = userSnapshot.get("image");
        images.add(image);
      });
      print(images[0].toString());
    }*/

  /*return SingleChildScrollView(
        child: Row(
      children: [
        for (var i in guesses)
          FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("funcionarios")
                .doc(i)
                .get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                Center(
                  child: CircularProgressIndicator(),
                );
              else
                ClipOval(
                  child: Image.network(
                    get_image_link(snapshot),
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                );
            },
          )
      ],
    ));*/
}
/*SingleChildScrollView(
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
                    ),
                ],
              ),*/
